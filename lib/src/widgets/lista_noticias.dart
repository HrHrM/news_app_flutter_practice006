import 'package:flutter/material.dart';
import 'package:news_app_fernando/src/models/news_models.dart';
import 'package:news_app_fernando/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({Key? key, required this.noticias}) : super(key: key);

  final List<Article>? noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias!.length,
      itemBuilder: (BuildContext context, int i) {
        return _Noticia(
          noticia: noticias![i],
          index: i,
        );
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  const _Noticia({Key? key, required this.noticia, required this.index})
      : super(key: key);

  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(
          noticia: noticia,
          index: index,
        ),
        _TarjetaTitulo(
          noticia: noticia,
        ),
        _TarjetaImagen(
          noticia: noticia,
        ),
        const SizedBox(
          height: 10,
        ),
        _TarjetaBody(
          noticia: noticia,
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        _TarjetaBotones(noticia: noticia),
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones({Key? key, required this.noticia}) : super(key: key);

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: miTema.colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.star_border,
              color: Colors.white,
            ),
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.diamond_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  const _TarjetaBody({Key? key, required this.noticia}) : super(key: key);

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(noticia.description),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  const _TarjetaImagen({Key? key, required this.noticia}) : super(key: key);

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          child: (noticia.urlToImage != null)
              ? FadeInImage(
                  placeholder: const AssetImage('assets/img/giphy.gif'),
                  image: NetworkImage(noticia.urlToImage),
                )
              : const Image(
                  image: AssetImage('assets/img/no-image.png'),
                ),
        ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  const _TarjetaTitulo({Key? key, required this.noticia}) : super(key: key);

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        noticia.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  const _TarjetaTopBar({
    Key? key,
    required this.noticia,
    required this.index,
  }) : super(key: key);

  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(color: miTema.colorScheme.secondary),
          ),
          Text(
            noticia.source.name,
          ),
        ],
      ),
    );
  }
}
