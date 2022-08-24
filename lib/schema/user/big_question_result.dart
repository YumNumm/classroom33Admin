import '../question/question_category.dart';
import 'small_question_result.dart';

class BigQuestionResultItem {
  BigQuestionResultItem({
    required this.id,
    required this.title,
    required this.category,
    required this.questions,
  });

  factory BigQuestionResultItem.fromJson(Map<String, dynamic> j) =>
      BigQuestionResultItem(
        id: int.parse(j['id'].toString()),
        title: j['title'].toString(),
        category: QuestionCategory.values
            .firstWhere((e) => e.name == j['category'].toString()),
        questions: List<SmallQuestionResultItem>.generate(
          (j['questions'] as List).length,
          (index) => SmallQuestionResultItem.fromJson(
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

  final int id;
  final String title;
  final QuestionCategory category;
  final List<SmallQuestionResultItem> questions;
}
