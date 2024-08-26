import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../consts/data.dart';
import '../../../models/experience_model.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white60,
      body: ListView(
        children: [
          // const SizedBox(
          //   height: 20,
          // ),
          const Center(
            child: Icon(
              Icons.badge_outlined,
              size: 100,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...List.generate(jobExperiences.length, (index) {
            JobExperience experience = jobExperiences[index];
            return ExpansionTile(
              tilePadding: const EdgeInsets.all(20),
              childrenPadding: const EdgeInsets.all(10),
              leading: Container(
                width: 2,
                height: 100,
                color: experience.color,
              ),
              title: Text(
                experience.title,
                style: GoogleFonts.inter(fontWeight: FontWeight.w900),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '${experience.company}\n${experience.startDate} - ${experience.endDate} | ${experience.location}',
                  style: GoogleFonts.inter(fontSize: 18, color: Colors.black54,fontWeight: FontWeight.w700),
                ),
              ),
              children: experience.bulletPoints.map((bulletPoint) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                  // leading: const Icon(Icons.arrow_right),
                  // title: Text(bulletPoint),
                  // contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  // leading: Container(
                  //   width: 5,
                  //   height: 5,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(100),
                  //       color: Colors.black),
                  // ),
                  title: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.black),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          bulletPoint,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          })
        ],
      ),
    );
  }
}
