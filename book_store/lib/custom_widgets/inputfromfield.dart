import 'package:flutter/material.dart';

class InputAccepter extends StatelessWidget {
  final String label;
  final String header;
  final TextEditingController controller;
  const InputAccepter({super.key, required this.label, required this.header, required this.controller});

  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(
              right: MediaQuery.sizeOf(context).width * 0.7,
            ),
            child: Text(
              header,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              label: Text(label, style: TextStyle(color: Colors.white30)),
              fillColor: Colors.white30,
              focusColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
