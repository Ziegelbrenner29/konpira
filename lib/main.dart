// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konpira/screens/home_screen.dart';
import 'package:konpira/providers/bgm_provider.dart';
import 'package:konpira/providers/settings_provider.dart';   // ← wichtig!

final routeObserver = RouteObserver<ModalRoute<void>>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // ★★★★★ ASYNC BOOTSTRAP – Theme aus Speicher laden ★★★★★
  final initialSettingsNotifier = await SettingsNotifier.create();

  runApp(
    ProviderScope(
      overrides: [
        // Wir überschreiben den normalen Provider mit unserem geladenen Notifier
        settingsProvider.overrideWith((ref) => initialSettingsNotifier),
      ],
      child: const KonpiraApp(),
    ),
  );
}

class KonpiraApp extends ConsumerStatefulWidget {
  const KonpiraApp({super.key});

  @override
  ConsumerState<KonpiraApp> createState() => _KonpiraAppState();
}

class _KonpiraAppState extends ConsumerState<KonpiraApp> {
  @override
  void initState() {
    super.initState();
    // BGM startet sofort mit dem (jetzt persistenten!) Theme
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bgmProvider).updateThemeAndPlayIfAllowed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '金比羅',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Zen',
        scaffoldBackgroundColor: const Color(0xFFF5F0E1),
      ),
      home: const HomeScreen(),
      navigatorObservers: [routeObserver],
    );
  }
}
