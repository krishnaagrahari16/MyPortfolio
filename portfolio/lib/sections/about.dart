import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  // Navigation function for your multi-page routing
  void _navigateTo(BuildContext context, String routeName) {
    if (ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.pushNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF111111), Color(0xFF1c1c1c)],
              ),
            ),
          ),

          // Main content in a scroll view, centered on the page
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 120.0, bottom: 60.0),
                child: AboutMeContent(), // The content widget with the fix
              ),
            ),
          ),

          // Navigation Bar at the top
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Wrap(
                spacing: 27,
                alignment: WrapAlignment.center,
                children: [
                  _NavButton(
                    title: 'Home',
                    onTap: () => _navigateTo(context, '/'),
                  ),
                  _NavButton(title: 'About', isActive: true, onTap: () {}),
                  _NavButton(title: 'Projects', onTap: () => {}),
                  _NavButton(
                    title: 'Experience',
                    onTap: () => _navigateTo(context, '/experience'),
                  ),
                  
                  _NavButton(
                    title: 'Contact Me',
                    onTap: () => _navigateTo(context, '/contact'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---- FIX: The content widget now includes your skills and stats ----
class AboutMeContent extends StatelessWidget {
  const AboutMeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Constrain the width for better readability on wide screens
      constraints: const BoxConstraints(maxWidth: 1100),
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top section with avatar and bio
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 130,
                backgroundImage: AssetImage('assets/images/Avatar.png'),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hello, I'm Krishna Kumar Agrahari",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      "Currently pursuing a B.Tech in Computer Science and Information Technology at KIET, Ghaziabad...",
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "App Development Coordinator at GDSC KIET and Technical Member at Uddeshhya...",
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Lead Organizing team member for SprintHacks 2.0 and 3.0...",
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          const Text(
            "Skills",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),

          // --- THIS SECTION IS NOW RESTORED ---
          Wrap(
            spacing: 16,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: const [
              _SkillChip(icon: Icons.phone_iphone, label: "Flutter"),
              _SkillChip(icon: Icons.code, label: "Dart"),
              _SkillChip(icon: Icons.local_fire_department, label: "Firebase"),
              _SkillChip(icon: Icons.code, label: "C"),
              _SkillChip(icon: Icons.coffee, label: "Java"),
              _SkillChip(icon: Icons.memory, label: "Python"),
              _SkillChip(icon: Icons.design_services, label: "UI/UX Design"),
              _SkillChip(icon: Icons.bubble_chart, label: "Figma"),
            ],
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _StatCard(icon: Icons.list, value: "5+", label: "Projects"),
              _StatCard(
                icon: Icons.person,
                value: "1 year",
                label: "Experience",
              ),
            ],
          ),
          // --- END OF RESTORED SECTION ---
        ],
      ),
    );
  }
}

// --- HELPER WIDGETS (Must be in the file) ---

class _NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;
  const _NavButton({
    required this.title,
    required this.onTap,
    this.isActive = false,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.green : Colors.white,
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _SkillChip({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: const Color(0xFF23232b),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.white24),
      ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ],
    );
  }
}
