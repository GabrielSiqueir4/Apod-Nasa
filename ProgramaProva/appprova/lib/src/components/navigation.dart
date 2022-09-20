// ignore_for_file: prefer_const_constructors
import 'package:appprova/src/models/previsao_model.dart';
import 'package:appprova/src/screens/apod_pages/apod_day.dart';
import 'package:appprova/src/screens/apod_pages/apod_page.dart';
import 'package:appprova/src/screens/favorito_page/favoritos_page.dart';
import 'package:appprova/src/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int paginaAtual = 0;
  late PageController pc;

  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
      
        children: [
          HomePage(),
          ApodsPage(),
          ApodPage(),
          /*
          FavoritasPage(),
          */
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        backgroundColor: Color.fromARGB(255, 95, 95, 95),
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.orange,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_rounded,
              color: Colors.orange,
            ),
            label: 'Imagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: Colors.orange,
            ),
            label: 'Favoritos',
          ),
        ],
        onTap: (pagina) {
          pc.animateToPage(pagina,
              duration: const Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
