import 'package:flutter/material.dart';
import 'package:screen_testing/components/bottom_navigation.dart';

class SafetyDashboard extends StatefulWidget {
  const SafetyDashboard({super.key});
  @override
  State<SafetyDashboard> createState() => _SafetyDashboardState();
}

class _SafetyDashboardState extends State<SafetyDashboard> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF1F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 16),
              _buildEmergencyBanner(),
              const SizedBox(height: 20),
              _buildQuickActionsGrid(),
              const SizedBox(height: 20),
              _buildLocalSafetyMetrics(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FloatingBottomNav(
        selectedIndex: selectedIndex,
        onTap: (i) {
          setState(() => selectedIndex = i);
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style: TextStyle(fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.w400),
            ),
            const Text(
              'Kevin Merico!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E)),
            ),
            Text('Keep manage your sales with care.', style: TextStyle(fontSize: 13, color: Colors.grey[500])),
          ],
        ),
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.grid_view_rounded, color: Color(0xFF1A1A2E), size: 22),
            ),
            const SizedBox(width: 10),
            const CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 52,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search anything in Sirehoma...',
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
          prefixIcon: const SizedBox(),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search, color: Colors.grey[500]),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildEmergencyBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(color: const Color(0xFFFEEAEA), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(color: Color(0xFFD32F2F), shape: BoxShape.circle),
            child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Emergency Help',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFD32F2F)),
                ),
                Text('Tap to alert nearby response teams', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey[400]),
        ],
      ),
    );
  }

  Widget _buildQuickActionsGrid() {
    final actions = [
      _ActionItem(
        icon: Icons.access_time_outlined,
        title: 'Report\nComplaint',
        subtitle: 'Submit immediate safety concerns.',
      ),
      _ActionItem(icon: Icons.map_outlined, title: 'Safety Map', subtitle: 'View real-time zone alerts.'),
      _ActionItem(icon: Icons.bar_chart_outlined, title: 'My Reports', subtitle: 'Track your submitted tickets.'),
      _ActionItem(icon: Icons.lightbulb_outline, title: 'Safety Tips', subtitle: 'Professional protocols & advice.'),
    ];

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.95, // ✅ FIX: was 1.05 — increased card height to prevent overflow
      children: actions
          .map(
            (item) => Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(color: const Color(0xFFF0F1F5), borderRadius: BorderRadius.circular(12)),
                    child: Icon(item.icon, color: const Color(0xFF1A1A2E), size: 22),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E),
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(item.subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[500], height: 1.4)),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildLocalSafetyMetrics() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Local Safety Metrics',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E)),
              ),
              Icon(Icons.more_vert, color: Colors.grey[400]),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'SHELTER REACHABILITY',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.grey[500], letterSpacing: 1.0),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '94%',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E)),
              ),
              Row(
                children: [
                  const Icon(Icons.trending_up, color: Color(0xFF8BC34A), size: 18),
                  const SizedBox(width: 4),
                  Text('+2% today', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: const LinearProgressIndicator(
              value: 0.94,
              minHeight: 8,
              backgroundColor: Color(0xFFE0E0E0),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFB5E61D)),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(height: 1, color: Color(0xFFF0F0F0)),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RESPONSE TIME',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[500],
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 6),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '3.2',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E)),
                          ),
                          TextSpan(
                            text: ' min',
                            style: TextStyle(fontSize: 14, color: Color(0xFF1A1A2E)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PATROL DENSITY',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[500],
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Text(
                          'High',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E)),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(color: Color(0xFF8BC34A), shape: BoxShape.circle),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionItem {
  final IconData icon;
  final String title;
  final String subtitle;

  _ActionItem({required this.icon, required this.title, required this.subtitle});
}
