import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;

class EnsureTrustedPage extends StatelessWidget {
  const EnsureTrustedPage({super.key});

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
                  FloatingActionButton.extended(
                    heroTag: 'mdcTrustedBtn',
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
                  const SizedBox(width: 16),
                  FloatingActionButton(
                    heroTag: 'homeTrustedBtn',
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
