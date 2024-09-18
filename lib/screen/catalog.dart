import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CatalogScreen(),
    );
  }
}

class CatalogScreen extends StatefulWidget {
  @override
  Catalog createState() => Catalog();
}

class Catalog extends State<CatalogScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http
        .get(Uri.parse('http://192.168.100.6:3000/floreria/catalogproducts'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        products = data.map((item) => Product.fromJson(item)).toList();
      });
    } else {
      showErrorAlertDialog(context, 'Error loading products: ${response.body}');
    }
  }

  void showErrorAlertDialog(BuildContext context, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalago de Productos',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
      ),
      body: products.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(products[index].name,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.orange)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(products[index].description,
                              style: const TextStyle(fontSize: 12)),
                          Text(
                            'Stock: ${products[index].stock}',
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ), // Añadir stock aquí
                        ],
                      ),
                      trailing: Text(
                        '\$${products[index].price}',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.green),
                      ),
                    ));
              },
            ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final int stock;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      stock: (json['stock'] ?? 0) as int,
    );
  }
}
