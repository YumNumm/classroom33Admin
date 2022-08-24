import 'package:admin/schema/question/big_question_item.dart';
import 'package:admin/schema/question/question_category.dart';

class BigQuestionSet {
  final int id;
  final String title;
  final List<BigQuestionItem> questions;
  final QuestionCategory category;

  BigQuestionSet({
    required this.id,
    required this.title,
    required this.questions,
    required this.category,
  });
}
