
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/supabase_api.dart';
import '../schema/state/state.dart';



final selectedDeviceIdProvider = StateProvider<DevicePosition?>((ref) => null);

final deviceStateStreamProvider =
    StreamProvider.autoDispose<DeviceStateItem>((ref) async* {
  await for (final item in SupabaseApi.getDeviceStateItemStream()) {
    if (ref.read(selectedDeviceIdProvider)?.name == item.position.name) {
      yield item;
    }
  }
});

