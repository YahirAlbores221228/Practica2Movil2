// home.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  bool _isPressed = true;

  @override
  Widget build(BuildContext context) {
    final Map<String, Map<String, String>> teamMembers = {
      'Miembro1': {
        'name': 'Yahir Alberto Albores Madrigal',
        'phone': '9612785448',
        'clave': '221228'
      },
    };

    final List<Widget> teamMembersList = teamMembers.entries.map((entry) {
      return Container(
          padding: const EdgeInsets.all(10),
          child: ListTile(
              subtitle: Column(children: [
            Text('${entry.value['name']} (${entry.value['clave']})',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            Row(
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
                const SizedBox(width: 15),
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
            )
          ])));
    }).toList();

    return Scaffold(
        appBar: AppBar(
          //Barra superior de la pantalla
          title: const Text('Contacto',
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
                const Text('Informacion personal',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange)),
                const SizedBox(height: 15),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPressed = !_isPressed;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn,
                      height: _isPressed ? 150 : 200,
                      width: _isPressed ? 150 : 200,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/foto.jpg'),
                        radius: 80,
                      ),
                    )),
                const SizedBox(height: 15),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _isPressed ? 0 : 1,
                  child: IgnorePointer(
                    ignoring: _isPressed,
                    child: Column(
                      children: [
                        const Text(
                          'Ing. Software',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                        const SizedBox(height: 15),
                        Column(
                          children: teamMembersList,
                        ),
                        IconButton(
                            icon: SvgPicture.asset('assets/iconsgit2.svg',
                                height: 40, width: 40),
                            iconSize: 40,
                            padding: const EdgeInsets.all(10),
                            onPressed: () {
                              launch(
                                  "https://github.com/YahirAlbores221228/Api_vivero");
                            }),
                      ],
                    ),
                  ),
                )
              ]),
        ));
  }
}
