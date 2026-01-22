import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PediasureLandingPage extends StatelessWidget {
  const PediasureLandingPage({super.key});

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
                child: SafeArea(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.white, size: 32),
                    onPressed: () => context.pop(),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text(
                      'CHOOSE YOUR BRAND',
                      style: TextStyle(
                        fontFamily: 'BrandonGrotesque',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(128, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final double itemSize = constraints.maxWidth < 600
                            ? 160
                            : 350; // Slightly smaller to accommodate the layout better

                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildBrandButton(
                                    name: 'PediaSure\nA',
                                    color: const Color(0xFF5E2777),
                                    size: itemSize,
                                    assetPath: 'assets/images/pedia_3.png',
                                    onTap: () => context.push(
                                        '/pediasure'), // Same route for now
                                  ),
                                  const SizedBox(width: 30),
                                  _buildBrandButton(
                                    name: 'PediaSure\nB',
                                    color: const Color(0xFF5E2777),
                                    size: itemSize,
                                    assetPath: 'assets/images/pedia_10.png',
                                    onTap: () => context.push('/pediasure_b'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              // Alaga Button
              Positioned(
                bottom: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    // Action for Alaga button
                  },
                  child: Image.asset(
                    'assets/images/alaga_button.png',
                    width: 140, // Adjust size as needed
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandButton({
    required String name,
    required Color color,
    required double size,
    Color? textColor,
    String? assetPath,
    VoidCallback? onTap,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        // border: Border.all(color: const Color(0xFFD4AF37), width: 4), // Removed as per request
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(size / 2),
          child: ClipOval(
            child: assetPath != null
                ? Image.asset(
                    assetPath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Text(
                          name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColor ?? Colors.white,
                            fontSize: size * 0.18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: size * 0.18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
