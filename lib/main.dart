import 'package:english_words/english_words.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:malshi_app/pages/login_page.dart';
import 'package:malshi_app/pages/signup_page.dart';
import 'package:malshi_app/providers/user_provider.dart';
import 'package:malshi_app/responsive/mobile_layout.dart';
import 'package:malshi_app/responsive/responsive_layout.dart';
import 'package:malshi_app/responsive/web_layout.dart';
import 'package:malshi_app/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAkMXbdWHyI3DtdD4BeChwwHSD5_YIjO1g',
          appId: '1:406907909045:web:809200d0112313b9671ffc',
          messagingSenderId: '406907909045',
          projectId: 'malshiapp',
          storageBucket: 'malshiapp.appspot.com'),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          )
        ],
        child: MaterialApp(
          title: 'Namer App',
          theme: ThemeData.dark()
              .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
          // home:
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const ResponsiveLayout(
                    webScreenLayout: WebLayout(),
                    mobileScreenLayout: MobileLayout(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }

              return const LoginPage();
            }),
          ),
        ));
  }
}

class MyAppState extends ChangeNotifier {}
