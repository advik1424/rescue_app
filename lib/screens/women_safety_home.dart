import 'package:flutter/material.dart';
import 'sos_screen.dart';
import 'fake_call_screen.dart';
import 'contacts_screen.dart';
import 'live_location_screen.dart';
import 'quick_escape_screen.dart';
import 'nearby_police_screen.dart';
import 'recording_screen.dart';

class WomenSafetyHome extends StatefulWidget {
  const WomenSafetyHome({super.key});

  @override
  State<WomenSafetyHome> createState() => _WomenSafetyHomeState();
}

class _WomenSafetyHomeState extends State<WomenSafetyHome>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0C),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            constraints: const BoxConstraints(
              maxWidth: 390, // Forces a standard mobile viewport width even on wide desktop/web screens
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF141417),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF2A2A35)),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                      const Text(
                        'WOMEN SAFETY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF7C4DFF).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFF7C4DFF).withOpacity(0.3)),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.shield, color: Color(0xFF7C4DFF), size: 14),
                            SizedBox(width: 4),
                            Text(
                              'SAFE',
                              style: TextStyle(
                                color: Color(0xFF7C4DFF),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // SOS BUTTON WITH PULSE ANIMATION
                  Center(
                    child: AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _pulseAnimation.value,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const SosScreen()),
                              );
                            },
                            child: Container(
                              height: 180,
                              width: 180,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const RadialGradient(
                                  colors: [
                                    Color(0xFFEF233C),
                                    Color(0xFFB71C1C),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFEF233C).withOpacity(0.5),
                                    blurRadius: 40,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.warning_rounded, color: Colors.white, size: 50),
                                  SizedBox(height: 8),
                                  Text(
                                    'SOS',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 4,
                                    ),
                                  ),
                                  Text(
                                    'EMERGENCY',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 11,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 40),

                  // SAFETY STATUS CARD
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF141417),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF2A2A35)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF00C853).withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.shield, color: Color(0xFF00C853), size: 22),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Safety Active',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '3 contacts monitoring your location',
                                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xFF00C853),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // FEATURES GRID SECTION
                  const Text(
                    'QUICK ACCESS',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 12,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.35,
                    children: [
                      _featureCard(
                        icon: Icons.call,
                        label: 'Fake Call',
                        subtitle: 'Instant escape',
                        color: const Color(0xFF7C4DFF),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FakeCallScreen())),
                      ),
                      _featureCard(
                        icon: Icons.people,
                        label: 'Trusted Contacts',
                        subtitle: '3 contacts active',
                        color: const Color(0xFF00C853),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactsScreen())),
                      ),
                      _featureCard(
                        icon: Icons.location_on,
                        label: 'Live Location',
                        subtitle: 'Sharing active',
                        color: const Color(0xFFFF9800),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LiveLocationScreen())),
                      ),
                      _featureCard(
                        icon: Icons.directions_run,
                        label: 'Quick Escape',
                        subtitle: 'Emergency exit',
                        color: const Color(0xFFEF233C),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuickEscapeScreen())),
                      ),
                      _featureCard(
                        icon: Icons.local_police,
                        label: 'Nearby Police',
                        subtitle: '2 stations close',
                        color: const Color(0xFF2196F3),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NearbyPoliceScreen())),
                      ),
                      _featureCard(
                        icon: Icons.mic,
                        label: 'Record Evidence',
                        subtitle: 'Audio & video',
                        color: const Color(0xFFFF6D00),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RecordingScreen())),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // QUICK DIAL SECTION
                  const Text(
                    'EMERGENCY CONTACTS',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 12,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        _dialChip('1091', 'Women'),
                        const SizedBox(width: 10),
                        _dialChip('100', 'Police'),
                        const SizedBox(width: 10),
                        _dialChip('108', 'Ambulance'),
                        const SizedBox(width: 10),
                        _dialChip('112', 'Emergency'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _featureCard({
    required IconData icon,
    required String label,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF141417),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF2A2A35)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dialChip(String number, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF141417),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEF233C).withOpacity(0.3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            number,
            style: const TextStyle(
              color: Color(0xFFEF233C),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 10),
          ),
        ],
      ),
    );
  }
}