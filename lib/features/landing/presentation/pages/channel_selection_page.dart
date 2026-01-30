import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChannelSelectionPage extends StatelessWidget {
  const ChannelSelectionPage({super.key});

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
          child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'CHOOSE YOUR CHANNEL',
                      style: TextStyle(
                        fontFamily: 'BrandonGrotesque',
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2.0,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    _buildChannelButton(
                      context,
                      label: 'MODERN TRADE',
                      onTap: () => context.push('/brand_selection?channel=modern_trade'),
                    ),
                    const SizedBox(height: 30),
                    _buildChannelButton(
                      context,
                      label: 'MDC',
                      onTap: () => context.push('/brand_selection?channel=mdc'),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }

  Widget _buildChannelButton(BuildContext context,
      {required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF003D7C),
              Color(0xFF002D5C),
            ],
          ),
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 15,
              offset: const Offset(0, 10),
            ),
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.2),
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'BrandonGrotesque',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    ).animateOnHover();
  }
}

extension HoverExtension on Widget {
  Widget animateOnHover() {
    return _HoverAnimation(child: this);
  }
}

class _HoverAnimation extends StatefulWidget {
  final Widget child;
  const _HoverAnimation({required this.child});

  @override
  State<_HoverAnimation> createState() => __HoverAnimationState();
}

class __HoverAnimationState extends State<_HoverAnimation> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: widget.child,
      ),
    );
  }
}
