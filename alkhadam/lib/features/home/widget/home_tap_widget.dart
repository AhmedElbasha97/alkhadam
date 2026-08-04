// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class HomeTapWidget extends StatelessWidget {
  const HomeTapWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color(0xFF4A0E46),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4A0E46).withOpacity(0.25),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.5),
          child: Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  icon,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox(),
                ),
              ),

              // Rich Purple Gradient Overlay
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xEE6E1964), // Deep Purple
                        Color(0xD8972B88), // Vibrant Magenta-Purple Tint
                        Color(0xF54E0E46), // Dark Purple Edge
                      ],
                    ),
                  ),
                ),
              ),

              // Foreground Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Circle Avatar - Image fills the whole circle
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.35),
                            width: 1,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            icon,
                            width: 42,
                            height: 42,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: Colors.white.withOpacity(0.2),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.grid_view_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Droid Arabic Kufi',
                          shadows: [
                            Shadow(
                              color: Colors.black45,
                              offset: Offset(0, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                      // Centered Text Data
                      Expanded(
                        child: const SizedBox(width: 12),
                      ),

                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white70,
                        size: 15,
                      ),
                    ],
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
