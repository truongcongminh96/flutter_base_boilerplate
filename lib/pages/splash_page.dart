import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_structure/stores/theme/theme_store.dart';
import 'package:mobx/mobx.dart';

import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ThemeStore themeStore;

  GlobalKey<ScaffoldState> _scaffoldKey;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    themeStore ??= Provider.of<ThemeStore>(context);
    _disposers ??= [
      reaction((fn) => themeStore.isDark, (isDark) {
        _scaffoldKey.currentState ??
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
      })
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: buildSplash(context),
    );
  }

  Widget buildSplash(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: themeStore.isDark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Choose your mode",
              style: TextStyle(fontSize: 26),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              themeStore.isDark ? "Dark mode" : "light mode",
              style: TextStyle(fontSize: 16),
            ),
            IconButton(
                icon: themeStore.isDark
                    ? Icon(Icons.brightness_high)
                    : Icon(Icons.brightness_2),
                onPressed: () {
                  themeStore.switchTheme();
                })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }
}
