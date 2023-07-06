import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:instagram_clone/auth/providers/auth_provider.dart';
import 'package:instagram_clone/auth/screens/splash_screen.dart';
import 'package:instagram_clone/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        builder: EasyLoading.init(),
        theme: ThemeData(
          iconTheme: const IconThemeData(color: AppColors.white),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: AppColors.primarySwatch)
                  .copyWith(
            background: AppColors.black,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.hourGlass
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 20.0
    ..radius = 10.0
    ..progressColor = AppColors.black
    ..backgroundColor = AppColors.white
    ..indicatorColor = AppColors.black
    ..textColor = Colors.black54
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true;
}
