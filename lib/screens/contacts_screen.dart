import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  ContactsScreen();

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final List<Map<String, dynamic>> _contacts = [
    {
      'name': 'Mom',
      'number': '+91 98765 43210',
      'avatar': 'M',
      'relation': 'Mother',
      'online': true,
      'sosShared': true,
      'color': Color(0xFF7C4DFF),
    },
    {
      'name': 'Priya',
      'number': '+91 91234 56789',
      'avatar': 'P',
      'relation': 'Best Friend',
      'online': true,
      'sosShared': false,
      'color': Color(0xFF00C853),
    },
    {
      'name': 'Dad',
      'number': '+91 87654 32109',
      'avatar': 'D',
      'relation': 'Father',
      'online': false,
      'sosShared': true,
      'color': Color(0xFFFF9800),
    },
    {
      'name': 'Ananya',
      'number': '+91 99887 76655',
      'avatar': 'A',
      'relation': 'Sister',
      'online': false,
      'sosShared': false,
      'color': Color(0xFF2196F3),
    },
  ];

  void _sendSOS(Map<String, dynamic> contact) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Color(0xFF141417),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('SOS Sent!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        content: Text(
          'Emergency alert sent to ${contact['name']} (${contact['number']})',
          style: TextStyle(color: Color(0xFF94A3B8)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: TextStyle(color: Color(0xFF7C4DFF))),
          ),
        ],
      ),
    );
  }

  void _addContactDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Color(0xFF141417),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Add Contact',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        content: Text(
          'Contact import from phone would connect here in production.',
          style: TextStyle(color: Color(0xFF94A3B8)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: TextStyle(color: Color(0xFF7C4DFF))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final onlineContacts = _contacts.where((c) => c['online'] == true).length;

    return Scaffold(
      backgroundColor: Color(0xFF0A0A0C),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF141417),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFF2A2A35)),
                      ),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 18),
                    ),
                  ),
                  Text(
                    'TRUSTED CONTACTS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  GestureDetector(
                    onTap: _addContactDialog,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF7C4DFF).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Color(0xFF7C4DFF).withOpacity(0.4)),
                      ),
                      child: Icon(Icons.person_add,
                          color: Color(0xFF7C4DFF), size: 18),
                    ),
                  ),
                ],
              ),
            ),

            // STATS ROW
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _statCard('$onlineContacts', 'Online Now', Color(0xFF00C853)),
                  SizedBox(width: 12),
                  _statCard(
                      '${_contacts.length}', 'Total', Color(0xFF7C4DFF)),
                  SizedBox(width: 12),
                  _statCard(
                      '${_contacts.where((c) => c['sosShared']).length}',
                      'SOS Active',
                      Color(0xFFEF233C)),
                ],
              ),
            ),

            SizedBox(height: 20),

            // SOS ALL BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: Color(0xFF141417),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    title: Text('SOS Sent to All!',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    content: Text(
                      'Emergency alert sent to all ${_contacts.length} trusted contacts.',
                      style: TextStyle(color: Color(0xFF94A3B8)),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK',
                            style: TextStyle(color: Color(0xFF7C4DFF))),
                      ),
                    ],
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: Color(0xFFEF233C).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                        color: Color(0xFFEF233C).withOpacity(0.5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.warning_rounded,
                          color: Color(0xFFEF233C), size: 20),
                      SizedBox(width: 8),
                      Text(
                        'SEND SOS TO ALL CONTACTS',
                        style: TextStyle(
                          color: Color(0xFFEF233C),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // SECTION LABEL
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('YOUR CONTACTS',
                      style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 12,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            SizedBox(height: 12),

            // CONTACTS LIST
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: _contacts.length,
                separatorBuilder: (_, __) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final c = _contacts[index];
                  return _contactCard(c);
                },
              ),
            ),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String value, String label, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.25)),
        ),
        child: Column(
          children: [
            Text(value,
                style: TextStyle(
                    color: color,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 2),
            Text(label,
                style:
                    TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
          ],
        ),
      ),
    );
  }

  Widget _contactCard(Map<String, dynamic> c) {
    final bool online = c['online'] as bool;
    final bool sosShared = c['sosShared'] as bool;
    final Color color = c['color'] as Color;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF141417),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: online
              ? Color(0xFF00C853).withOpacity(0.25)
              : Color(0xFF2A2A35),
        ),
      ),
      child: Row(
        children: [
          // Avatar with online indicator
          Stack(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: color.withOpacity(0.2),
                child: Text(
                  c['avatar'],
                  style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              if (online)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                      color: Color(0xFF00C853),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Color(0xFF141417), width: 2),
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(width: 14),

          // Name + relation + SOS badge
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(c['name'],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    SizedBox(width: 8),
                    if (sosShared)
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xFFEF233C).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: Color(0xFFEF233C).withOpacity(0.4)),
                        ),
                        child: Text('SOS',
                            style: TextStyle(
                                color: Color(0xFFEF233C),
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5)),
                      ),
                  ],
                ),
                SizedBox(height: 3),
                Text(c['relation'],
                    style: TextStyle(
                        color: Color(0xFF94A3B8), fontSize: 12)),
                SizedBox(height: 2),
                Text(c['number'],
                    style: TextStyle(
                        color: Color(0xFF94A3B8), fontSize: 11)),
              ],
            ),
          ),

          // Quick SOS button
          GestureDetector(
            onTap: () => _sendSOS(c),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xFFEF233C).withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Color(0xFFEF233C).withOpacity(0.4)),
              ),
              child: Text('SOS',
                  style: TextStyle(
                      color: Color(0xFFEF233C),
                      fontWeight: FontWeight.bold,
                      fontSize: 13)),
            ),
          ),
        ],
      ),
    );
  }
}