import 'package:admin/provider/big_question_storage.dart';
import 'package:admin/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ResultPage extends HookConsumerWidget {
  const ResultPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        // 全体の順位表
        Expanded(
          child: Column(
            children: [
              AppBar(
                title: const Text("全体順位"),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () => ref.refresh(topUsersFutureProvider),
                  ),
                ],
              ),
              ref.watch(topUsersFutureProvider).when<Widget>(
                    error: (error, stackTrace) => Text(
                      error.toString(),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    data: (data) {
                      return Column(
                        children: data
                            .map<Widget>(
                              (e) => Card(
                                child: ListTile(
                                  title: Text("第N位: ${e.totalPoint}点"),
                                  subtitle: Text(
                                    DateFormat('yyyy/MM/dd hh:mm頃')
                                        .format(e.createdAt.toLocal()),
                                  ),
                                  leading: Image.asset(
                                    ref
                                        .watch(questionProvider)
                                        .firstWhere(
                                          (element) =>
                                              element.id ==
                                              e.bigQuestionGroupId,
                                        )
                                        .category
                                        .imagePath,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
            ],
          ),
        ),
        const VerticalDivider(),
        // ユーザの得点表
        Expanded(
          child: Column(
            children: [
              AppBar(
                title: const Text("個人得点"),
                actions: const [],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
