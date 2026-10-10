import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;

class SimilacSafetyTrustPage extends StatelessWidget {
  const SimilacSafetyTrustPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const ClampingScrollPhysics(),
            children: [
              Stack(
                fit: StackFit.expand,
                children: [
                  // Gold Background Base
                  Container(
                    color: const Color(0xFFFFD700), // Gold
                  ),
                  // Blurred Background
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      'assets/images/trusted_similac_01.jpg',
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter:  ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  // Main Image
                  Center(
                    child: Image.asset(
                      'assets/images/trusted_similac_01.jpg',
                      fit: BoxFit.contain,
                      gaplessPlayback: true,
                    ),
                  ),
                ],
              ),
              Stack(
                fit: StackFit.expand,
                children: [
                  // Gold Background Base
                  Container(
                    color: const Color(0xFFFFD700), // Gold
                  ),
                  // Blurred Background
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      'assets/images/trusted_similac_02.jpg',
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter:  ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  // Main Image
                  Center(
                    child: Image.asset(
                      'assets/images/trusted_similac_02.jpg',
                      fit: BoxFit.contain,
                      gaplessPlayback: true,
                    ),
                  ),
                ],
              ),
              Stack(
                fit: StackFit.expand,
                children: [
                  // Gold Background Base
                  Container(
                    color: const Color(0xFFFFD700), // Gold
                  ),
                  // Blurred Background
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      'assets/images/trusted_similac_03.jpg',
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter:  ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  // Main Image
                  Center(
                    child: Image.asset(
                      'assets/images/trusted_similac_03.jpg',
                      fit: BoxFit.contain,
                      gaplessPlayback: true,
                    ),
                  ),
                ],
              )
            ],
          ),
          // Back Button
          Positioned(
            top: 16,
            left: 16,
            child: SafeArea(
              child: IconButton(
                icon: const Icon(Icons.arrow_back, size: 32),
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
                backgroundColor: const Color(0xFF001F3F),
                child: const Icon(Icons.home, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required Color color,
    required String title,
    required String description,
  }) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
