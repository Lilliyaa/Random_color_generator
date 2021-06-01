import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/strings.dart';
import 'design/my_flat_button.dart';
import 'random_color.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _currentBackgroundColor = RandomColor.defaultColor;
  PreferredColor _preferredColor;

  @override
  void initState() {
    super.initState();
    _loadPreferredColor();
    _initFirstColor();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: _currentBackgroundColor,
        body: Center(
          child: Text(
            Strings.HEY_THERE,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.blueGrey.withOpacity(0),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: _preferredColor == PreferredColor.red
                  ? Colors.red
                  : _preferredColor == PreferredColor.green
                      ? Colors.green
                      : _preferredColor == PreferredColor.blue
                          ? Colors.blue
                          : Colors.transparent,
            ),
            child: Icon(Icons.favorite_border),
          ),
          onPressed: () {
            _showAlertToChooseColor();
          },
        ),
      ),
      onTap: () {
        _changeBackgroundColorOnRandom();
      },
    );
  }

  void _initFirstColor() async {
    Color firstColor = await RandomColor.initFirstColor();
    setState(() {
      _currentBackgroundColor = firstColor;
    });
  }

  void _changeBackgroundColorOnRandom() async {
    Color newBackgroundColor =
        await RandomColor.generateRandomColor(_preferredColor);
    setState(() {
      _currentBackgroundColor = newBackgroundColor;
    });
  }

  void _showAlertToChooseColor() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(
                Strings.CHOOSE_COLOR,
                textAlign: TextAlign.center,
              ),
              actions: [
                MyFlatButton(
                  backgroundColor: Colors.red,
                  onTap: () {
                    _setPreferredColor(PreferredColor.red);
                  },
                ),
                MyFlatButton(
                  backgroundColor: Colors.blue,
                  onTap: () {
                    _setPreferredColor(PreferredColor.blue);
                  },
                ),
                MyFlatButton(
                  backgroundColor: Colors.green,
                  onTap: () {
                    _setPreferredColor(PreferredColor.green);
                  },
                ),
                MyFlatButton(
                  multiColors: true,
                  onTap: () {
                    _setPreferredColor(PreferredColor.any);
                  },
                ),
              ]);
        });
  }

  void _setPreferredColor(PreferredColor color) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    switch (color) {
      case PreferredColor.red:
        await sharedPreferences.setInt(
            'preferredColor', PreferredColor.red.index);
        break;
      case PreferredColor.blue:
        await sharedPreferences.setInt(
            'preferredColor', PreferredColor.blue.index);
        break;
      case PreferredColor.green:
        await sharedPreferences.setInt(
            'preferredColor', PreferredColor.green.index);
        break;
      case PreferredColor.any:
        await sharedPreferences.setInt(
            'preferredColor', PreferredColor.any.index);
        break;
    }

    setState(() {
      _preferredColor = color;
    });
    Navigator.of(context).pop(true);
    _changeBackgroundColorOnRandom();
  }

  void _loadPreferredColor() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int index = (sharedPreferences.getInt('preferredColor') ??
        PreferredColor.any.index);
    setState(() {
      _preferredColor = PreferredColor.values[index];
    });
  }
}




