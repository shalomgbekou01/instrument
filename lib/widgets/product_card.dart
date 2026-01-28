import 'package:flutter/material.dart';

class Product {
  final String title;
  final String imageUrl;
  final double price;
  final int likes;
  final bool promo;

  Product({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.likes,
    this.promo = false,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
              child: Image.asset(
                product.imageUrl,
                width: 150,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                
                const SizedBox(width: 6),

                const Icon(Icons.favorite_border_outlined),

                const SizedBox(width: 10,),

                Text(
                  "(${product.likes})",
                ),
                  
              ],
            ),

            SizedBox(height: 8),

            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: product.promo ? Colors.green : const Color.fromARGB(255, 255, 199, 59),
                borderRadius: BorderRadius.circular(5),
                
              ),
              child: Text(
                "Prix: ${product.price}",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}







// class ProductCard extends StatelessWidget {
//   final Product product;

//   const ProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 230, 217, 226), 
//         borderRadius: BorderRadius.circular(12),
//       ),

//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [

//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(12),
//               topRight: Radius.circular(12),
//             ),

//             child: AspectRatio(
//               aspectRatio: 16 / 9,
//               child: Image.asset(
//                 product.imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           const SizedBox(height: 8),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Row(
//               children: [
               
//                 Expanded(
//                   child: Text(
//                     product.title,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(width: 4),

//                 const Icon(
//                   Icons.favorite_border,
//                   size: 16,
//                   color: Colors.black54,
//                 ),

//                 const SizedBox(width: 2),

//                 Text(
//                   '(${product.likes})',
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//          const SizedBox(height: 12,),

        
//           Padding(
//             padding: const EdgeInsets.all(8.0),

//             child: Container(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//               decoration: BoxDecoration(
//                 color: product.promo ? Colors.green : Colors.orange,
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               child: Text(
//                 'Prix: ${product.price}',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }