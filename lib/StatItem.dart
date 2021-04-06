import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  const StatItem({
    Key key,
    @required this.iconPath,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  final iconPath;
  final title;
  final subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Image.asset(iconPath),
        ),
        Row(
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                subtitle,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            )
          ],
        )
      ],
    );
  }
}
