import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    //   BlocProvider(
    //   create: (_) => CartBloc(),
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Корзина'),
    //       actions: [
    //         BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
    //           List<int> cartItem = cartState.cartItem;
    //           return Positioned(
    //             child: Container(
    //               padding: const EdgeInsets.all(5),
    //               child: Text('${cartItem.length}'),
    //             ),
    //           );
    //         }),
    //       ],
    //     ),
    //     body: Column(
    //       children: [
    //         // Expanded(
    //         //   child: ListView.builder(
    //         //     itemCount: 2,
    //         //     itemBuilder: (context, index) {
    //         //       return const ProductCard();
    //         //     },
    //         //   ),
    //         // ),
    //         const Column(
    //           children: [
    //             Text('К оплате'),
    //             Text('10000 руб.'),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: const Card(
//         elevation: 0,
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Image(
//                   height: 180,
//                   width: 135,
//                   image: AssetImage('assets/images/logo.png'),
//                 ),
//                 Column(
//                   children: [
//                     Text('Name'),
//                     Text('Размер XS'),
//                     Text('1400 руб.'),
//                     Row(
//                       children: [
//                         // IconButton(
//                         //   icon: Icon(Icons.remove),
//                         //   onPressed: () {},
//                         // ),
//                         Icon(Icons.remove),
//                         SizedBox(width: 5),
//                         Text('1 ед.'),
//                         SizedBox(width: 5),
//                         Icon(Icons.add),
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
