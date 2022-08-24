// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:developer';

import 'package:admin/schema/user/user_register_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../schema/state/state.dart';
import '../schema/user/user_model.dart';

class SupabaseApi {
  static Future<UserModel?> getUserData(int? id) async {
    if (id == null) {
      return null;
    }
    final res = await Supabase.instance.client
        .from('users')
        .select()
        .eq('id', id)
        .execute();
    log(res.toJson().toString());
    if (res.hasError) {
      throw Exception(res.error!.toJson());
    }
    final model =
        UserModel.fromJson((res.data as List)[0] as Map<String, dynamic>);
    log('getUserData: model=$model');
    return model;
  }

  /// Projector StateをStreamする
  static Stream<DeviceStateItem> getDeviceStateItemStream() async* {
    final subscription =
        Supabase.instance.client.from('state').stream(['position']).execute();
    await for (final payloads in subscription) {
      for (final payload in payloads) {
        log(payload.toString(), name: 'SupabaseApi');
        yield DeviceStateItem.fromJson(payload);
      }
    }
  }

  /// Projecttor Stateを更新する
  static Future<void> updateDeviceStateItem(
    DeviceState state,
    DevicePosition position, {
    bool? isAccepted,
  }) async {
    final res = await Supabase.instance.client
        .from('state')
        .update(<String, dynamic>{
          'state': state.name,
          if (isAccepted != null) 'accept_status': isAccepted,
        })
        .eq('position', position.name)
        .execute();
    if (res.hasError) {
      throw Exception(res.error!.toJson());
    }
  }

  static Future<UserModel> addNewUser(UserRegisterModel model) async {
    final res = await Supabase.instance.client
        .from("users")
        .insert(model.toJson())
        .execute();
    if (res.hasError) {
      throw Exception(res.error!.toJson());
    }
    log(res.data.toString(), name: 'SupabaseApi');
    return UserModel.fromJson(
      (res.data as List<dynamic>)[0] as Map<String, dynamic>,
    );
  }
}
