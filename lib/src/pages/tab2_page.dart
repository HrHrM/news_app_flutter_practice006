import 'package:flutter/material.dart';
import 'package:news_app_fernando/src/models/category_models.dart';
import 'package:news_app_fernando/src/services/news_service.dart';
import 'package:news_app_fernando/src/theme/tema.dart';
import 'package:news_app_fernando/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListaCategorias(),
            Expanded(
                child: ListaNoticias(
              noticias: newsService.getArticulosCategoriaSeleccionada,
            ))
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int i) {
          final cName = categories[i].name;
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                CategoryButton(
                  categoria: categories[i],
                ),
                SizedBox(height: 5),
                Text(cName[0].toUpperCase() + cName.substring(1)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.categoria,
  }) : super(key: key);

  final Category categoria;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          categoria.icon,
          color: (newsService.selectedCategory == categoria.name)
              ? miTema.colorScheme.secondary
              : Colors.black54,
        ),
      ),
    );
  }
}
