import 'package:flutter/material.dart';
import 'package:portfolio/sections/HomeSection.dart';
import 'package:portfolio/sections/about.dart';

import 'package:portfolio/sections/contactsection.dart';
import 'package:portfolio/sections/experience.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Krishna Agrahari | Portfolio',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
         '/about': (context) => const AboutMePage(),
        '/contact': (context) => const ContactMePage(),
        '/experience': (context) => const ExperiencePage(),
      },
    );
  }
}