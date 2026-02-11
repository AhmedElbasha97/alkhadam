import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ?  Color(0xFF8E2393) : Color(0xFFE0E0E0),
              width: selected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Checkbox(
                value: selected,
                onChanged: (_) => onTap(),
                activeColor:  Color(0xFF8E2393),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 1),
              Icon(icon, color:  Color(0xFF8E2393), size: 28),
              const SizedBox(width: 1),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color:Color(0xFF8E2393),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}