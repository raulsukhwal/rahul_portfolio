import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_portfolio/consts/data.dart';
import 'package:awesome_portfolio/providers/current_state.dart';
import 'package:awesome_portfolio/providers/theme_provider.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../widgets/frosted_container.dart';
import '../../widgets/rain_cloud.dart';
import 'phone_screen_wrapper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_portfolio/consts/data.dart';
import 'package:awesome_portfolio/providers/current_state.dart';
import 'package:awesome_portfolio/providers/theme_provider.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../widgets/frosted_container.dart';
import '../../widgets/rain_cloud.dart';
import 'phone_screen_wrapper.dart';
import 'package:video_player/video_player.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    CurrentState currentState =
    Provider.of<CurrentState>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    theme.size = MediaQuery.of(context).size;
    theme.widthRatio = theme.size.width / baseWidth;
    theme.heightRatio = theme.size.height / baseHeight;
    bool phone = size.width < 800;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
     // expandedHeight: MediaQuery.of(context).size.height * 0.8,
            expandedHeight: MediaQuery.of(context).size.height * 1, // Adjust the expandedHeight as needed
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Image Background
                  Positioned.fill(
                    child: Image.asset(
                      'assets/git/welcome-git.gif',
                      fit: BoxFit.cover, // Ensure the image covers the area without being distorted
                    ),
                  ),

                  // Overlay content (e.g., title and animations)
                  // Positioned(
                  //   bottom: 0,
                  //   left: 0,
                  //   right: 0,
                  //   // child: Container(
                  //   //   padding: const EdgeInsets.all(20.0),
                  //   //   color: Colors.black.withOpacity(0.3), // Semi-transparent overlay
                  //   //   child: AnimatedText(), // Your animated text or other widgets
                  //   // ),
                  // ),
                ],
              ),
            ),
          )


          ,SliverToBoxAdapter(

            child: Stack(
              children: [
                Selector<CurrentState, Gradient>(
                  selector: (context, provider) => provider.bgGradient,
                  builder: (context, _, __) {
                    return Container(
                      height: size.height, // Ensure the container fills the height
                      decoration: BoxDecoration(gradient: currentState.bgGradient),
                    );
                  },
                ),
                size.height > 600
                    ? const Rain(
                  oposite: false,
                  top: 300,
                )
                    : Container(),
                Selector<CurrentState, String>(
                  selector: (context, provider) => provider.selectedCloud,
                  builder: (context, _, __) {
                    return SvgPicture.asset(
                      currentState.selectedCloud,
                      height: size.height,
                      fit: BoxFit.cover,
                    );
                  },
                ),
                size.height > 600
                    ? const Rain(
                  oposite: true,
                  top: 50,
                )
                    : Container(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        phone
                            ? Container()
                            : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildFrostedContainer1(theme, currentState),
                            _buildFrostedContainer2(theme, currentState),
                          ],
                        ),

                        // Main mobile screen
                        SizedBox(
                          height: size.height - 100,
                          child: Consumer<CurrentState>(
                            builder: (context, _, __) {
                              return DeviceFrame(
                                device: currentState.currentDevice,
                                screen: Container(
                                    decoration: BoxDecoration(
                                        gradient: currentState.bgGradient),
                                    child: ScreenWrapper(
                                        childG: currentState.currentScreen)),
                              );
                            },
                          ),
                        ),

                        // Right side frosted containers
                        phone
                            ? Container()
                            : Column(
                          children: [
                            _buildFrostedContainer3(theme, currentState),
                            const SizedBox(height: 10),
                            _buildFrostedContainer4(theme, currentState),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10 * theme.heightRatio),

                    // Bottom button for device selection
                    Selector<CurrentState, DeviceInfo>(
                        selector: (context, p1) => p1.currentDevice,
                        builder: (context, _, __) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ...List.generate(devices.length, (index) {
                                return CustomButton(
                                  pressed: currentState.currentDevice ==
                                      devices[index].device
                                      ? Pressed.pressed
                                      : Pressed.notPressed,
                                  animate: true,
                                  borderRadius: 100,
                                  isThreeD: true,
                                  backgroundColor: Colors.black,
                                  width: 37.5,
                                  height: 37.5,
                                  onPressed: () {
                                    currentState.changeSelectedDevice(
                                      devices[index].device,
                                    );
                                  },
                                  child: Center(
                                    child: Icon(
                                      devices[index].icon,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                );
                              })
                            ],
                          );
                        })
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );


  }

  Widget _buildFrostedContainer1(ThemeProvider theme, CurrentState currentState) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.01)
        ..rotateY(-0.06),
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(top: 0, bottom: 10 * theme.heightRatio),
        child: FrostedWidget(
          childW: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(-0.06),
              alignment: FractionalOffset.center,
              child: Row(
                children: [
                  Flexible(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: AutoSizeText(
                          'believe',
                          style: GoogleFonts.exo(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          maxFontSize: 35,
                          minFontSize: 15,
                          maxLines: 1,
                        ).animate().fadeIn(
                            delay: .8.seconds, duration: .7.seconds),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          height: 395 * theme.heightRatio,
          width: 247.5 * theme.widthRatio,
        ),
      ),
    );
  }

  Widget _buildFrostedContainer2(ThemeProvider theme, CurrentState currentState) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.009999)
        ..rotateY(-0.07),
      alignment: Alignment.topCenter,
      child: FrostedWidget(
        onPressed: () {
          currentState.launchInBrowser(topMate);
        },
        childW: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/topMate.png",
                  width: 50 * theme.widthRatio * theme.heightRatio,
                  height: 50 * theme.widthRatio * theme.heightRatio,
                ),
                SizedBox(height: 10 * theme.heightRatio),
                Flexible(
                    child: AutoSizeText(
                      "Let's connect!",
                      style: GoogleFonts.exo(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 28 * theme.widthRatio * theme.heightRatio,
                      ),
                      textAlign: TextAlign.center,
                      maxFontSize: 28,
                      minFontSize: 15,
                    )),
              ],
            ).animate().fadeIn(delay: 1.seconds, duration: .7.seconds),
          ),
        ),
        height: 175.5 * theme.heightRatio,
        width: 245 * theme.widthRatio,
      ),
    );
  }

  Widget _buildFrostedContainer3(ThemeProvider theme, CurrentState currentState) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.01)
        ..rotateY(0.06),
      alignment: Alignment.bottomCenter,
      child: FrostedWidget(
        height: 395 * theme.heightRatio,
        width: 247.5 * theme.widthRatio,
        childW: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: [

                ...List.generate(
                  colorPalette.length,
                      (index) => Consumer<CurrentState>(
                      builder: (context, _, __) {
                        return CustomButton(
                          margin: const EdgeInsets.all(10),
                          pressed:
                          currentState.selectedColor ==
                              index
                              ? Pressed.pressed
                              : Pressed.notPressed,
                          animate: true,
                          borderRadius: 100,
                          shadowColor: Colors.blueGrey[50],
                          isThreeD: true,
                          backgroundColor:
                          colorPalette[index].color,
                          width: 50 * theme.widthRatio,
                          height: 50 * theme.widthRatio,
                          onPressed: () {
                            currentState
                                .changeGradient(index);
                          },
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrostedContainer4(ThemeProvider theme, CurrentState currentState) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.009999)
        ..rotateY(0.07),
      alignment: Alignment.topCenter,
      child: FrostedWidget(
        onPressed: () {
          currentState.launchInBrowser(topMate);
        },
        childW: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/topMate.png",
                  width: 50 * theme.widthRatio * theme.heightRatio,
                  height: 50 * theme.widthRatio * theme.heightRatio,
                ),
                SizedBox(height: 10 * theme.heightRatio),
                Flexible(
                    child: AutoSizeText(
                      "Let's connect!",
                      style: GoogleFonts.exo(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 28 * theme.widthRatio * theme.heightRatio,
                      ),
                      textAlign: TextAlign.center,
                      maxFontSize: 28,
                      minFontSize: 15,
                    )),
              ],
            ).animate().fadeIn(delay: 1.seconds, duration: .7.seconds),
          ),
        ),
        height: 175.5 * theme.heightRatio,
        width: 245 * theme.widthRatio,
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Animated Text Here',
      style: TextStyle(color: Colors.white, fontSize: 24),
    ).animate().fadeIn(
        delay: .8.seconds, duration: .7.seconds);
  }
}

