import 'package:flutter/material.dart';
import 'package:proyect_flutter/screen/products.dart';
import 'contacts.dart';
import 'register.dart';
import 'products.dart';
import 'catalog.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //Barra superior de la pantalla
          title: const Text('Menu de proyectos',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          backgroundColor: Colors.orange,
          shadowColor: Colors.black, //Color de sombra
          elevation: 10.5,
          iconTheme:
              const IconThemeData(color: Colors.white), //Color de icono de menu
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Center(
                  child: Text(
                    'Lista de proyectos',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              ListTile(
                //Elemento de la lista item menu
                title: const Text('Inicio'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Registers()));
                },
              ),
              ListTile(
                title: const Text('Informacion de contacto'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactsScreen()));
                },
              ),
              ListTile(
                title: const Text('Registro de productos'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Products()));
                },
              ),
              ListTile(
                title: const Text('Catalogo de productos'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CatalogScreen()));
                },
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Text('Bienvenido a la aplicacion de proyectos',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.orange,),
                textAlign: TextAlign.center),
          ),
        ));
  }
}
