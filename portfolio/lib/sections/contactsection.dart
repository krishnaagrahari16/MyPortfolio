import 'package:flutter/material.dart';
import 'package:portfolio/sections/HomeSection.dart';
import 'package:portfolio/sections/about.dart';
import 'package:portfolio/sections/experience.dart';

class ContactMePage extends StatelessWidget {
  const ContactMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('  Contact Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(height: 8),
                Text('  You can reach out to me using the form below or via email.',
                style: TextStyle(
                  color: const Color.fromARGB(255, 126, 127, 127).withOpacity(0.8),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                ),),
                const SizedBox(height: 50),
                _buildTextField(
                  icon: Icons.person,
                  label: 'Name',
                  hint: 'Enter your name',
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  icon: Icons.email,
                  label: 'Email',
                  hint: 'Enter your email',
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  icon: Icons.subject,
                  label: 'Subject',
                  hint: 'Enter subject',
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  icon: Icons.message,
                  label: 'Message',
                  hint: 'Enter your message',
                  maxLines: 6,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Message Sent!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Send Message',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.send, color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'You can also reach me via : krishnaagrahari.16@gmail.com',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 126, 127, 127).withOpacity(0.8),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
                    isActive: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    },
                  ),
                  _NavButton(
                    title: 'About',
                    isActive: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AboutMePage()),
                      );
                    },
                  ),
                  _NavButton(
                    title: 'Projects',
                    isActive: false,
                    onTap: () {},
                  ),
                  _NavButton(
                    title: 'Experience',
                    isActive: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ExperiencePage()),
                      );
                    },
                  ),
                  _NavButton(
                    title: 'Contact Me',
                    isActive: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String label,
    required String hint,
    int maxLines = 1,
  }) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.deepPurpleAccent),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        filled: true,
        fillColor: Colors.white12,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
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