import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:snooker_score_table/core/di/di.dart';
import 'package:snooker_score_table/screens/score_board/score_board_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeLeft,
    ]);


    return LayoutBuilder(
      builder: (context, constrains) {
        var width = MediaQuery.of(context).size.height;
        print("layout builder build: $width");

        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: _textThemeData(context, constrains),
            filledButtonTheme: FilledButtonThemeData(
                style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              textStyle: _textStyle(context, constrains),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white, onPrimary: Colors.black),
            useMaterial3: true,
          ),
          home: ScoreBoardScreen.create(),
        );
      }
    );
  }

  TextTheme _textThemeData(BuildContext context, BoxConstraints constrains) {
    if(constrains.maxHeight > 600){
      return _tabletTextTheme(context);
    } else {
      return _phoneTextTheme(context);
    }
  }

  MaterialStateProperty<TextStyle> _textStyle(BuildContext context, BoxConstraints constrains){
    if(constrains.maxHeight > 600){
      return MaterialStateProperty.all(
          const TextStyle(
            color: Colors.black,
            fontSize: 24)
      );
    } else {
      return MaterialStateProperty.all(
          const TextStyle(
              color: Colors.black,
              fontSize: 14)
      );
    }
  }

  TextTheme _tabletTextTheme(BuildContext context){
    print("Loading tablet text theme");
      return Theme.of(context).textTheme.copyWith(
        titleSmall: const TextStyle(fontSize: 40, color: Colors.white),
        titleLarge: const TextStyle(fontSize: 84, color: Colors.white),
        titleMedium: const TextStyle(fontSize: 72, color: Colors.white)
      );
  }

  TextTheme _phoneTextTheme(BuildContext context){
    print("Loading phone text theme");
    return Theme.of(context).textTheme.copyWith(
      titleSmall: const TextStyle(fontSize: 24, color: Colors.white),
      titleLarge: const TextStyle(fontSize: 32, color: Colors.white),
      titleMedium: const TextStyle(fontSize: 32, color: Colors.white),

    );
  }
}
