import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_portfolio/consts/data.dart';
import 'package:awesome_portfolio/providers/current_state.dart';
import 'package:awesome_portfolio/providers/theme_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';


import '../../widgets/frosted_container.dart';
import '../../widgets/rain_cloud.dart';
import 'phone_screen_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  dynamic get whtsapp => _launchWhatsApp();



  @override
  Widget build(BuildContext context) {

    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    CurrentState currentState = Provider.of<CurrentState>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    theme.size = MediaQuery.of(context).size;
    theme.widthRatio = theme.size.width / baseWidth;
    theme.heightRatio = theme.size.height / baseHeight;
    bool phone = size.width < 750;

    // Set the expanded height differently for phone and non-phone devices
    double expandedHeight = phone ? size.height * 0.5 : size.height;
    // Initialize a CarouselController
   // final CarouselController _carouselController = CarouselController();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: expandedHeight,

            pinned: false,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double height = constraints.maxHeight;
                final double parallax = (expandedHeight - height) / 2;

                return Stack(
                  fit: StackFit.expand,
                  children: [
                Positioned.fill(
                child: Image.asset(
                  'assets/git/765456.gif',
                  fit: BoxFit.cover,)),
                    Positioned(
                      top: parallax,
                      bottom: -parallax,
                      left: 0,
                      right: 0,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: height,
                          viewportFraction: 1.0,
                          autoPlay: true,
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          autoPlayCurve: Curves.elasticInOut,
                          enlargeCenterPage: false,
                        ),
                        items: [

                          'assets/git/welcoming.gif',
                          'assets/git/234561.gif',
                          // 'assets/git/swiper-background.png',
                        ].map((item) {
                          return AnimatedOpacity(
                            opacity: 1.0,
                            duration: const Duration(seconds: 3),
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                            ),
                          );
                        }).toList(),
                        // carouselController: _carouselController, // Uncomment if you're using a controller
                      ),


                    ),

                  ],
                );
              },
            ),
          ),

      SliverToBoxAdapter(
        child: Column(
          children: [
            // Gradient and background wave
            Selector<CurrentState, Gradient>(
              child: WavyContainer(
                height: MediaQuery.of(context).size.height * 0.30, // 30% of screen height
                width: MediaQuery.of(context).size.width * 1,

                // 100% of screen width
                color: Colors.black  ,                 // Dark teal color
                child: Container(
                  color: Colors.black
                ),
              ),
              selector: (context, provider) => provider.bgGradient,
              builder: (context, gradient, __) {
                return Container(
                  decoration: BoxDecoration(gradient: gradient),
                );
              },
            ),

            Stack(
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

                  top: 120, oposite: false,
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

                  top: 50, oposite: true,
                )
                    : Container(),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Check if it's a phone, show the frosted containers either on the sides or below the phone widget
                        phone
                            ? Container() // Don't show frosted containers on the side if it's a phone
                            : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildFrostedContainer1(theme, currentState),
                            _buildFrostedContainer2(theme, currentState),
                          ],
                        ),

                        SizedBox(width: 15),

                        // Main mobile screen
                        SizedBox(
                          height: size.height - 80,

                          child: Consumer<CurrentState>(
                            builder: (context, _, __) {
                              return DeviceFrame(
                                device: currentState.currentDevice,
                                screen: Container(
                                  decoration: BoxDecoration(
                                      gradient: currentState.bgGradient),
                                  child: ScreenWrapper(
                                      childG: currentState.currentScreen),
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(width: 15),

                        // Check if it's not a phone, show the frosted containers on the right side
                        phone
                            ? Container(color: Colors.red,)
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

                    // Conditionally move the frosted containers to the bottom if it's a small screen (phone)
                    // phone
                    //     ? Column(
                    //   children: [
                    //     // Rotated container
                    //     Transform.rotate(
                    //       angle: -0.5 * 3.14159, // 90 degrees in radians
                    //       child: SizedBox(
                    //         height: 250, // Width will be height in the rotated container
                    //         width: 250,  // Height will be width in the rotated container
                    //         child: _buildFrostedContainer3(theme, currentState),
                    //       ),
                    //     ),
                    //
                    //
                    //     // Row containing the second and third containers
                    //
                    //   ],
                    // )
                       // : Container(), // Non-phone layouts handled separately


                    // Device selection row
                    Selector<CurrentState, DeviceInfo>(
                      selector: (context, p1) => p1.currentDevice,
                      builder: (context, _, __) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ...List.generate(
                              phone ? 2 : devices.length, // Only show Android and iOS for phones
                                  (index) {
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
                                        devices[index].device);
                                  },
                                  child: Center(
                                    child: Icon(
                                      devices[index].icon,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )

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
                              color: Colors.white60,
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
                        color: Colors.white60,
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
          currentState.launchInBrowser(whtsapp);
        },
        childW: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   "assets/icons/clock.svg",
                //   width: 50 * theme.widthRatio * theme.heightRatio,
                //   height: 50 * theme.widthRatio * theme.heightRatio,
                // ),
                SizedBox(height: 10 * theme.heightRatio),
                Flexible(
                    child: AutoSizeText(
                      "Errors are noticed,\nEfforts are ignored",
                      style: GoogleFonts.exo(
                        color: Colors.white60,
                        fontWeight: FontWeight.w600,
                        fontSize: 21 * theme.widthRatio * theme.heightRatio,
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






class WavyContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Widget child;

  WavyContainer({
    required this.height,
    required this.width,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WavyClipper(),
      child: Container(
        height: height,
        width: width,
        color: color,
        child: child,
      ),
    );
  }
}

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height - 50,
    );
    path.quadraticBezierTo(
      3 / 4 * size.width,
      size.height - 100,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


void _launchWhatsApp() async {
  const String phoneNumber = "+918209556233"; // Replace with your phone number
  const String message = "Hello, Rahul! I found you through your portfolio and wanted to reach out.";

  final String url = "https://api.whatsapp.com/send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }}

class VideoPlayerWidget extends StatefulWidget {
  final String filePath;

  const VideoPlayerWidget({Key? key, required this.filePath}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.filePath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


}
