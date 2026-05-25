import 'package:flutter/material.dart';
import 'fake_call_screen.dart';

class EmergencyServicesScreen extends StatelessWidget {
  const EmergencyServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0C),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 420,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ================= HEADER =================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Emergency Services",
                            style: TextStyle(
                              color: Color(0xFFF1F5F9),
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Select a category to access tools",
                            style: TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF141417),
                          border: Border.all(
                            color: const Color(0x33EF233C),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x44EF233C),
                              blurRadius: 12,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          color: Color(0xFFEF233C),
                        ),
                      ),
                    ],
                  ),

                  // ================= ALERT BANNER =================
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0x22EF233C),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0x55EF233C),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x22EF233C),
                          blurRadius: 20,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.warning_amber_rounded,
                          color: Color(0xFFEF233C),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            "1 active alert in your area - Cyclone warning in effect",
                            style: TextStyle(
                              color: Color(0xFFF1F5F9),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEF233C),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ================= GRID =================
                  const SizedBox(height: 24),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.82,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FakeCallScreen(), // Const error fixed here
                              ),
                            );
                          },
                          child: _buildCard(
                            title: "Women Safety",
                            subtitle: "Fake call & companion tracking",
                            color: const Color(0xFF7C4DFF),
                            icon: Icons.shield_outlined,
                          ),
                        ),
                        _buildCard(
                          title: "Natural Calamity",
                          subtitle: "Alerts, routes & survival",
                          color: const Color(0xFFFF9800),
                          icon: Icons.cloud_outlined,
                        ),
                        _buildCard(
                          title: "Ambulance Support",
                          subtitle: "Medical dispatch & blood bank",
                          color: const Color(0xFF00C853),
                          icon: Icons.local_hospital_outlined,
                        ),
                        _buildCard(
                          title: "Fire Emergency",
                          subtitle: "Fire dept ping & safety guides",
                          color: const Color(0xFFEF233C),
                          icon: Icons.local_fire_department_outlined,
                        ),
                      ],
                    ),
                  ),

                  // ================= QUICK DIAL =================
                  const SizedBox(height: 16),
                  const Text(
                    "QUICK DIAL",
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      letterSpacing: 2,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _dialButton(
                        number: "101",
                        label: "Fire",
                        color: const Color(0xFFEF233C),
                        icon: Icons.local_fire_department,
                      ),
                      _dialButton(
                        number: "108",
                        label: "Ambulance",
                        color: const Color(0xFF00C853),
                        icon: Icons.local_hospital,
                      ),
                      _dialButton(
                        number: "1091",
                        label: "Women",
                        color: const Color(0xFF7C4DFF),
                        icon: Icons.shield,
                      ),
                      _dialButton(
                        number: "112",
                        label: "Emergency",
                        color: const Color(0xFFFF9800),
                        icon: Icons.call,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= CARD =================
  static Widget _buildCard({
    required String title,
    required String subtitle,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E1E23),
            Color(0xFF141417),
          ],
        ),
        border: Border.all(
          color: color.withOpacity(0.45),
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFF1F5F9),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 12,
              height: 1.3,
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.18),
              ),
              child: Icon(
                Icons.arrow_forward_rounded,
                color: color,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= QUICK DIAL BUTTON =================
  static Widget _dialButton({
    required String number,
    required String label,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      width: 82,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF141417),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(0.35),
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.12),
            blurRadius: 14,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 20,
          ),
          const SizedBox(height: 6),
          Text(
            number,
            style: const TextStyle(
              color: Color(0xFFF1F5F9),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}