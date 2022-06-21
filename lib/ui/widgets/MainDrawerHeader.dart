import 'package:flutter/material.dart';


class MainDrawerHeader extends StatelessWidget {
  const MainDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         DrawerHeader(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green,Colors.blue]
          )
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("images/kigdom.png"),
          ),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.settings))
        ],
      ),
    );
  }
}
