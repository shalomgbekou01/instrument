import 'package:flutter/material.dart';
import 'package:instrument/widgets/app_bar.dart';
import 'package:instrument/widgets/product_card.dart';

class ConsultScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      title: 'Portatif',
      imageUrl: "assets/images/portatif.jpeg",
      price: 103.0,
      likes: 4,
      promo: false,
    ),
    Product(
      title: 'Enceinte',
      imageUrl: 'assets/images/enceinte.jpeg',
      price: 11.7,
      likes: 10,
      promo: false,
    ),
    Product(
      title: 'Table de mixage',
      imageUrl: 'assets/images/mixage.jpeg',
      price: 60000.0,
      likes: 2,
      promo: false,
    ),
    Product(
      title: 'Piano moderne',
      imageUrl: 'assets/images/maitre.jpeg',
      price: 90000.0,
      likes: 7,
      promo: true,
    ),
    Product(
      title: 'Guitare basse',
      imageUrl: 'assets/images/basse.jpeg',
      price: 90000.0,
      likes: 7,
      promo: false,
    ),
    Product(
      title: 'Micro',
      imageUrl: 'assets/images/micro.jpeg',
      price: 90000.0,
      likes: 7,
      promo: false,
    ),
    Product(
      title: 'Micro',
      imageUrl: 'assets/images/micro.jpeg',
      price: 90000.0,
      likes: 7,
      promo: false,
    ),
    Product(
      title: 'Micro',
      imageUrl: 'assets/images/micro.jpeg',
      price: 90000.0,
      likes: 7,
      promo: false,
    ),
  ];

  ConsultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "MediaStore"),
      drawer: const Drawer(),

      body: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            
            TextField(
              decoration: InputDecoration(
                hintText: "Rechercher...",
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                prefixIcon: const Icon(Icons.search, size: 25),
              ),
            ),

            const SizedBox(height: 10),
            
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,       
                  crossAxisSpacing: 12,     
                  mainAxisSpacing: 15,      
                  childAspectRatio: 0.95,  
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: SizedBox(
          height: 38,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_circle, size: 18),
            label: const Text("Nouveau", style: TextStyle(fontSize: 14)),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color.fromRGBO(106, 157, 235, 1),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}