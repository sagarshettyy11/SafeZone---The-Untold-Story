// widgets/floating_bottom_nav.dart

import 'package:flutter/material.dart';

class FloatingBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const FloatingBottomNav({super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(Icons.grid_view_rounded, 'Dashboard'),
      _NavItem(Icons.map_outlined, 'Map'),
      _NavItem(Icons.emergency, 'SOS'),
      _NavItem(Icons.bar_chart_outlined, 'Reports'),
      _NavItem(Icons.person_outline, 'Profile'),
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF1A2420),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.25), blurRadius: 12, offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (i) {
            final selected = i == selectedIndex;
            return GestureDetector(
              onTap: () => onTap(i),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: selected ? 52 : 44,
                    height: selected ? 46 : 38,
                    decoration: BoxDecoration(
                      color: selected ? const Color(0xFFB5E61D) : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(items[i].icon, color: selected ? const Color(0xFF1A2420) : Colors.white54, size: 22),
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
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem(this.icon, this.label);
}
