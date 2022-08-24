import 'package:admin/page/main.dart';
import 'package:admin/page/user_register.dart';
import 'package:admin/private/key.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
    debug: kDebugMode,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    ));
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int>(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Controller"),
        elevation: 8,
      ),
      body: Row(
        children: [
          NavigationRail(
            elevation: 5,
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text("MAIN"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people),
                label: Text("REGISTER"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.expand),
                label: Text("EXTENDED"),
              ),
            ],
            onDestinationSelected: (index) => selectedIndex.value = index,
            selectedIndex: selectedIndex.value,
          ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex.value,
              children: const [
                MainPage(),
                UserRegisterPage(),
                Text("EXTENDED"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
