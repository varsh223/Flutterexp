import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class Product{
  String name;
  double price;
  int quantity;

  Product({
    required this.name, required this.price, required this.quantity
  });
}


class MyApp extends StatelessWidget {
  MyApp({super.key});
final List<Product> productList = [
  Product(name: "Laptop", price: 100000, quantity: 5),
  Product(name: "HP Laptop", price: 90000, quantity: 10),
  Product(name: "Samsung Mobile", price: 80000, quantity: 15),
  Product(name: "Smart TV", price: 45000, quantity: 10),
  Product(name: "OnePlus Mobile", price: 60000, quantity: 5)
];
  @override
  Widget build(BuildContext context ){
    return MaterialApp(
      title: "Dynamic ListView",
      home: Scaffold(
        appBar: AppBar(title: Text("Dynamic ListView"), 
        backgroundColor: const Color.fromARGB(255, 245, 109, 154)),
      
      body: ListView.builder( itemCount: productList.length, itemBuilder: (context, index){
        final product = productList[index];
        return Column(children:[
          ListTile(leading: CircleAvatar(child: Text(product.name[0]),),
          title: Text(product.name),
          subtitle: Text("₹${product.price}, Quantity: ${product.quantity}"),
          trailing: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white
            ),
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Product Order form'),
                  content: Text("${product.name} order is placed."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Ok'))
                  ]) 
                  );
            }, 
            child: Text("Order More"),
            
            ),
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${product.name} is selected"),
                duration: Duration(seconds: 2))
              );
            }
          )
        ],);
      }
      ),
      ));
  }
}