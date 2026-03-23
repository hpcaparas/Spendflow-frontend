import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/app_config.dart';
import 'config/env.dart';
import 'app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Env.config = const AppConfig(
    appName: 'SpendFlow PROD',
    baseUrl: 'https://cmhatv.baydsolutions.com/',
    environment: 'qa',
    enableLogging: true,
  );

  await Firebase.initializeApp();

  runApp(const ProviderScope(child: ExpenseManagementApp()));
}

class ExpenseManagementApp extends StatelessWidget {
  const ExpenseManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Env.config.appName,
      initialRoute: AppRoutes.login,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
