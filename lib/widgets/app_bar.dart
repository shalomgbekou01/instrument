import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;

  const MyAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true, 

      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 22,
          color: Colors.white
        ),
      ),

      // leading: const Icon(Icons.list),

      actions: [
        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.settings),
        ),
      ],
      backgroundColor: Color.fromRGBO(106, 157, 235, 1)

    );
  }
}
