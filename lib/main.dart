import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_training/app.dart';
import 'package:provider_training/provider/basket_provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<BasketProvider>(create: (_) => BasketProvider()),
        ],
        child: const MyApp(),
      )
  );
}


