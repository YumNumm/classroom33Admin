import 'package:admin/provider/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(deviceStateStreamProvider).when<Widget>(
          data: (data) => Text(data.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, trace) => Text(error.toString()),
        );
  }
}
