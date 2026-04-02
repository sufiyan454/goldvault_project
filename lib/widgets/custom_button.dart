
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool enabled;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          
          color: enabled ? Color.fromARGB(255, 189, 131, 43):Colors.white,
            
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white,fontSize: 22),
          ),
        ),
      ),
    );
  }
}