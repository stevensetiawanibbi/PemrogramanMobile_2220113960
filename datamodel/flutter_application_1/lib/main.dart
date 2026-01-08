import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root app widget used by the tests and `main()`.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List Demo',
      home: const MyProductPage(),
    );
  }
}

class MyProductPage extends StatefulWidget {
  const MyProductPage({Key? key}) : super(key: key);

  @override
  State<MyProductPage> createState() => _MyProductPageState();
}

class Product{
  String name;
  double price;
  String quantity;

  Product({required this.name,required this.price,required this.quantity});
}

class _MyProductPageState extends State<MyProductPage> {
  List<Product> products = [
    Product(name: 'Milk', price: 64, quantity: '1 Lt'),
    Product(name: 'Sugar', price: 70, quantity: '1 Kg') ,
    Product(name: 'Salt', price: 50, quantity: '1 Kg'),
    Product(name: 'Pulse', price: 130, quantity: '1 Kg'),
    Product(name: 'Butter', price: 64, quantity: '200 Gm')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products'),
                     backgroundColor: Colors.amber),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(products[index].name),
            subtitle: Text(products[index].quantity),
            trailing: Text('${products[index].price} ₹'),
          )
        ),
      ),
    );
  }
}