import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.title,
    required this.description,
    this.onTap,
  });

  final String title;
  final String description;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GFCard(
        boxFit: BoxFit.cover,
        titlePosition: GFPosition.start,
        gradient: const LinearGradient(
          colors: [
            Color(0xFF525152),
            Color(0xFF181818),
          ],
          stops: [0.6, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        title: GFListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        content: Text(
          description,
          style: TextStyle(color: Colors.white),
        ),
        buttonBar: GFButtonBar(
          children: <Widget>[
            GFAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.link,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
