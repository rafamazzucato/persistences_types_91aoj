import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget(
      {super.key,
      required this.leading,
      required this.title,
      required this.subtitle,
      required this.onLongPress});

  final String leading;
  final String title;
  final String subtitle;
  final void Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          child: ListTile(
            leading: Text(leading),
            title: Text(title),
            subtitle: Text(subtitle),
            onLongPress: onLongPress,
          ),
        ));
  }
}
