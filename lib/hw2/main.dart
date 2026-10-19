import 'package:flutter/material.dart';
import 'package:flutter_application_1/hw2/ui/screens/catalog_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationThemeData(
          fillColor: Colors.white,
             filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: CatalogScreen(),
    ),
  );
}

