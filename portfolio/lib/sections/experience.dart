import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF111111), Color(0xFF1c1c1c)],
              ),
            ),
          ),
          // Top white patch (glow)
          Positioned(
            top: 100,
            left: 30,
            child: Container(
              width: 1020,
              height: 1000,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.white.withOpacity(0.15), Colors.transparent],
                ),
              ),
            ),
          ),
          // Bottom white patch (glow)
          Positioned(
            bottom: 100,
            right: 10,
            child: Container(
              width: 1020,
              height: 1000,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.white.withOpacity(0.1), Colors.transparent],
                ),
              ),
            ),
          ),
          // Navbar at top center
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Wrap(
                spacing: 27,
                alignment: WrapAlignment.center,
                children: [
                 // ...existing code...
_NavButton(
  title: 'Home',
  isActive: false,
  onTap: () {
    if (ModalRoute.of(context)?.settings.name != '/') {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  },
),
_NavButton(
  title: 'About',
  isActive: false,
  onTap: () { if (ModalRoute.of(context)?.settings.name != '/about') {
      Navigator.pushNamedAndRemoveUntil(context, '/about', (route) => false);
    }},
),
_NavButton(
  title: 'Projects',
  isActive: false,
  onTap: () {
    if (ModalRoute.of(context)?.settings.name != '/projects') {
      Navigator.pushNamedAndRemoveUntil(context, '/projects', (route) => false);
    }
  },
),
_NavButton(
  title: 'Experience',
  isActive: true,
  onTap: () {
   
  },
),
_NavButton(
  title: 'Contact Me',
  isActive: false,
  onTap: () {
    if (ModalRoute.of(context)?.settings.name != '/contact') {
      Navigator.pushNamedAndRemoveUntil(context, '/contact', (route) => false);
    }
  },
),
// ...existing code...
                ],
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "My Experience",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  "Here are some of my  experiences and roles.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                // Experience Cards
                // ...existing code...
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const [
    SizedBox(
      width: 360, // Decreased width
      child: _ExperienceCard(
        icon: Icons.leaderboard,
        iconColor: Colors.purpleAccent,
        title: "App Developer Coordinator",
        subtitle: "GDG On Campus, KIET",
        description:
          "- Focused on deep learning and practical implementation of Flutter through real-world projects.\n\n- Mentored 100+ developers in Flutter,\nsimplifying concepts and providing 1:1 guidance.\n\n- Organized large-scale technical events like IEEE-SSH 2024 and SprintHacks with 1000+ participants.\n",
      ),
    ),
    SizedBox(width: 32),
    SizedBox(
      width: 360, // Decreased width
      child: _ExperienceCard(
        icon: Icons.leaderboard,
        iconColor: Colors.deepPurple,
        title: "Technical Member\n(App Development Head)",
        subtitle: "Uddeshhya KIET",
        description:
          "- Worked with a team of developers and designers to learn and create innovative solutions.\n\n- Created Uddeshhya app  and mentored junior members in coding and project management. \n\n- Contributed to the development of the Uddeshhya website, structuring its UI for a seamless and user-friendly experience",
      ),
    ),
  ],
),
// ...existing code...
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String description;

  const _ExperienceCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      decoration: BoxDecoration(
        color: const Color(0xFF23232b),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 48),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

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
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal, ),
      ),
    );
  }
}