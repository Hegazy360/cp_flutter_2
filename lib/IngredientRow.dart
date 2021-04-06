import 'package:flutter/material.dart';

class IngredientRow extends StatelessWidget {
  const IngredientRow({
    Key key,
    @required this.text,
  }) : super(key: key);

  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "•",
          style: TextStyle(fontSize: 40, color: Color(0xFF20CAD1)),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16, color: Color(0xFF2A2E2E)),
        )
      ],
    );
  }
}