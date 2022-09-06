// import 'package:flutter/material.dart';

// import 'package:dsi_2021_2/models/build_card_model.dart';
// import 'package:dsi_2021_2/views/shared/constants.dart';

// class CardView extends StatefulWidget {
//   const CardView({Key? key}) : super(key: key);

//   @override
//   State<CardView> createState() => _CardViewState();
// }

// class _CardViewState extends State<CardView> {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2,
//       padding: const EdgeInsets.all(16.0),
//       childAspectRatio: 8.0 / 9.0,
//       children: [
//         Card(
//           clipBehavior: Clip.antiAlias,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 // Todo: recuperar Pair
//                 pair.asPascalCase,
//                 style: Constants.bigSizeFont,
//               ),
//               IconButton(
//                 icon: Icon(
//                   // Todo: recuperar alreadySaved
//                   alreadySaved ? Icons.favorite : Icons.favorite_border,
//                   semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
//                 ),
//                 color: alreadySaved ? Colors.red : null,
//                 onPressed: () {
//                   setState(
//                     () {
//                       if (alreadySaved) {
//                         _saved.remove(pair);
//                       } else {
//                         _saved.add(pair);
//                       }
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
