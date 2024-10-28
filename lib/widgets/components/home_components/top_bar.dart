import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title;
  final Icon icon;

  const TopBar({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10,),
        const Icon(Icons.access_time_outlined),
        const SizedBox(width: 10,),
        Text(title),
        const Spacer(),
        icon,
        const SizedBox(width: 10,),
      ],
    );
  }
}
