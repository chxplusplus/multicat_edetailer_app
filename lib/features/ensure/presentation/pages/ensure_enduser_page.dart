import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;

class EnsureEndUserPage extends StatelessWidget {
  final String? channel;
  const EnsureEndUserPage({super.key, this.channel});

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
                      'assets/images/ensure_enduser_1.jpg',
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
                      'assets/images/ensure_enduser_1.jpg',
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
                      'assets/images/ensure_enduser_2.jpg',
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
                      'assets/images/ensure_enduser_2.jpg',
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
                      'assets/images/ensure_enduser_3.jpg',
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
                      'assets/images/ensure_enduser_3.jpg',
                      fit: BoxFit.contain,
                      gaplessPlayback: true,
                    ),
                  ),
                ],
              ),
              // Page 4
              Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: const Color(0xFF5E2777), // PediaSure Purple
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      'assets/images/ensure_enduser_4.jpg',
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
                      'assets/images/ensure_enduser_4.jpg',
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (channel == 'mdc')
                    FloatingActionButton.extended(
                      heroTag: 'mdcQualityBtn',
                      onPressed: () => context.push('/ensure/mdc_discount'),
                      backgroundColor: const Color(0xFF9f864b),
                      icon: const Icon(Icons.discount, color: Colors.white),
                      label: const Text(
                        'MDC DISCOUNT',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (channel == 'mdc')
                    const SizedBox(width: 16),
                  FloatingActionButton(
                    heroTag: 'homeQualityBtn',
                    onPressed: () => context.go('/'),
                    backgroundColor: const Color(0xFF9f864b),
                    child: const Icon(Icons.home, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
