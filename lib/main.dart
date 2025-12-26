import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/home_viewmodel.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel()..loadStations(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BiciCoruña Stats',
        home: const HomeView(),
      ),
    );
  }
}
