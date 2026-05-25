import 'package:flutter/material.dart';
import 'dart:async';

class FakeCallScreen extends StatefulWidget {
  FakeCallScreen();

  @override
  _FakeCallScreenState createState() => _FakeCallScreenState();
}

enum CallState { ringing, connected, ended }

class _FakeCallScreenState extends State<FakeCallScreen>
    with TickerProviderStateMixin {
  CallState _callState = CallState.ringing;
  Timer? _ringTimer;
  Timer? _callTimer;
  int _callDuration = 0;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  final List<Map<String, String>> _callers = [
    {'name': 'Mom', 'number': '+91 98765 43210', 'avatar': 'M'},
    {'name': 'Office', 'number': '+91 11 2345 6789', 'avatar': 'O'},
    {'name': 'Unknown', 'number': 'Private Number', 'avatar': '?'},
  ];
  int _selectedCaller = 0;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.12).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ringTimer?.cancel();
    _callTimer?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  void _startCall() {
    setState(() => _callState = CallState.connected);
    _callTimer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() => _callDuration++);
    });
  }

  void _endCall() {
    _ringTimer?.cancel();
    _callTimer?.cancel();
    setState(() => _callState = CallState.ended);
    Future.delayed(Duration(seconds: 1), () => Navigator.pop(context));
  }

  String _formatDuration(int secs) {
    final m = (secs ~/ 60).toString().padLeft(2, '0');
    final s = (secs % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final caller = _callers[_selectedCaller];
    final isRinging = _callState == CallState.ringing;
    final isConnected = _callState == CallState.connected;

    return Scaffold(
      backgroundColor: Color(0xFF0A0A0C),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            if (_callState == CallState.ringing)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Color(0xFF94A3B8)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Fake Call',
                      style: TextStyle(
                        color: Color(0xFFF1F5F9),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

            // Caller selector (only shown before call starts)
            if (_callState == CallState.ringing) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select caller',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 13,
                        letterSpacing: 0.8,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: List.generate(_callers.length, (i) {
                        final selected = _selectedCaller == i;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedCaller = i),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: selected
                                    ? Color(0xFF7C4DFF).withOpacity(0.18)
                                    : Color(0xFF141417),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: selected
                                      ? Color(0xFF7C4DFF)
                                      : Color(0xFF2A2A35),
                                  width: selected ? 1.5 : 1,
                                ),
                              ),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor: selected
                                        ? Color(0xFF7C4DFF).withOpacity(0.3)
                                        : Color(0xFF2A2A35),
                                    child: Text(
                                      _callers[i]['avatar']!,
                                      style: TextStyle(
                                        color: selected
                                            ? Color(0xFF7C4DFF)
                                            : Color(0xFF94A3B8),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    _callers[i]['name']!,
                                    style: TextStyle(
                                      color: selected
                                          ? Color(0xFFF1F5F9)
                                          : Color(0xFF94A3B8),
                                      fontSize: 12,
                                      fontWeight: selected
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Divider(color: Color(0xFF2A2A35), thickness: 0.5),
            ],

            // Main call UI
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Avatar with pulse
                  ScaleTransition(
                    scale: isRinging ? _pulseAnimation : AlwaysStoppedAnimation(1.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (isRinging)
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF7C4DFF).withOpacity(0.08),
                            ),
                          ),
                        CircleAvatar(
                          radius: 52,
                          backgroundColor: isConnected
                              ? Color(0xFF00C853).withOpacity(0.2)
                              : Color(0xFF7C4DFF).withOpacity(0.2),
                          child: Text(
                            caller['avatar']!,
                            style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: isConnected
                                  ? Color(0xFF00C853)
                                  : Color(0xFF7C4DFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // Caller name
                  Text(
                    caller['name']!,
                    style: TextStyle(
                      color: Color(0xFFF1F5F9),
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    caller['number']!,
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Status text
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: isConnected
                        ? Text(
                            _formatDuration(_callDuration),
                            key: ValueKey('timer'),
                            style: TextStyle(
                              color: Color(0xFF00C853),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          )
                        : _callState == CallState.ended
                            ? Text(
                                'Call ended',
                                key: ValueKey('ended'),
                                style: TextStyle(
                                  color: Color(0xFF94A3B8),
                                  fontSize: 16,
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                key: ValueKey('ringing'),
                                children: [
                                  Icon(Icons.phone_in_talk,
                                      color: Color(0xFF7C4DFF), size: 16),
                                  SizedBox(width: 6),
                                  Text(
                                    'Incoming call...',
                                    style: TextStyle(
                                      color: Color(0xFF7C4DFF),
                                      fontSize: 15,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                  ),
                ],
              ),
            ),

            // Action buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 52, left: 32, right: 32),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: isRinging
                    ? Row(
                        key: ValueKey('ring-actions'),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Decline
                          _CallButton(
                            icon: Icons.call_end,
                            color: Color(0xFFEF233C),
                            label: 'Decline',
                            onTap: _endCall,
                          ),
                          // Accept
                          _CallButton(
                            icon: Icons.call,
                            color: Color(0xFF00C853),
                            label: 'Accept',
                            onTap: _startCall,
                          ),
                        ],
                      )
                    : isConnected
                        ? Center(
                            key: ValueKey('connected-actions'),
                            child: _CallButton(
                              icon: Icons.call_end,
                              color: Color(0xFFEF233C),
                              label: 'End Call',
                              onTap: _endCall,
                            ),
                          )
                        : SizedBox.shrink(key: ValueKey('ended-actions')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable call action button
class _CallButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;

  const _CallButton({
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}