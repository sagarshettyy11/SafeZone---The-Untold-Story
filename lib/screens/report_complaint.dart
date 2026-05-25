import 'package:flutter/material.dart';

class ReportComplaintScreen extends StatefulWidget {
  const ReportComplaintScreen({super.key});
  @override
  State<ReportComplaintScreen> createState() => _ReportComplaintScreenState();
}

class _ReportComplaintScreenState extends State<ReportComplaintScreen> {
  int _selectedIssue = -1;
  bool _useCurrentLocation = true;
  double _urgencyLevel = 0.5;
  int _selectedNavIndex = 3;

  final List<_IssueType> _issues = [
    _IssueType('Crime', Icons.warning_amber_outlined, const Color(0xFFFFF0F0), const Color(0xFFE53935)),
    _IssueType('Accident', Icons.swap_horiz_rounded, const Color(0xFFF0F4FF), const Color(0xFF1565C0)),
    _IssueType('Fire', Icons.local_fire_department_outlined, const Color(0xFFFFF3EC), const Color(0xFFE64A19)),
    _IssueType('Medical', Icons.favorite_border_outlined, const Color(0xFFEDF7F0), const Color(0xFF2E7D32)),
    _IssueType('Hazard', Icons.bolt_outlined, const Color(0xFFFFFBE6), const Color(0xFFF9A825)),
    _IssueType('Other', Icons.more_horiz, const Color(0xFFF5F5F5), const Color(0xFF616161)),
  ];

  String _urgencyLabel() {
    if (_urgencyLevel < 0.33) return 'LOW';
    if (_urgencyLevel < 0.66) return 'MEDIUM';
    return 'CRITICAL';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF1F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Report a Complaint',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A2420),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Help keep your community safe by reporting issues immediately.',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 28),

                    // SELECT ISSUE TYPE
                    const _SectionLabel(text: 'SELECT ISSUE TYPE'),
                    const SizedBox(height: 12),
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.1,
                      children: List.generate(_issues.length, (i) {
                        final issue = _issues[i];
                        final selected = _selectedIssue == i;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedIssue = i),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: selected
                                  ? Border.all(color: const Color(0xFF1A2420), width: 2)
                                  : null,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 46,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    color: issue.bgColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(issue.icon, color: issue.iconColor, size: 24),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  issue.label,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1A1A2E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 28),

                    // LOCATION DETAILS
                    const _SectionLabel(text: 'LOCATION DETAILS'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _useCurrentLocation = true),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                color: _useCurrentLocation
                                    ? const Color(0xFF1A2420)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_on_outlined,
                                      color: _useCurrentLocation ? Colors.white : Colors.black,
                                      size: 18),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Current Location',
                                    style: TextStyle(
                                      color: _useCurrentLocation ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _useCurrentLocation = false),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                color: !_useCurrentLocation
                                    ? const Color(0xFF1A2420)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: _useCurrentLocation
                                    ? Border.all(color: Colors.black26)
                                    : null,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.map_outlined,
                                      color: !_useCurrentLocation ? Colors.white : Colors.black,
                                      size: 18),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Pick Location',
                                    style: TextStyle(
                                      color: !_useCurrentLocation ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // DESCRIPTION
                    const _SectionLabel(text: 'DESCRIPTION'),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Describe what happened in detail...',
                          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // ATTACHMENTS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const _SectionLabel(text: 'ATTACHMENTS (OPTIONAL)'),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFB5E61D),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'ADD',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A2420),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Proof Link (Google Drive, Cloud, etc)',
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // URGENCY LEVEL
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const _SectionLabel(text: 'URGENCY LEVEL'),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A2420),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _urgencyLabel(),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB5E61D),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 4,
                        activeTrackColor: const Color(0xFF1A2420),
                        inactiveTrackColor: const Color(0xFFDDDDDD),
                        thumbColor: const Color(0xFFB5E61D),
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 14),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 22),
                        overlayColor: Color(0x22B5E61D),
                      ),
                      child: Slider(
                        value: _urgencyLevel,
                        onChanged: (v) => setState(() => _urgencyLevel = v),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('LOW', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                          Text('CRITICAL', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),

                    // SUBMIT BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB5E61D),
                          foregroundColor: const Color(0xFF1A2420),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SUBMIT COMPLAINT',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward, size: 20),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            _buildBottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    final icons = [
      Icons.home_outlined,
      Icons.map_outlined,
      Icons.shield_outlined,
      Icons.bar_chart_outlined,
      Icons.person_outline,
    ];
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2420),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (i) {
          final selected = i == _selectedNavIndex;
          return GestureDetector(
            onTap: () => setState(() => _selectedNavIndex = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: selected ? const Color(0xFFB5E61D) : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(icons[i],
                  color: selected ? const Color(0xFF1A2420) : Colors.white70, size: 22),
            ),
          );
        }),
      ),
    );
  }
}

class _IssueType {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  const _IssueType(this.label, this.icon, this.bgColor, this.iconColor);
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1A1A2E),
        letterSpacing: 1.2,
      ),
    );
  }
}