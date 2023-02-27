// import 'package:flutter/material.dart';
//
// class SliverAppBarExample extends StatelessWidget
//     implements PreferredSizeWidget {
//   final ScrollController controller;
//
//   const SliverAppBarExample({Key? key, required this.controller,})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       //controller: controller,
//       slivers: [
//         SliverAppBar(
//           title: const Text('SliverAppBar Example'),
//           expandedHeight: 400,
//           stretch: true,
//           flexibleSpace: FlexibleSpaceBar(
//             background: Image.network(
//               'https://fikiwiki.com/uploads/posts/2022-02/1644855597_24-fikiwiki-com-p-kartinki-khd-kachestva-25.jpg',
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Size get preferredSize => Size(200, 400);
// }
