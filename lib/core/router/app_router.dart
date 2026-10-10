import 'package:go_router/go_router.dart';
import '../../features/landing/presentation/pages/landing_page.dart';
import '../../features/ensure/presentation/pages/ensure_page.dart';
import '../../features/pediasure/presentation/pages/pediasure_page.dart';
import '../../features/similac/presentation/pages/similac_page.dart';
import '../../features/glucerna/presentation/pages/glucerna_page.dart';
import '../../features/ensure/presentation/pages/ensure_quality_page.dart';
import '../../features/ensure/presentation/pages/ensure_enduser_page.dart';
import '../../features/ensure/presentation/pages/ensure_careuser_page.dart';
import '../../features/ensure/presentation/pages/ensure_savings_oct_page.dart';
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
import '../../features/pediasure/presentation/pages/pediasure_b_practicality_page.dart';
import '../../features/pediasure/presentation/pages/pediasure_b_page.dart';
import '../../features/pediasure/presentation/pages/pediasure_b_nourishing_page.dart';
import '../../features/pediasure/presentation/pages/pediasure_b_safety_trust_page.dart';
import '../../features/ensure/presentation/pages/ensure_mdc_discount.dart';
import '../../features/pediasure/presentation/pages/pediasure_landing_page.dart';
import '../../features/landing/presentation/pages/channel_selection_page.dart';
import '../../features/landing/presentation/pages/alaga_rewards_page.dart';
import '../../features/landing/presentation/pages/risk_check_page.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ChannelSelectionPage(),
    ),
    GoRoute(
      path: '/brand_selection',
      builder: (context, state) => LandingPage(
        channel: state.uri.queryParameters['channel'],
      ),
    ),
    GoRoute(
      path: '/ensure',
      builder: (context, state) => EnsurePage(
        channel: state.uri.queryParameters['channel'],
      ),
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
      builder: (context, state) => EnsureQualityPage(
        channel: state.uri.queryParameters['channel'],
      ),
    ),
    GoRoute(
      path: '/ensure/enduser',
      builder: (context, state) => EnsureEndUserPage(
        channel: state.uri.queryParameters['channel'],
      ),
    ),
    GoRoute(
      path: '/ensure/careuser',
      builder: (context, state) => EnsureCareUserPage(
        channel: state.uri.queryParameters['channel'],
      ),
    ),
    GoRoute(
      path: '/ensure/savingsoct',
      builder: (context, state) => EnsureSavingsOctoberPage(
        channel: state.uri.queryParameters['channel'],
      ),
    ),
    GoRoute(
      path: '/ensure/trusted',
      builder: (context, state) => EnsureTrustedPage(
        channel: state.uri.queryParameters['channel'],
      ),
    ),
    GoRoute(
      path: '/ensure/smart_value',
      builder: (context, state) => EnsureSmartValuePage(
        channel: state.uri.queryParameters['channel'],
      ),
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
    GoRoute(
      path: '/ensure/mdc_discount',
      builder: (context, state) => const EnsureMDCDiscountPage(),
    ),
    GoRoute(
      path: '/pediasure/landing',
      builder: (context, state) => const PediasureLandingPage(),
    ),
    GoRoute(
      path: '/alaga_rewards',
      builder: (context, state) => const AlagaRewardsPage(),
    ),
    GoRoute(
      path: '/risk_check',
      builder: (context, state) => const RiskCheckPage(),
    ),
  ],
);
