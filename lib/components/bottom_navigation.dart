import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const AppBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
          final selected = i == selectedIndex;

          return GestureDetector(
            onTap: () => onTap(i),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: selected ? 52 : 44,
                  height: selected ? 52 : 44,
                  decoration: BoxDecoration(
                    color: selected
                        ? const Color(0xFFB5E61D)
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    items[i].icon,
                    color: selected
                        ? const Color(0xFF1A2420)
                        : Colors.white54,
                    size: 22,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  items[i].label,
                  style: TextStyle(
                    fontSize: 10,
                    color: selected
                        ? const Color(0xFFB5E61D)
                        : Colors.white38,
                    fontWeight: selected
                        ? FontWeight.w600
                        : FontWeight.normal,
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