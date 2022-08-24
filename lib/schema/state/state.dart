class DeviceStateItem {
  DeviceStateItem({
    required this.position,
    required this.state,
    required this.userposition,
    required this.isAccepted,
    required this.userId,
  });

  factory DeviceStateItem.fromJson(Map<String, dynamic> j) => DeviceStateItem(
        position: DevicePosition.values.firstWhere(
          (element) => element.name == j['position'].toString(),
        ),
        state: DeviceState.values.firstWhere(
          (state) => state.name == j['state'].toString(),
        ),
        userposition: int.tryParse(j['user_position'].toString()),
        isAccepted: j['accept_status']?.toString() == 'true',
        userId: int.tryParse(j['user_id'].toString()),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'position': position.name,
        'state': state.name,
        'user_position': userposition,
        'is_accepted': isAccepted,
        'user_id': userId,
      };

  /// 当該デバイスの位置
  final DevicePosition position;

  /// デバイスの状態
  final DeviceState state;

  /// ユーザーID
  final int? userposition;

  /// Controllerによる承認
  final bool? isAccepted;

  /// ユーザID
  final int? userId;
}

enum DeviceState {
  /// 待機中・終了
  waiting,

  /// Controllerによる実行許可待ち
  ///
  starting,

  /// 実行開始
  running,
}

/// 続行するかどうか
enum AcceptState {
  /// Controllerによる続行許可
  yes,

  /// Controllerによる続行許可待ち
  no,
}

enum DevicePosition {
  register(0),
  projector1(1),
  projector2(2),
  projector3(3),
  result(0);

  final int positionId;
  const DevicePosition(this.positionId);
}
