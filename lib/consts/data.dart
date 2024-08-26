

import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/app_model.dart';
import '../models/color_model.dart';
import '../models/device_model.dart';
import '../models/experience_model.dart';
import '../models/skill_model.dart';
import '../screen/miniProjects/about/about.dart';
import '../screen/miniProjects/education/education.dart';
import '../screen/miniProjects/experience/experience.dart';
import '../screen/miniProjects/skills/skills.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double baseHeight = 790;
const double baseWidth = 1340;

List<DeviceModel> devices = [
  DeviceModel(
    device: Devices.android.onePlus8Pro,
    icon: Icons.android,
  ),
  DeviceModel(
    device: Devices.ios.iPhone13,
    icon: Icons.apple,
  ),
  DeviceModel(
    device: Devices.ios.iPad,
    icon: Icons.tablet,
  ),
];

List<ColorModel> colorPalette = [

  ColorModel(
    svgPath: "assets/images/cloudRed.svg",
    color: Colors.pinkAccent,
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.pinkAccent, Colors.orangeAccent],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.green,
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.green, Colors.teal],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xffaabbcc),
    gradient: const LinearGradient(
      colors: [Color(0xffccddaa), Color(0xff667788)],
      stops: [0, 1],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xff334455),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(-0.31, 0.95),
      colors: [Color(0xFF556677), Color(0x00334455)],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.amber,
    gradient: const LinearGradient(
      colors: [Color(0xffFFD700), Colors.brown],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xff009688),
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.cyan, Colors.deepPurple],
    ),
  ),




ColorModel(
    svgPath: "assets/images/cloudRed.svg",
    color: Colors.yellowAccent,
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      // transform: Grad,
      end: Alignment.topRight,
      colors: [Colors.yellowAccent, Colors.deepOrange],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.blue,
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      colors: [Colors.blue, Colors.black45],
    ),
  ),
  ColorModel(
      svgPath: "assets/images/cloudyBlue.svg",
      color: const Color(0xff00d6ca),
      gradient: const LinearGradient(
        colors: [Color(0xff00ebd5), Color(0xff293474)],
        stops: [0, 1],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      )),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xff123cd1),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(-0.31, 0.95),
      colors: [Color(0xFF1042F4), Color(0x00203EA6)],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.purple,
    gradient: const LinearGradient(
      colors: [Color(0xffc95edb), Colors.black12],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xfff35a32),
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.indigo, Colors.deepOrange], // Adjust colors as needed
    ),
  ),
];



List<AppModel> apps = [
  AppModel(
      title: "About",
      color: Colors.white,
      assetPath: "assets/icons/aboutme.png",
      screen: const AboutMe()),
  AppModel(
      title: "Skills",
      color: Colors.white,
      assetPath: "assets/icons/online.png",
      // icon: Icons.flutter_dash,
      screen: const Expertise()),
  AppModel(
    title: "Youtube",
    assetPath: "assets/icons/youtube.png",
    color: Colors.white,
    link: youtubeChannel,
    //isSvg: true,
  ),
  AppModel(
    title: "LinkedIn",
    assetPath: "assets/icons/linkedin.png",
    color: Colors.white,
    link: linkedIn,
   // isSvg: true,
  ),
  AppModel(
    title: "X",
    assetPath: "assets/icons/twitter.png",
    color: Colors.white,
    link: twitter,
   // isSvg: true,
  ),
  AppModel(
    title: "Instagram",
    assetPath: "assets/icons/instagram.png",
    color: Colors.white,
    link: instagram,
  ),
  AppModel(
    title: "Resume",
    assetPath: "assets/icons/cv.png",
    color: Colors.white,
    link: resumeLink,
  ),
  AppModel(
    title: "fiverr",
    assetPath: "assets/icons/fiverr.png",
    color: Colors.white,
    link: fiverLink,
  ),
  AppModel(
    title: "Whatsapp",
    assetPath: "assets/icons/whatsapp.png",
    color: Colors.white,
    link: whatsapp,
  ),
  AppModel(
      title: "Experience",
      color: Colors.white,
      assetPath: "assets/icons/experience.png",
     // icon: FontAwesomeIcons.idBadge,
      screen: const Experience()),
  AppModel(
    title: "Education",
    color: Colors.white,
    assetPath: "assets/icons/education.png",
    //icon: FontAwesomeIcons.edge,
    screen: const Education(),
  ),
  AppModel(
    title: "Github",
    assetPath: "assets/icons/github.png",
    color: Colors.white,
    link: github,
   // isSvg: true,
  ),
  AppModel(
    title: "Play Store",
    assetPath: "assets/icons/playstore.png",
    color: Colors.white,
    link: playApps,
   // isSvg: true,
  ),
];

final List<JobExperience> education = [
  JobExperience(
    color: Colors.red,
    location: "Udaipur, Rajasthan, India",
    title: 'Master of Computer Applications',
    company: 'Mohanlal Sukhadia University',
    startDate: 'July 2022',
    endDate: 'Sept 2024',
    bulletPoints: [
      "Dream big, work hard and stay focused.",
    ],
  ),
  JobExperience(
    color: Colors.red,
    location: "online",
    title: 'Data Science and ML Certification',
    company: 'Edureka',
    startDate: 'June 2022',
    endDate: 'jan 2023',
    bulletPoints: [
      "I learn data science and ml, make a movie suggestion web app",
    ],
  ),
  JobExperience(
    color: Colors.blue,
    location: "Udaipur, Rajasthan, India",
    title: 'Bachelor of Computer Applications',
    company: "Bhupal Noble's University",
    startDate: 'Aug 2018',
    endDate: 'April 2021',
    bulletPoints: [
      'The end of one chapter is just the beginning of another.',
    ],
  ),
];

final List<JobExperience> jobExperiences = [

  // Add more job experiences here...


  JobExperience(
    color: Colors.redAccent,
    location: "Udaipur, Rajasthan, India",
    title: 'Flutter Developer',
    company: 'Idea2reality',
    startDate: 'Mar 2024',
    endDate: 'present',
    bulletPoints: [
      "Developed an E-Commerce Application: Built and launched a feature-rich e-commerce app with functionalities for product browsing, cart management, order placement, and payment processing.",
      "Improved Design: Update the app's layout and design to make it more modern and user-friendly.",
      "Deployed Application to Google Play Store"
      "Version Control Management: Implemented version control using Git, managing code changes, branching, and merging to streamline collaboration and maintain code quality.",
      "Improved Design: Update the app's layout and design to make it more modern and user-friendly.",
      "Implement intricate animations using Rive, enhancing the app's visual appeal and engagement.",
    ],
  ),
  JobExperience(
    color: Colors.blue,
    location: "Udaipur, Rajasthan, India",
    title: 'Flutter Developer Intern',
    company: 'Editors Chamber',
    startDate: 'Sep 2023',
    endDate: 'Feb 2024 ',
    bulletPoints: [

      "Gained Proficiency in Flutter: Developed mobile applications using Flutter, focusing on creating responsive and interactive user interfaces.",

      "Integrated Firebase Services: Implemented Firebase Authentication, Firestore, and Firebase Cloud Messaging to enhance app functionality and user experience.",

      " Mastered Dart Programming: Utilized Dart for building efficient and maintainable Flutter applications, ensuring robust code architecture.",

      "API Integration: Integrated various RESTful APIs into Flutter applications to facilitate data exchange and backend communication, enhancing app features and performance."

    ],
  ),
  JobExperience(
    color: Colors.orangeAccent,
    location: "Remote",
    title: 'Self employee',
    company: 'Codewaya',
    startDate: 'Aug 2022',
    endDate: 'present',
    bulletPoints: [
      "Developed a Chat Application: Built a fully functional chat app from scratch, incorporating real-time messaging features, user authentication, and chat history management.",
      "Created Custom Widgets: Designed and implemented custom widgets to enhance the user interface and experience, including chat bubbles, user avatars, and message input fields.",

    ],
  ),


];

const String youtubeChannel = "https://www.youtube.com/@diariesofacoder";
const String linkedIn = "https://www.linkedin.com/in/rahul-sukhwal-51a188212/";
const String github = "https://github.com/raulsukhwal";
const String twitter = "https://x.com/dairiesofcoder";
const String instagram = "https://www.instagram.com/apart.from.coding?igsh=MWNoNHNudmNrN2R3ZQ==";
const String topMate = "https://topmate.io/rahul_sukhwal?utm_source=topmate&utm_medium=popup&utm_campaign=Page_Ready";
const String resumeLink =
    "https://drive.google.com/file/d/11EhUmzuhTqqQKucYxFZA5WDvsVdLOcP7/view?usp=sharing";
const String fiverLink =
    "https://www.fiverr.com/rahulsukhwal/buying?source=avatar_menu_profile";
const String email = "rahul68sukhwal@gmail.com";
String introduction = '''Welcome to my digital playground!. with a year of Flutter development experience, I’ve had the opportunity to work on a variety of exciting projects, including my latest work PALLIMART, an innovative e-commerce app for grocery delivery. My journey also includes collaborating with startups, such as my recent role at IDEA2REALITY, where we developed an app to help delivery personnel efficiently locate and complete their deliveries.

When I’m not coding or brainstorming the next big app, you can find me on the cricket field, channeling my competitive spirit and teamwork skills. I also enjoy exploring new content on YouTube, going on outings, and keeping up with the latest tech trends online.

     Feel free to explore and connect with me!
''';
const String whatsapp = "https://wa.me/918209556233?text=Hello, Rahul! I found you through your portfolio and wanted to reach out.,%20I%20would%20like%20to%20inquire%20about%20your%20services";


const String playApps =
    "https://play.google.com/store/apps/details?id=com.pallimart.app";

List<SkillsModel> skills = [
  SkillsModel(skillName: "Flutter", colorS: Colors.blue, iconPath: "random"),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Github",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Dart",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Provider",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Getx",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Material Design and Cupertino",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Testing and Debugging",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "AI and ML Integration",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "RESTful APIs",
    colorS: Colors.yellow,
  ),
];

List<SkillsModel> languages = [
  SkillsModel(skillName: "Hindi", colorS: Colors.black),
  SkillsModel(skillName: "English", colorS: Colors.blueGrey),
];
