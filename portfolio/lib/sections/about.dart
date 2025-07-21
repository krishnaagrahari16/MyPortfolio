import 'package:flutter/material.dart';
import 'package:portfolio/sections/HomeSection.dart';
import 'package:portfolio/sections/contactsection.dart';
import 'package:portfolio/sections/experience.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  String _currentSection = 'About';

  void _navigateTo(String section) {
    setState(() {
      _currentSection = section;
    });
    if (section == 'Home') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else if (section == 'About') {
      // Already on About, do nothing
    } else if (section == 'Experience') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ExperiencePage()),
      );
    } else if (section == 'Contact Me') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ContactMePage()),
      );
    }
    // Add more sections as needed
  }

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
                  _NavButton(
                    title: 'Home',
                    isActive: _currentSection == 'Home',
                    onTap: () => _navigateTo('Home'),
                  ),
                  _NavButton(
                    title: 'About',
                    isActive: _currentSection == 'About',
                    onTap: () => _navigateTo('About'),
                  ),
                  _NavButton(
                    title: 'Projects',
                    isActive: _currentSection == 'Projects',
                    onTap: () => _navigateTo('Projects'),
                  ),
                  _NavButton(
                    title: 'Experience',
                    isActive: _currentSection == 'Experience',
                    onTap: () => _navigateTo('Experience'),
                  ),
                  _NavButton(
                    title: 'Contact Me',
                    isActive: _currentSection == 'Contact Me',
                    onTap: () => _navigateTo('Contact Me'),
                  ),
                ],
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 100, left: 32, right: 32, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top Row: Avatar + About
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 130,
                      backgroundImage: AssetImage('assets/images/Avatar.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(width: 40),
                    // About Text
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
                            "Currently pursuing a B.Tech in Computer Science and Information Technology at KIET, Ghaziabad. I specialize in app development with Flutter & Firebase, and I’m proficient in C, Java, and Python. I also have expertise in UI/UX design using Figma.",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "I have hands-on experience from various projects, and I currently serve as the  App Development Coordinator at GDSC KIET, and Technical Member at Uddeshhya.",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "I've demonstrated leadership by leading teams in hackathons, organizing events, and serving as a core member of several tech communities. I'm also the member of the Lead Organizing team  for  SprintHacks 2.0 and SprintHacks 3.0.",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Skills Title
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Skills",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Skills Chips
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
                const SizedBox(height: 40),

                // Stats Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _StatCard(
                      icon: Icons.list,
                      value: "5+",
                      label: "Projects",
                    ),
                    _StatCard(
                      icon: Icons.person,
                      value: "1 year",
                      label: "Experience",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
      ],
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