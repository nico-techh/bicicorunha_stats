import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/home_view.dart';
import 'viewmodels/home_viewmodel.dart';

void main() {
  runApp(const BiciCorunaApp());
}

class BiciCorunaApp extends StatelessWidget {
  const BiciCorunaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bici Coruña Stats',
        home: const HomeView(),
      ),
    );
  }
}
