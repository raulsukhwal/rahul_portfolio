import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../consts/data.dart';

class Expertise extends StatefulWidget {
  const Expertise({super.key});

  @override
  _ExpertiseState createState() => _ExpertiseState();
}

class _ExpertiseState extends State<Expertise> {
  List<List<Color>> gradientColors = [
    [Colors.deepPurpleAccent, Colors.pinkAccent],
    [Colors.orange, Colors.purple],
    [Colors.cyan, Colors.indigoAccent],
    [Colors.redAccent, Colors.amberAccent],
    [Colors.greenAccent, Colors.blueAccent],
  ];

  int _currentGradientIndex = 0;
  int? _selectedSkillIndex;
  int? _selectedLanguageIndex;
  bool _isSkillTapped = false;
  bool _isLanguageTapped = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentGradientIndex =
            (_currentGradientIndex + 1) % gradientColors.length;
      });
    });
  }

  void _onTapSkill(int index) {
    setState(() {
      _selectedSkillIndex = index;
      _isSkillTapped = true;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _isSkillTapped = false;
      });
    });
  }

  void _onTapLanguage(int index) {
    setState(() {
      _selectedLanguageIndex = index;
      _isLanguageTapped = true;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _isLanguageTapped = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors[_currentGradientIndex],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "My Expertise",
                    style: GoogleFonts.ibarraRealNova(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      ...List.generate(
                        skills.length,
                            (index) => MouseRegion(
                          onEnter: (_) => setState(() {
                            _selectedSkillIndex = index;
                          }),
                          onExit: (_) => setState(() {
                            _selectedSkillIndex = null;
                          }),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _selectedSkillIndex == index
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.white.withOpacity(0.2),
                              boxShadow: _selectedSkillIndex == index
                                  ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 15,
                                  offset: Offset(0, 5),
                                ),
                              ]
                                  : [],
                              border: Border.all(color: skills[index].colorS),
                            ),
                            child: AnimatedScale(
                              scale: _selectedSkillIndex == index ? 1.1 : 1.0,
                              duration: const Duration(milliseconds: 300),
                              child: AnimatedOpacity(
                                opacity: _selectedSkillIndex == index ? 0.8 : 1.0,
                                duration: const Duration(milliseconds: 300),
                                child: GestureDetector(
                                  onTap: () => _onTapSkill(index),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        skills[index].skillName,
                                        style: GoogleFonts.openSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Divider(
                    color: Colors.white70,
                    thickness: 1,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Languages",
                    style: GoogleFonts.ibarraRealNova(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      ...List.generate(
                        languages.length,
                            (index) => MouseRegion(
                          onEnter: (_) => setState(() {
                            _selectedLanguageIndex = index;
                          }),
                          onExit: (_) => setState(() {
                            _selectedLanguageIndex = null;
                          }),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _selectedLanguageIndex == index
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.white.withOpacity(0.2),
                              boxShadow: _selectedLanguageIndex == index
                                  ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 15,
                                  offset: Offset(0, 5),
                                ),
                              ]
                                  : [],
                              border: Border.all(color: languages[index].colorS),
                            ),
                            child: AnimatedScale(
                              scale: _selectedLanguageIndex == index ? 1.1 : 1.0,
                              duration: const Duration(milliseconds: 300),
                              child: AnimatedOpacity(
                                opacity: _selectedLanguageIndex == index ? 0.8 : 1.0,
                                duration: const Duration(milliseconds: 300),
                                child: GestureDetector(
                                  onTap: () => _onTapLanguage(index),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        languages[index].skillName,
                                        style: GoogleFonts.openSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
