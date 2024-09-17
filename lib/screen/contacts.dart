// home.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, Map<String, String>> teamMembers = {
      'Miembro1': {
        'name': 'Yahir Alberto Albores Madrigal',
        'phone': '9612785448',
        'clave': '221228'
      },
      'Miembro2': {
        'name': 'Carlos Hiram Culebro Mendez',
        'phone': '9613321460',
        'clave': '213456'
      },
      'Miembro3': {
        'name': 'Carlos Eduardo Chanona Aquino',
        'phone': '9614309361',
        'clave': '221233'
      },
    };

    final List<Widget> teamMembersList = teamMembers.entries.map((entry) {
      return ListTile(
          subtitle: Text('${entry.value['name']} (${entry.value['clave']})',
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  color: const Color.fromARGB(255, 232, 165, 32),
                  icon: const Icon(Icons.phone),
                  onPressed: () async {
                    final phoneNumber =
                        Uri.parse('tel:${entry.value['phone']}');
                    if (await launchUrl(phoneNumber)) {
                      await launchUrl(phoneNumber);
                    } else {
                      throw 'Could not launch $phoneNumber';
                    }
                  },
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  color: const Color.fromARGB(255, 232, 165, 32),
                  icon: const Icon(Icons.message),
                  onPressed: () async {
                    final menssageNumber =
                        Uri.parse('sms:${entry.value['phone']}');
                    if (await launchUrl(menssageNumber)) {
                      await launchUrl(menssageNumber);
                    } else {
                      throw 'Could not launch $menssageNumber';
                    }
                  },
                ),
              )
            ],
          ));
    }).toList();

    return Scaffold(
        appBar: AppBar(
          //Barra superior de la pantalla
          title: const Text('Contactos',
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
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Equipo de Desarrollo',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
                const SizedBox(height: 25),
                Column(
                  children: teamMembersList,
                ),
              ]),
        ));
  }
}
