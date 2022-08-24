import 'question_category.dart';
import 'small_question_item.dart';

/// ## 1つの大問データ
/// `question`テーブルで利用(?)
class BigQuestionItem {
  BigQuestionItem({
    required this.id,
    required this.title,
    required this.category,
    required this.questions,
  });

  factory BigQuestionItem.fromJson(Map<String, dynamic> j) => BigQuestionItem(
        id: int.parse(j['id'].toString()),
        title: j['title']?.toString(),
        category: QuestionCategory.values
            .firstWhere((e) => e.name == j['category'].toString()),
        questions: List<SmallQuestionItem>.generate(
          (j['questions'] as List).length,
          (index) => SmallQuestionItem.fromJson(
            (j['questions'] as List)[index] as Map<String, dynamic>,
          ),
        ),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'category': category.name,
        'questions': questions.map((e) => e.toJson()).toList(),
      };

  /// 大問ID
  final int id;

  /// 大問タイトル
  final String? title;

  /// 大問カテゴリ
  final QuestionCategory category;

  /// 小問リスト
  final List<SmallQuestionItem> questions;
}
