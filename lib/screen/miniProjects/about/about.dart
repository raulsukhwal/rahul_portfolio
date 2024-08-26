import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../consts/data.dart';
import '../../../providers/current_state.dart';
import '../../../providers/theme_provider.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    CurrentState currentState =
    Provider.of<CurrentState>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    theme.size = MediaQuery.of(context).size;
    theme.widthRatio = theme.size.width / baseWidth;
    theme.heightRatio = theme.size.height / baseHeight;
    bool phone = false;
    if (size.width < 800) {
      phone = true;
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color:  Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.transparent, // Set this to avoid any background color
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/myphoto.jpg',
                        width: 240, // The diameter of the CircleAvatar (2 * radius)
                        height: 240, // The diameter of the CircleAvatar
                        fit: BoxFit.cover, // This ensures the image fits and zooms in the circle
                      ),
                    ),
                  ),
                )




                ,
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 20),
                  child: Text(
                    "Hi, I am Rahul Sukhwal",
                    style: GoogleFonts.openSans(
                        fontSize: 24, fontWeight: FontWeight.w800,color: Colors.white60),
                  ),
                ),
                Text(
                  introduction,
                  style: GoogleFonts.openSans(
                      fontSize: 18, fontWeight: FontWeight.w800,color: Colors.white60),
                ).animate().fadeIn(duration: const Duration(milliseconds: 500)),
                const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () => _launchWhatsApp(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.whatsapp, // WhatsApp icon
                          color: Colors.green, // Icon color
                          size: 20, // Icon size
                        ),
                        const SizedBox(width: 8), // Space between icon and text
                        Text(
                          "Message me on WhatsApp",
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60,
                            decoration: TextDecoration.underline,
                          ),

                        ),
                        const SizedBox(height: 8),
                      ],
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchWhatsApp() async {
    const String phoneNumber = "+918209556233"; // Replace with your phone number
    const String message = "Hello, Rahul! I found you through your portfolio and wanted to reach out.";

    final String url = "https://api.whatsapp.com/send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
