import 'package:flutter/material.dart';
import 'dart:async';

class SosScreen extends StatefulWidget {
  const SosScreen({super.key});

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  int _countdown = 5;
  bool _activated = false;
  bool _cancelled = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  void _startCountdown() {
    setState(() {
      _countdown = 5;
      _activated = true;
      _cancelled = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown == 0) {
        timer.cancel();
        setState(() {});
      } else {
        setState(() => _countdown--);
      }
    });
  }

  void _cancelSos() {
    _timer?.cancel();
    setState(() {
      _activated = false;
      _cancelled = true;
      _countdown = 5;
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // HEADER
              Row(
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
                      child: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 18),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text('SOS EMERGENCY',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2)),
                ],
              ),

              const Spacer(),

              // STATUS TEXT
              if (_cancelled)
                const Text('SOS CANCELLED',
                    style: TextStyle(
                        color: Color(0xFF00C853),
                        fontSize: 16,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold)),

              if (_activated && _countdown > 0)
                Text('SENDING IN $_countdown...',
                    style: const TextStyle(
                        color: Color(0xFFEF233C),
                        fontSize: 16,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold)),

              if (_activated && _countdown == 0)
                const Text('SOS ALERT SENT!',
                    style: TextStyle(
                        color: Color(0xFF00C853),
                        fontSize: 16,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold)),

              const SizedBox(height: 40),

              // MAIN SOS BUTTON
              AnimatedBuilder(
                animation: _pulseAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _activated && _countdown > 0
                        ? _pulseAnimation.value
                        : 1.0,
                    child: GestureDetector(
                      onLongPress: _startCountdown,
                      onTap: _activated ? null : _startCountdown,
                      child: Container(
                        height: 220,
                        width: 220,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: _activated && _countdown == 0
                                ? [
                                    const Color(0xFF00C853),
                                    const Color(0xFF006627),
                                  ]
                                : [
                                    const Color(0xFFEF233C),
                                    const Color(0xFFB71C1C),
                                  ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: (_activated && _countdown == 0
                                      ? const Color(0xFF00C853)
                                      : const Color(0xFFEF233C))
                                  .withOpacity(0.6),
                              blurRadius: 60,
                              spreadRadius: 15,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _activated && _countdown == 0
                                  ? Icons.check
                                  : Icons.warning_rounded,
                              color: Colors.white,
                              size: 60,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _activated && _countdown == 0
                                  ? 'SENT'
                                  : _activated
                                      ? '$_countdown'
                                      : 'SOS',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 4),
                            ),
                            Text(
                              _activated && _countdown == 0
                                  ? 'ALERT SENT'
                                  : _activated
                                      ? 'HOLD TO CANCEL'
                                      : 'HOLD TO ACTIVATE',
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  letterSpacing: 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 40),

              // CANCEL BUTTON
              if (_activated && _countdown > 0)
                GestureDetector(
                  onTap: _cancelSos,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF141417),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF2A2A35)),
                    ),
                    child: const Center(
                      child: Text('CANCEL SOS',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2)),
                    ),
                  ),
                ),

              const Spacer(),

              // INFO CARDS
              Row(
                children: [
                  Expanded(
                    child: _infoCard(
                        Icons.location_on, 'Location', 'Will be shared'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _infoCard(
                        Icons.people, 'Contacts', '3 will be alerted'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child:
                        _infoCard(Icons.call, 'Police', 'Auto dial 100'),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF141417),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A2A35)),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFFEF233C), size: 20),
          const SizedBox(height: 6),
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xFF94A3B8), fontSize: 10)),
        ],
      ),
    );
  }
}