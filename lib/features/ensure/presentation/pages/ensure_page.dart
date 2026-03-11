import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EnsurePage extends StatelessWidget {
  final String? channel;
  const EnsurePage({super.key, this.channel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/landing_bg.png'),
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
                  'assets/images/ensure_gold_text_logo.png',
                  width: 170,
                  fit: BoxFit.contain,
                ),
              ),
              // Main Content
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildImageButton(
                      assetPath: 'assets/images/ensure_gold_quality_button.png',
                      onTap: () => context.push('/ensure/quality?channel=$channel'),
                    ),
                    const SizedBox(width: 40),
                    _buildImageButton(
                      assetPath: 'assets/images/ensure_gold_trusted_button.png',
                      onTap: () => context.push('/ensure/trusted?channel=$channel'),
                    ),
                    const SizedBox(width: 40),
                    _buildImageButton(
                      assetPath: 'assets/images/ensure_gold_value_button.png',
                      onTap: () => context.push('/ensure/smart_value?channel=$channel'),
                    ),
                  ],
                ),
              ),
              // MDC DISCOUNT Button
              if (channel == 'mdc')
                Positioned(
                  bottom: 32,
                  right: 32,
                  child: FloatingActionButton.extended(
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
