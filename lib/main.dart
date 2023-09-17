import 'package:chat_zen/providers/auth_providers.dart';
import 'package:chat_zen/screens/aftersign.dart';
import 'package:chat_zen/screens/auth_screen.dart';
import 'package:chat_zen/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'chatzen',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:  StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot){
            if(snapshot.hasData){
              return const SplashScreen(whichSrceen: AfterLogin());
            }
            return const SplashScreen(whichSrceen: AuthScreen(),);
          },),
      ),
    );
  }
}

