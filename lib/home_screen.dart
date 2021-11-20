import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timepass/theme_provider.dart';
import 'counter_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ThemeProvider>(
              builder: (BuildContext context, value, Widget? child) {
            return Switch.adaptive(
              onChanged: (vv) {
                value.toggleTheme(vv);
              },
              value: value.isDarkMode,
            );
          }),
          //this always rebuild builder so consumer is preferable choice
          // Text(context.watch<CounterProvider>().count.toString()),
          Consumer<CounterProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return TextButton.icon(
                  onPressed: () {
                    value.incerement();
                  },
                  icon: const Icon(Icons.ac_unit),
                  label: Text('${value.count}'));
            },
          ),
          Consumer<CounterProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return TextButton.icon(
                  onPressed: () {
                    value.decrement();
                  },
                  icon: const Icon(Icons.ac_unit),
                  label: Text('${value.count}'));
            },
          ),
        ],
      ),
    ));
  }
}
