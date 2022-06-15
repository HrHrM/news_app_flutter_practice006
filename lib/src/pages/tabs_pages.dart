// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app_fernando/src/pages/tab1_page.dart';
import 'package:news_app_fernando/src/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Kaede',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.diamond_outlined),
          label: 'Phos',
        ),
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  final PageController _pageController = PageController();

  int get paginaActual => _paginaActual;
  set paginaActual(int value) {
    _paginaActual = value;
    //acciones del setter
    _pageController.animateToPage(value,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);

    notifyListeners();
  }

  PageController get pageController => _pageController;
}
