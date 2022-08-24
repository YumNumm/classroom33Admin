import 'package:admin/schema/question/big_question_item.dart';
import 'package:admin/provider/big_question_set.dart';
import 'package:admin/schema/question/question_category.dart';
import 'package:admin/schema/question/small_question_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final questionProvider = Provider(
  (ref) => <BigQuestionSet>[
    BigQuestionSet(
      id: 1,
      title: "地理・生物・生物",
      questions: [
        BigQuestionItem(
          id: 1,
          title: "地理",
          category: QuestionCategory.forJhs,
          questions: [
            SmallQuestionItem(
              id: 1,
              questionStatement: "地球で最も大きい大陸は?",
              choices: ["アフリカ大陸", "南極大陸", "北アフリカ大陸", "ユーラシア大陸"],
              correctAnswerIndex: 4,
            ),
            SmallQuestionItem(
              id: 2,
              questionStatement: "世界で面積の大きさが4位内に入らない国は?",
              choices: ["ロシア", "アメリカ", "ブラジル", "カナダ"],
              correctAnswerIndex: 3,
            ),
            SmallQuestionItem(
              id: 3,
              questionStatement: "フランスの国旗の3色が表していないものは?",
              choices: ["平和", "自由", "平等", "博愛"],
              correctAnswerIndex: 1,
            ),
          ],
        ),
        BigQuestionItem(
          id: 2,
          title: "生物",
          category: QuestionCategory.forJhs,
          questions: <SmallQuestionItem>[
            SmallQuestionItem(
              id: 1,
              questionStatement: "次の中で裸子植物なのはどれか?",
              choices: ["ウメ", "ナズナ", "イチョウ", "タンポポ"],
              correctAnswerIndex: 3,
            ),
            SmallQuestionItem(
              id: 2,
              questionStatement: "双子葉類の特徴の組み合わせとして正しいものは?",
              choices: ["ひげ根-平行脈", "ひげ根-綱状脈", "主根と側根-平行脈", "主根と側根-綱状脈"],
              correctAnswerIndex: 4,
            ),
            SmallQuestionItem(
              id: 3,
              questionStatement: "このなかで合弁花類であるものはなにか?",
              choices: ["エンドウ", "サクラ", "ヒマワリ", "アブラナ"],
              correctAnswerIndex: 3,
            ),
          ],
        ),
        BigQuestionItem(
          id: 3,
          title: "生物",
          category: QuestionCategory.forJhs,
          questions: [
            SmallQuestionItem(
              id: 1,
              questionStatement: "この中で軟体動物ではないのはどれか？",
              choices: ["クラゲ", "アサリ", "イカ", "タニシ"],
              correctAnswerIndex: 1,
            ),
            SmallQuestionItem(
              id: 2,
              questionStatement: "甲殻類でないものはどれか？",
              choices: ["ザリガニ", "ダンゴムシ", "ミジンコ", "ウニ"],
              correctAnswerIndex: 4,
            ),
            SmallQuestionItem(
              id: 3,
              questionStatement: "昆虫類が呼吸をしている部分はどこか？",
              choices: ["頭部", "胸部", "腹部", "あし"],
              correctAnswerIndex: 3,
            )
          ],
        ),
      ],
      category: QuestionCategory.forJhs,
    ),
    BigQuestionSet(
      id: 2,
      title: "",
      questions: [
        BigQuestionItem(
          id: 1,
          title: "化学",
          category: QuestionCategory.forJhs,
          questions: [
            SmallQuestionItem(
              id: 1,
              questionStatement: "空気の量が適切な炎の色はどれか?",
              choices: ["うすい赤", "黄色", "うすい青色", "無色"],
              correctAnswerIndex: 3,
            ),
            SmallQuestionItem(
              id: 2,
              questionStatement: "金属の共通の性質として正しくないのはどれか?",
              choices: ["磁石につく", "磨くと金属光沢が出る", "天性と延性がある", "電気を通し熱を伝える"],
              correctAnswerIndex: 1,
            ),
            SmallQuestionItem(
              id: 3,
              questionStatement: "水上置換法で集められないきたいはどれか?",
              choices: ["水素", "酸素", "二酸化炭素", "アンモニア"],
              correctAnswerIndex: 4,
            ),
          ],
        ),
        BigQuestionItem(
          id: 2,
          title: "化学",
          category: QuestionCategory.forJhs,
          questions: [
            SmallQuestionItem(
              id: 1,
              questionStatement: "光源ではないものはどれか?",
              choices: ["太陽", "電灯", "燃えてるろうそく", "月"],
              correctAnswerIndex: 4,
            ),
            SmallQuestionItem(
              id: 2,
              questionStatement: "この中で一番高い音が出る弦はどれか?",
              choices: ["長さ10㎝太さ1㎜", "長さ10㎝太さ2㎜", "長さ20㎝太さ1㎜", "長さ20㎝太さ2㎜"],
              correctAnswerIndex: 1,
            ),
            SmallQuestionItem(
              id: 3,
              questionStatement: "2つの力が釣り合う条件として正しくないのはどれか?",
              choices: ["2力が一直線上にある", "2力の向きが反対", "作用点が同じ", "2力の大きさが等しい"],
              correctAnswerIndex: 3,
            ),
          ],
        ),
        BigQuestionItem(
          id: 3,
          title: "歴史",
          category: QuestionCategory.forJhs,
          questions: [
            SmallQuestionItem(
              id: 1,
              questionStatement: "弥生時代の遺跡はどれか?",
              choices: ["三内丸山遺跡", "登呂遺跡", "岩宿遺跡", "大森貝塚"],
              correctAnswerIndex: 2,
            ),
            SmallQuestionItem(
              id: 2,
              questionStatement: "卑弥呼が使いを送った国はどこか?",
              choices: ["漢", "魏", "晋", "百済"],
              correctAnswerIndex: 2,
            ),
            SmallQuestionItem(
              id: 3,
              questionStatement: "大和朝廷の中心の頭を何と言うか?",
              choices: ["大王", "天皇", "天下", "大君"],
              correctAnswerIndex: 1,
            ),
          ],
        ),
      ],
      category: QuestionCategory.forJhs,
    ),
  ],
);
