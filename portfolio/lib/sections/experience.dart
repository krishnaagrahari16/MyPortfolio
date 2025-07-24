import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  // Navigation function for your multi-page routing
  void _navigateTo(BuildContext context, String routeName) {
    // This function checks if you are already on the page before navigating.
    if (ModalRoute.of(context)?.settings.name != routeName) {
      // It's better to use pushNamed for standard navigation unless you
      // have a specific reason to clear the stack with pushNamedAndRemoveUntil.
      Navigator.pushNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: Stack(
        children: [
          // Background Gradient (no changes here)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF111111), Color(0xFF1c1c1c)],
              ),
            ),
          ),

          // ---- CHANGE #1: Centering the Content ----
          // By wrapping the main scrollable content in a Center widget,
          // we ensure the entire block is centered horizontally on the page.
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 100.0,
                  bottom: 40.0,
                  left: 24.0,
                  right: 24.0,
                ),
                child: ExperienceContent(),
              ),
            ),
          ),

          // The Navigation Bar, aligned to the top center
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
                  _NavButton(
                    title: 'About',
                    onTap: () => _navigateTo(context, '/about'),
                  ),
                  _NavButton(
                    title: 'Projects',
                    onTap: () => {},
                  ), // Replace with your projects route
                  _NavButton(title: 'Experience', isActive: true, onTap: () {}),
                  // ---- CHANGE #2: Fixing "Contact Me" Button ----
                  // The onTap was empty. It now correctly calls the navigate function.
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

// This widget holds the main content of your experience page.
// No changes were needed here, as the centering is handled by its parent.
class ExperienceContent extends StatelessWidget {
  const ExperienceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
          "Here are some of my experiences and roles.",
          style: TextStyle(fontSize: 18, color: Colors.white70),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 32, // Horizontal space between cards
          runSpacing: 32, // Vertical space between cards if they wrap
          children: const [
            _ExperienceCard(
              icon: Icons.code,
              iconColor: Colors.purpleAccent,
              title: "App Developer Coordinator",
              subtitle: "GDG On Campus, KIET",
              description:
                  "- Focused on deep learning and practical implementation of Flutter through real-world projects.\n\n- Mentored 100+ developers in Flutter,\nsimplifying concepts and providing 1:1 guidance.\n\n- Organized large-scale technical events like IEEE-SSH 2024 and SprintHacks with 1000+ participants.\n",
            ),
            _ExperienceCard(
              icon: Icons.groups,
              iconColor: Colors.deepPurple,
              title: "Technical Member (App Dev Head)",
              subtitle: "Uddeshhya KIET",
              description:
                  "- Worked with a team of developers and designers to learn and create innovative solutions.\n\n- Created Uddeshhya app and mentored junior members in coding and project management.\n\n- Contributed to the development of the Uddeshhya website, structuring its UI for a seamless and user-friendly experience.",
            ),
          ],
        ),
      ],
    );
  }
}

// --- Helper Widgets (No Changes) ---

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
      width: 380, // Giving the cards a fixed width
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
            style: const TextStyle(color: Colors.white60, fontSize: 16),
            textAlign: TextAlign.left,
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
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
