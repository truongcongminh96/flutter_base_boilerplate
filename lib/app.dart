import 'package:flutter/material.dart';
import 'package:flutter_base_structure/data/repository.dart';
import 'package:flutter_base_structure/pages/splash_page.dart';
import 'package:flutter_base_structure/services/theme/theme_service.dart';
import 'package:flutter_base_structure/stores/theme/theme_store.dart';
import 'package:flutter_base_structure/stores/user_store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(
            create: (_) =>
                ThemeStore(ThemeService(ThemeRepository()))..getTheme()),
        Provider<UserStore>(create: (_) => UserStore()),
      ],
      child: Consumer<ThemeStore>(
        builder: (_, ThemeStore value, __) => Observer(
          builder: (_) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Base Application',
            theme: value.theme,
            home: SplashPage(),
          ),
        ),
      ),
    );
  }
}
