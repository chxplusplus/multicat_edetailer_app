import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;

class EnsureQualityPage extends StatelessWidget {
  const EnsureQualityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const ClampingScrollPhysics(),
            children: [
              // Page 1
              Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: const Color(0xFF5E2777), // PediaSure Purple
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      'assets/images/ensure_1.png',
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/ensure_1.png',
                      fit: BoxFit.contain,
                      gaplessPlayback: true,
                    ),
                  ),
                ],
              ),
              // Page 2
              Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: const Color(0xFF5E2777), // PediaSure Purple
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      'assets/images/ensure_2.png',
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/ensure_2.png',
                      fit: BoxFit.contain,
                      gaplessPlayback: true,
                    ),
                  ),
                ],
              ),
              // Page 3
              Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: const Color(0xFF5E2777), // PediaSure Purple
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      'assets/images/ensure_3.png',
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/ensure_3.png',
                      fit: BoxFit.contain,
                      gaplessPlayback: true,
                    ),
                  ),
                ],
              ),
              // DISCOUNT
              Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: const Color(0xFF5E2777), // PediaSure Purple
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      'assets/images/ensure_discount.jpg',
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/ensure_discount.jpg',
                      fit: BoxFit.contain,
                      gaplessPlayback: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Back Button
          Positioned(
            top: 16,
            left: 16,
            child: SafeArea(
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
                onPressed: () => context.pop(),
              ),
            ),
          ),
          // Home Button
          Positioned(
            bottom: 16,
            right: 16,
            child: SafeArea(
              child: FloatingActionButton(
                onPressed: () => context.go('/'),
                backgroundColor: const Color(0xFF9f864b),
                child: const Icon(Icons.home, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
