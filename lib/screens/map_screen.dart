import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: SizedBox(
          width: 390,

          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    // TITLE
                    const Text(
                      "Live Map",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Your location is being shared",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // MAP CONTAINER
                    Container(
                      height: 320,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        color: const Color(0xFF071B2E),
                        borderRadius:
                        BorderRadius.circular(30),
                      ),

                      child: Stack(
                        children: [

                          // GRID LINES
                          Column(
                            children: List.generate(
                              6,

                                  (index) => Expanded(
                                child: Container(
                                  margin:
                                  const EdgeInsets.symmetric(
                                      vertical: 1),

                                  color: Colors.blue
                                      .withOpacity(0.07),
                                ),
                              ),
                            ),
                          ),

                          Row(
                            children: List.generate(
                              6,

                                  (index) => Expanded(
                                child: Container(
                                  margin:
                                  const EdgeInsets.symmetric(
                                      horizontal: 1),

                                  color: Colors.blue
                                      .withOpacity(0.07),
                                ),
                              ),
                            ),
                          ),

                          // LOCATION GLOW
                          Center(
                            child: Container(
                              height: 120,
                              width: 120,

                              decoration: BoxDecoration(
                                shape: BoxShape.circle,

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red
                                        .withOpacity(0.4),

                                    blurRadius: 50,
                                    spreadRadius: 20,
                                  ),
                                ],
                              ),

                              child: Center(
                                child: Container(
                                  height: 60,
                                  width: 60,

                                  decoration:
                                  const BoxDecoration(
                                    color:
                                    Color(0xFFFF2D55),

                                    shape: BoxShape.circle,
                                  ),

                                  child: const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // LIVE TAG
                          Positioned(
                            right: 18,
                            bottom: 18,

                            child: Container(
                              padding:
                              const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.black,

                                borderRadius:
                                BorderRadius.circular(30),
                              ),

                              child: const Text(
                                "LIVE",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // LOCATION CARD
                    Container(
                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        color: const Color(0xFF111114),

                        borderRadius:
                        BorderRadius.circular(24),
                      ),

                      child: Row(
                        children: [

                          const Icon(
                            Icons.location_on,
                            color: Color(0xFFFF2D55),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,

                              children: const [

                                Text(
                                  "MG Road, Bengaluru",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight:
                                    FontWeight.bold,

                                    fontSize: 18,
                                  ),
                                ),

                                SizedBox(height: 4),

                                Text(
                                  "Karnataka 560001, India",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            height: 12,
                            width: 12,

                            decoration:
                            const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // SAFE ZONES TITLE
                    const Text(
                      "SAFE ZONES",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // HOME
                    safeZoneCard(
                      title: "Home",
                      address:
                      "12 Koramangala, Bengaluru",
                      distance: "1.2 km",
                    ),

                    const SizedBox(height: 16),

                    // OFFICE
                    safeZoneCard(
                      title: "Office",
                      address:
                      "Whitefield, Bengaluru",
                      distance: "8.4 km",
                    ),

                    const SizedBox(height: 16),

                    // COLLEGE
                    safeZoneCard(
                      title: "College",
                      address:
                      "AKGEC, Ghaziabad",
                      distance: "5.1 km",
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget safeZoneCard({
    required String title,
    required String address,
    required String distance,
  }) {

    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: const Color(0xFF111114),

        borderRadius:
        BorderRadius.circular(24),
      ),

      child: Row(
        children: [

          Container(
            height: 40,
            width: 40,

            decoration: const BoxDecoration(
              color: Color(0xFF0F3D24),
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  address,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          Text(
            distance,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}