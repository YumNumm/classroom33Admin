import 'dart:convert';

import 'package:admin/extension/position_color.dart';
import 'package:admin/provider/state_item.dart';
import 'package:admin/schema/state/state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: ref.watch(stateItemsStreamProvider).when<Widget>(
            data: (data) => Column(
              children: [
                ...data
                    .map<Widget>(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: e.position.onPrimary
                                    .map((e) => e.withOpacity(0.7))
                                    .toList(),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    e.position.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Divider(),
                                  Text(
                                    const JsonEncoder.withIndent('  ')
                                        .convert(e),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                FloatingActionButton.extended(
                  onPressed: () async {
                    // PJ1~3を取得
                    // PJ1 = null
                    // PJ2 = PJ1
                    // PJ3 = PJ2
                    // TODO(YumNumm): RPC作成
                    final res = await Future.wait(<Future<dynamic>>[
                      Supabase.instance.client
                          .from("state")
                          .update(<String, dynamic>{
                            'big_question_state':
                                BigQuestionState.waitingForController.name,
                            'big_question_group_id': null,
                          })
                          .eq('position', DevicePosition.projector1)
                          .execute(),
                      Supabase.instance.client
                          .from("state")
                          .update(<String, dynamic>{
                            'big_question_state':
                                BigQuestionState.waitingForController.name,
                            'big_question_group_id': null,
                          })
                          .eq('position', DevicePosition.projector2)
                          .execute(),
                      Supabase.instance.client
                          .from("state")
                          .update(<String, dynamic>{
                            'big_question_state':
                                BigQuestionState.waitingForController.name,
                            'big_question_group_id': null,
                          })
                          .eq('position', DevicePosition.projector3)
                          .execute(),
                    ]);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("更新しました\n$res"),
                      ),
                    );
                  },
                  label: const Text("次に進める"),
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, trace) => Text(error.toString()),
          ),
    );
  }
}
