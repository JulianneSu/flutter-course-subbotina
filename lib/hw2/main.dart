import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/hw2/ui/screens/catalog_screen.dart';
import 'package:flutter_application_1/hw2/ui/screens/login_screen.dart';



void main()   async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MaterialApp(
      theme: ThemeData(
         elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 255, 198, 198),
        foregroundColor: Color.fromARGB(255, 94, 30, 30),
      ),
    ),
        inputDecorationTheme: InputDecorationThemeData(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
      ),
      debugShowCheckedModeBanner: false,



      home:  
      //  FirebaseAuth.instance.currentUser == null ? LoginScreen() : CatalogScreen(),
    StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot)
    {
      if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
    }
 if (snapshot.data == null) {
            return LoginScreen();
          }
          return  CatalogScreen();
    }
    )
    ),
  );
}

