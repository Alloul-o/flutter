import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Function onAction;
  const DrawerItemWidget({Key? key,
    required this.title,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.onAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    ListTile(
      leading:Icon(leadingIcon,color: Colors.green,),
      trailing: Icon(trailingIcon,color: Colors.green,),
      title: Text(title,style: Theme.of(context).textTheme.headline6,),
      onTap: ()=>onAction(),
    );
  }
}
