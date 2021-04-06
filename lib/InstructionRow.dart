import 'package:flutter/material.dart';

class InstructionRow extends StatelessWidget {
  const InstructionRow({
    Key key,
    @required this.index,
    @required this.text,
  }) : super(key: key);

  final index;
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            index,
            style: TextStyle(
                fontSize: 30,
                color: Color(0xff20CAD1),
                fontWeight: FontWeight.w700),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF626C72),
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
