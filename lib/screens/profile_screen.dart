import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _biometricEnabled = true;
  bool _darkModeEnabled = false;
  int _selectedNavIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF1F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildAppBar(),
                    _buildProfileHeader(),
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle('ACCOUNT'),
                          const SizedBox(height: 10),
                          _buildSettingsCard([
                            _buildNavItem(
                              icon: Icons.person_outline,
                              iconBg: const Color(0xFFEEF5E0),
                              iconColor: const Color(0xFF4A8A22),
                              title: 'Personal Information',
                            ),
                            _buildDivider(),
                            _buildNavItem(
                              icon: Icons.phone_outlined,
                              iconBg: const Color(0xFFEEF5E0),
                              iconColor: const Color(0xFF4A8A22),
                              title: 'Phone Number',
                            ),
                            _buildDivider(),
                            _buildNavItem(
                              icon: Icons.mail_outline,
                              iconBg: const Color(0xFFEEF5E0),
                              iconColor: const Color(0xFF4A8A22),
                              title: 'Email Address',
                            ),
                          ]),
                          const SizedBox(height: 24),
                          _buildSectionTitle('SAFETY & SECURITY'),
                          const SizedBox(height: 10),
                          _buildSettingsCard([
                            _buildNavItem(
                              icon: Icons.contacts_outlined,
                              iconBg: const Color(0xFFFFF0F0),
                              iconColor: const Color(0xFFE53935),
                              title: 'Emergency Contacts',
                            ),
                            _buildDivider(),
                            _buildNavItem(
                              icon: Icons.medical_information_outlined,
                              iconBg: const Color(0xFFFFF0F0),
                              iconColor: const Color(0xFFE53935),
                              title: 'Medical Information',
                            ),
                            _buildDivider(),
                            _buildToggleItem(
                              icon: Icons.fingerprint,
                              iconBg: const Color(0xFFFFF0F0),
                              iconColor: const Color(0xFFE53935),
                              title: 'Biometric Lock',
                              value: _biometricEnabled,
                              onChanged: (v) => setState(() => _biometricEnabled = v),
                            ),
                          ]),
                          const SizedBox(height: 24),
                          _buildSectionTitle('PREFERENCES'),
                          const SizedBox(height: 10),
                          _buildSettingsCard([
                            _buildNavItem(
                              icon: Icons.notifications_none,
                              iconBg: const Color(0xFFF0F2FA),
                              iconColor: const Color(0xFF1A1A2E),
                              title: 'Notifications',
                            ),
                            _buildDivider(),
                            _buildToggleItem(
                              icon: Icons.dark_mode_outlined,
                              iconBg: const Color(0xFFF0F2FA),
                              iconColor: const Color(0xFF1A1A2E),
                              title: 'Dark Mode',
                              value: _darkModeEnabled,
                              onChanged: (v) => setState(() => _darkModeEnabled = v),
                            ),
                            _buildDivider(),
                            _buildNavItemWithValue(
                              icon: Icons.language_outlined,
                              iconBg: const Color(0xFFF0F2FA),
                              iconColor: const Color(0xFF1A1A2E),
                              title: 'Language',
                              value: 'English (US)',
                            ),
                          ]),
                          const SizedBox(height: 24),

                          // Log Out
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: const Color(0xFFFFDDDD)),
                            ),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.logout, color: Color(0xFFE53935), size: 20),
                              label: const Text(
                                'Log Out',
                                style: TextStyle(
                                  color: Color(0xFFE53935),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Center(
                            child: Text(
                              'Version 2.4.0 (Pro Tier)',
                              style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
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

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.arrow_back, size: 22, color: Color(0xFF1A1A2E)),
              const SizedBox(width: 10),
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
          const Icon(Icons.settings_outlined, size: 24, color: Color(0xFF1A1A2E)),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFB5E61D), width: 3),
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://randomuser.me/api/portraits/men/32.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1A2420),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.camera_alt, color: Colors.white, size: 15),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Kevin Merico',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF5E0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'PREMIUM MEMBER',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A8A22),
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'EDIT PROFILE',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4A8A22),
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1A1A2E),
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(title,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF1A1A2E))),
          ),
          Icon(Icons.chevron_right, color: Colors.grey[400], size: 22),
        ],
      ),
    );
  }

  Widget _buildNavItemWithValue({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(title,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF1A1A2E))),
          ),
          Text(value, style: TextStyle(fontSize: 14, color: Colors.grey[500])),
          const SizedBox(width: 4),
          Icon(Icons.chevron_right, color: Colors.grey[400], size: 22),
        ],
      ),
    );
  }

  Widget _buildToggleItem({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(title,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF1A1A2E))),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: const Color(0xFF4CAF50),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, indent: 68, endIndent: 16, color: Colors.grey[100]);
  }

  Widget _buildBottomNav() {
    final items = [
      _NavItem(Icons.grid_view_rounded, 'Dashboard'),
      _NavItem(Icons.map_outlined, 'Map'),
      _NavItem(Icons.emergency, 'SOS'),
      _NavItem(Icons.bar_chart_outlined, 'Reports'),
      _NavItem(Icons.person_outline, 'Profile'),
    ];
    return Container(
      color: const Color(0xFF1A2420),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final selected = i == _selectedNavIndex;
          return GestureDetector(
            onTap: () => setState(() => _selectedNavIndex = i),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: selected ? 52 : 44,
                  height: selected ? 52 : 44,
                  decoration: BoxDecoration(
                    color: selected ? const Color(0xFFB5E61D) : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(items[i].icon,
                      color: selected ? const Color(0xFF1A2420) : Colors.white54,
                      size: 22),
                ),
                const SizedBox(height: 2),
                Text(
                  items[i].label,
                  style: TextStyle(
                    fontSize: 10,
                    color: selected ? const Color(0xFFB5E61D) : Colors.white38,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem(this.icon, this.label);
}