import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/hw2/ui/screens/catalog_screen.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //vars
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  String? textError;
  int i = DateTime.now().second;
  var isLogin = true;
  String? loginError;
  //vars

  void switchToLogin() {
    setState(() {
      isLogin = !isLogin;
      nameController.clear();
      loginController.clear();
      passwordController.clear();
    });
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            if (textError != null) Text(textError!),
            if (loginError != null) Text(loginError!),
            TextField(
              controller: loginController,
              decoration: InputDecoration(hintText: 'Электронная почта'),
            ),
            if (!isLogin)
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'Никнейм'),
              ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Пароль'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (!isLogin) {
                  setState(() {
                    textError = null;
                    loginError = null;
                  });
                  if (loginController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      nameController.text.isEmpty) {
                    setState(() {
                      textError = 'Все поля должны быть заполнены';
                    });
                    return;
                  }
                  try {
                    i++;
                    final cred = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: 
                          // 'test$i@test.com',
                           loginController.text,
                          password: 
                          // '123456',

                           passwordController.text,
                        );
                    print(cred.user?.uid);

                    if (cred.user != null) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Вы успешно зарегестрированы')),
                      );
                      switchToLogin();
                    }
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      loginError = 'Ошибка: $e';
                    });
                  }
                } else {
                  setState(() {
                    textError = null;
                    loginError = null;
                  });
                  // !вернуть
                  if (loginController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    setState(() {
                      textError = 'Все поля должны быть заполнены';
                    });
                    return;
                  }
                  try {
                    final cred = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                          email: 
                          // 'test@test.com',
                          loginController.text,
                          password:
                          //  '123456',
                          passwordController.text,
                        );
                    if (FirebaseAuth.instance.currentUser != null) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Вы успешно вошли')),
                      );
                    }
                    // if (!mounted) return;
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CatalogScreen()),
                    // );
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      loginError = 'Ошибка: $e';
                    });
                  }
                }
              },

              child: Text(isLogin ? 'Войти' : 'Зарегистрироваться'),
            ),
            InkWell(
              child: Text(isLogin ? 'Нет аккаунта?' : 'Есть аккаунт?'),
              onTap: () {
                switchToLogin();
              },
            ),
          ],
        ),
      ),
    );
  }
}
