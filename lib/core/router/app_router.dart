import 'package:go_router/go_router.dart';
import '../../features/landing/presentation/pages/landing_page.dart';
import '../../features/ensure/presentation/pages/ensure_page.dart';
import '../../features/pediasure/presentation/pages/pediasure_page.dart';
import '../../features/similac/presentation/pages/similac_page.dart';
import '../../features/glucerna/presentation/pages/glucerna_page.dart';
import '../../features/ensure/presentation/pages/ensure_quality_page.dart';
import '../../features/ensure/presentation/pages/ensure_trusted_page.dart';
import '../../features/ensure/presentation/pages/ensure_smart_value_page.dart';
import '../../features/pediasure/presentation/pages/pediasure_nourishing_page.dart';
import '../../features/pediasure/presentation/pages/pediasure_safety_trust_page.dart';
import '../../features/pediasure/presentation/pages/pediasure_practicality_page.dart';
import '../../features/similac/presentation/pages/similac_nourishing_page.dart';
import '../../features/similac/presentation/pages/similac_safety_trust_page.dart';
import '../../features/similac/presentation/pages/similac_practicality_page.dart';
import '../../features/glucerna/presentation/pages/glucerna_quality_page.dart';
import '../../features/glucerna/presentation/pages/glucerna_trusted_page.dart';
import '../../features/glucerna/presentation/pages/glucerna_smart_value_page.dart';
import '../../features/pediasure/presentation/pages/pediasure_b_page.dart';
import '../../features/pediasure/presentation/pages/pediasure_b_nourishing_page.dart';
import '../../features/pediasure/presentation/pages/pediasure_b_safety_trust_page.dart';
import '../../features/pediasure/presentation/pages/pediasure_b_practicality_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: '/ensure',
      builder: (context, state) => const EnsurePage(),
    ),
    GoRoute(
      path: '/pediasure',
      builder: (context, state) => const PediasurePage(),
    ),
    GoRoute(
      path: '/similac',
      builder: (context, state) => const SimilacPage(),
    ),
    GoRoute(
      path: '/glucerna',
      builder: (context, state) => const GlucernaPage(),
    ),
    GoRoute(
      path: '/pediasure_b',
      builder: (context, state) => const PediasureBPage(),
    ),
    GoRoute(
      path: '/ensure/quality',
      builder: (context, state) => const EnsureQualityPage(),
    ),
    GoRoute(
      path: '/ensure/trusted',
      builder: (context, state) => const EnsureTrustedPage(),
    ),
    GoRoute(
      path: '/ensure/smart_value',
      builder: (context, state) => const EnsureSmartValuePage(),
    ),
    GoRoute(
      path: '/pediasure/nourishing',
      builder: (context, state) => const PediasureNourishingPage(),
    ),
    GoRoute(
      path: '/pediasure/safety_trust',
      builder: (context, state) => const PediasureSafetyTrustPage(),
    ),
    GoRoute(
      path: '/pediasure/practicality',
      builder: (context, state) => const PediasurePracticalityPage(),
    ),
    // Pediasure B detail routes
    GoRoute(
      path: '/pediasure_b/nourishing',
      builder: (context, state) => const PediasureBNourishingPage(),
    ),
    GoRoute(
      path: '/pediasure_b/safety_trust',
      builder: (context, state) => const PediasureBSafetyTrustPage(),
    ),
    GoRoute(
      path: '/pediasure_b/practicality',
      builder: (context, state) => const PediasureBPracticalityPage(),
    ),
    // Similac Routes
    GoRoute(
      path: '/similac/nourishing',
      builder: (context, state) => const SimilacNourishingPage(),
    ),
    GoRoute(
      path: '/similac/safety_trust',
      builder: (context, state) => const SimilacSafetyTrustPage(),
    ),
    GoRoute(
      path: '/similac/practicality',
      builder: (context, state) => const SimilacPracticalityPage(),
    ),
    // Glucerna Routes
    GoRoute(
      path: '/glucerna/quality',
      builder: (context, state) => const GlucernaQualityPage(),
    ),
    GoRoute(
      path: '/glucerna/trusted',
      builder: (context, state) => const GlucernaTrustedPage(),
    ),
    GoRoute(
      path: '/glucerna/smart_value',
      builder: (context, state) => const GlucernaSmartValuePage(),
    ),
  ],
);
