import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  final Icon buttonIcon;
  final String buttonName;

  const MenuButton({
    super.key,
    required this.buttonIcon,
    required this.buttonName,
  });

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green,
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.buttonIcon,
            const SizedBox(width: 5),
            Text(
              widget.buttonName,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
