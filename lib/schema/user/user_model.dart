import 'big_question_result.dart';

class UserModel {
  UserModel({
    required this.name,
    required this.bigQuestionGroupId,
    required this.rideId,
    required this.numberOfPeople,
    required this.id,
    required this.createdAt,
    required this.totalPoint,
    required this.results,
  });
  factory UserModel.fromJson(Map<String, dynamic> j) => UserModel(
        name: j['name'].toString(),
        bigQuestionGroupId: int.parse(j['big_question_group_id'].toString()),
        numberOfPeople: int.parse(j['number_of_people'].toString()),
        rideId: int.parse(j['ride_id'].toString()),
        id: int.parse(j['id'].toString()),
        createdAt: DateTime.parse(j['created_at'].toString()),
        totalPoint: int.tryParse(j['total_point'].toString()),
        results: (j['results'] == null)
            ? []
            : List<BigQuestionResultItem>.generate(
                (j['results'] as List).length,
                (index) => BigQuestionResultItem.fromJson(
                  (j['results'] as List)[index] as Map<String, dynamic>,
                ),
              ),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'created_at': createdAt.toIso8601String(),
        'name': name,
        'total_point': totalPoint,
        'results': results.map((e) => e.toJson()).toList(),
        'number_of_people': numberOfPeople.toString(),
      };

  /// ユーザ名
  final String name;

  /// 大問府ループID
  final int bigQuestionGroupId;

  /// 参加人数
  final int numberOfPeople;

  /// ライドID
  final int rideId;

  /// ユーザID
  final int id;

  /// 登録日時
  final DateTime createdAt;

  /// 合計点(確定するまではnull)
  final int? totalPoint;

  /// 大問結果の配列(0~3個)
  final List<BigQuestionResultItem> results;
}
