import 'package:CountDown_Timer/enums.dart';
import 'package:CountDown_Timer/homePage.dart';
import 'package:CountDown_Timer/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context)=> MenuInfo(MenuType.clock),
        child: HomePage()),
    );
  }
}
