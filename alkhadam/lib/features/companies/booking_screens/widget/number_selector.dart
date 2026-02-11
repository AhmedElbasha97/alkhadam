import 'package:flutter/material.dart';

Widget optionButton({
  required bool selected,
  required String label,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 70,
      height: 48,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: selected ? const  Color(0xFF8E2393): Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    ),
  );
}
