import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PediasurePage extends StatelessWidget {
  const PediasurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pediasure_landing_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Back Button
              Positioned(
                top: 16,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
                  onPressed: () => context.pop(),
                ),
              ),
              // Logo (Top Right)
              Positioned(
                top: 32,
                right: 32,
                child: Image.asset(
                  'assets/images/pediasure_top_logo.png',
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
              // Main Content
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildImageButton(
                      assetPath: 'assets/images/pediasure_nourish_button.png',
                      onTap: () => context.push('/pediasure/nourishing'),
                    ),
                    const SizedBox(width: 40),
                    _buildImageButton(
                      assetPath: 'assets/images/pediasure_safety_button.png',
                      onTap: () => context.push('/pediasure/safety_trust'),
                    ),
                    const SizedBox(width: 40),
                    _buildImageButton(
                      assetPath: 'assets/images/pediasure_value_button.png',
                      onTap: () => context.push('/pediasure/practicality'),
                    ),
                  ],
                ),
              ),
              // Scan Image (Bottom Left)
              Positioned(
                bottom: 16,
                left: 150,
                child: Image.asset(
                  'assets/images/pediasure_scan.png',
                  width: 350,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageButton({
    required String assetPath,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          assetPath,
          width: 250,
          height: 250,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
