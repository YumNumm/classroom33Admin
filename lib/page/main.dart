// ignore_for_file: use_build_context_synchronously

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
      physics: const BouncingScrollPhysics(),
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
                                    e.bigQuestionState.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Text(
                                    "ユーザID:${e.userId} ライドID:${e.bigQuestionGroupId}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
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
                if (data.every((e) =>
                    e.bigQuestionState == BigQuestionState.waitingForAdmin))
                  FloatingActionButton.extended(
                    onPressed: () async {
                      final res = await Supabase.instance.client
                          .rpc('start_all')
                          .execute();
                      if (res.error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(res.error!.message),
                          ),
                        );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("全てのライドを開始しました"),
                        ),
                      );
                    },
                    label: const Text("全体開始承認"),
                    icon: const Icon(Icons.check),
                  ),
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, trace) => Text(error.toString()),
          ),
    );
  }
}
