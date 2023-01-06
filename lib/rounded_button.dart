import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({required this.color, required this.onpress, required this.title});

  final String title;
  final Color color;
  final Function() onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: 45,
        width: 150,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black45, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
      ),
    );
  }
}
