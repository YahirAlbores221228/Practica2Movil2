import 'package:flutter/material.dart';

class Registers extends StatefulWidget {
  const Registers({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Registers> {
  String nombre = '';

  final TextEditingController _controller =
      TextEditingController(); // Controlador para el TextField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Barra superior de la pantalla
        title: const Text('Inicio',
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
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra los elementos en la columna
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller, // Asocia el controlador al TextField
                cursorColor: Colors.orange,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  labelText: 'Ingrese algun texto',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    backgroundColor: WidgetStateProperty.all(Colors.orange),
                  ),
                  onPressed: () {
                    setState(() {
                      nombre = _controller.text;
                    });
                  },
                  child: const Text('Enviar', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            Text('Hola bienvenido $nombre',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1.2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
