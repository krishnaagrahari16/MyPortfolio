import 'package:flutter/material.dart';
import 'package:portfolio/sections/about.dart';
import 'package:portfolio/sections/contactsection.dart';
import 'package:portfolio/sections/experience.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentSection = 'Home';

  void _navigateTo(String section) {
    setState(() {
      _currentSection = section;
    });
    if (section == 'Contact Me') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ContactMePage()),
      );
    } else if (section == 'About') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AboutMePage()),
      );
    }
     else if (section == 'Experience') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ExperiencePage()),
      );
    }
    // Add navigation for other sections if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background gradient and glow
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF111111), Color(0xFF1c1c1c)],
              ),
            ),
          ),
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

          // Navbar
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

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage('assets/images/Avatar.png'),
                  ),
                  const SizedBox(height: 30),
                  // RichText with gradient name
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Hello I\'m ',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        TextSpan(
                          text: 'Krishna ',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [Colors.pink, Colors.orange, Colors.purple],
                              ).createShader(const Rect.fromLTWH(0, 0, 300, 70)),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Flutter Developer | UI/UX Designer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Wrap(
                    spacing: 30,
                    alignment: WrapAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(
                              'https://www.linkedin.com/in/krishna-kumar-agrahari-24b2792a8/'));
                        },
                        child: Image.asset(
                          'assets/images/linkedin.jpg',
                          width: 35,
                          height: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(
                              'https://github.com/krishnaagrahari16'));
                        },
                        child: Image.asset(
                          'assets/images/github.jpg',
                          width: 40,
                          height: 35,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse('https://x.com/KrishnaAgr82234'));
                        },
                        child: Image.asset(
                          'assets/images/X.jpg',
                          width: 40,
                          height: 35,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 30,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => _navigateTo('Contact Me'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 253, 253),
                          foregroundColor:
                              const Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ).copyWith(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: const Text(
                          'Get in Touch',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          const url =
                              'https://drive.google.com/file/d/1KXvH5nRwO19pk14pkFLDT1Oez2eQctIo/view?usp=drive_link';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url),
                                mode: LaunchMode.platformDefault);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Failed to open resume PDF')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ).copyWith(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: const Text(
                          'Download Resume',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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