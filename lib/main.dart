import 'package:buahtangan/app/helpers/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:buahtangan/app/themes/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Utils.initializedNavBar(bindings: AppPages.NAV_PAGE_BINDINGS);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth auth = FirebaseAuth.instance;

  runApp(
    StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snap){
        if(snap.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return GetMaterialApp(
          title: "BuahTangan",
          initialRoute: snap.data != null ? Routes.DASHBOARD :AppPages.INITIAL,
          getPages: AppPages.routes,
          locale: const Locale('id', 'ID'),
          fallbackLocale: const Locale('id', 'ID'),
          // theme: AppTheme.light,
          // darkTheme: AppTheme.dark,
          // themeMode: ThemeMode.system,
        );
      }
    ),
  );
}
