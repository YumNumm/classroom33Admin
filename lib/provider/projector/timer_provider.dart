import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/supabase_api.dart';
import '../../schema/state/state.dart';
import '../db_provider.dart';

final onQuestionTimerProvdier =
    StreamProvider.autoDispose<OnQuestionTimerState>(
  (ref) async* {
    for (final state in OnQuestionTimerState.values) {
      yield state;
      log(state.toString(), name: 'onQuestionTimerProvdier');
      await Future<void>.delayed(Duration(milliseconds: state.duration));
    }
    // 全て終わったので、終了処理
    await SupabaseApi.updateDeviceStateItem(
      DeviceState.waiting,
      ref.read(selectedDeviceIdProvider)!,
      isAccepted: false,
    );
  },
);

enum OnQuestionTimerState {
  wait1(0, '開始待機中...'),
  question1(2000, '小問1(20sec)'),
  wait2(2000, '小問2待機(2sec)'),
  question2(2000, '小問2(20sec)'),
  wait3(2000, '小問3待機(2sec)'),
  question3(2000, '小問3(20sec)'),
  end(0, 'お疲れさまでした～');

  const OnQuestionTimerState(this.duration, this.title);
  final int duration;
  final String title;
}
