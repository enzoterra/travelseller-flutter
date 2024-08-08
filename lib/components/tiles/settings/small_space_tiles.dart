import 'package:flutter/material.dart';

class SmallSpaceTiles extends StatelessWidget {
  const SmallSpaceTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Divider(
        thickness: 0.4,
      ),
      SizedBox(
        height: 20,
      )
    ]);
  }
}
