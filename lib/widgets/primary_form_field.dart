import 'package:flutter/material.dart';

class PrimaryFormField extends StatelessWidget {
  final String label;
  final int minLines;
  final int maxLines;
  final double radius;
  final TextEditingController controller;

  const PrimaryFormField({
    Key key,
    this.label,
    this.minLines = 1,
    this.maxLines,
    this.radius = 100,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextFormField(
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          cursorColor: Colors.greenAccent,
          decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white60),
          ),
        ),
      ),
    );
  }
}
