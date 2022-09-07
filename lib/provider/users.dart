import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../schema/user/user_model.dart';

final userFutureProvoder = FutureProvider.family.autoDispose<UserModel, int>(
  (ref, id) async {
    final res = await Supabase.instance.client
        .from('users')
        .select()
        .eq('id', id)
        .single()
        .execute();
    if (res.error != null) {
      throw res.error!;
    }
    return UserModel.fromJson(res.data![0] as Map<String, dynamic>);
  },
);

final usersFutureProvider =
    FutureProvider.autoDispose<List<UserModel>>((ref) async {
  final res = await Supabase.instance.client
      .from('users')
      .select()
      .order('id')
      .execute();
  if (res.error != null) {
    throw res.error!;
  }
  return (res.data! as List)
      .map((dynamic e) => UserModel.fromJson(e as Map<String, dynamic>))
      .toList();
});
