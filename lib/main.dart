import 'package:flutter/material.dart';
import 'package:news_app_fernando/src/pages/tabs_pages.dart';
import 'package:news_app_fernando/src/theme/tema.dart';
import 'package:news_app_fernando/src/services/news_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema,
        title: 'Material App',
        home: TabsPage(),
      ),
    );
  }
}
