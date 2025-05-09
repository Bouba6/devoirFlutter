import 'package:flutter/material.dart';

class menuItemPage extends StatefulWidget {
  final String text;
  final IconData icon;
  Function action;

  menuItemPage({
    super.key,
    required this.text,
    required this.icon,
    required this.action,
  });

  @override
  State<menuItemPage> createState() => _menuItemPageState();
}

class _menuItemPageState extends State<menuItemPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(widget.icon),
          title: Text(widget.text, style: const TextStyle(fontSize: 20)),
          onTap: () => widget.action(context),
        ),
        const Divider(),
      ],
    );
  }
}
