import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_portfolio/consts/data.dart';
import 'package:awesome_portfolio/providers/current_state.dart';
import 'package:awesome_portfolio/providers/theme_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
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
    bool phone = size.width < 800;

    // Set the expanded height differently for phone and non-phone devices
    double expandedHeight = phone ? size.height * 0.5 : size.height;
    // Initialize a CarouselController
    //final CarouselController _carouselController = CarouselController();

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
                  'assets/git/lastbg.gif',
                  fit: BoxFit.cover,)),
                    // Parallax Image and Video Swiper
                    Positioned(
                      top: parallax, // Parallax effect
                      bottom: -parallax, // Parallax effect
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
                          //'assets/git/second.png',
                          'assets/git/vlog-ig.gif',
                          'assets/git/swiper-background.png',
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


//                     // Animated Left swipe icon
//                     Positioned(
//                       left: 10,
//                       top: 0,
//                       bottom: 0,
//                       child: SizedBox(
//                         width: 50, // Specify a fixed width
//                         height: 50,
//                         child: GestureDetector(
//                           onTap: () {
//                             _carouselController.previousPage();
//                           },
//                           child: Icon(
//                             Icons.arrow_back_ios, // Left swipe icon
//                             color: Colors.red,
//                             size: 30,
//                           ),
//                         ),
//                       ),
//                     ),
// // Animated Right swipe icon
//                     Positioned(
//                       right: 10,
//                       top: 0,
//                       bottom: 0,
//                       child: SizedBox(
//                         width: 50, // Specify a fixed width
//                         height: 50,
//                         child: GestureDetector(
//                           onTap: () {
//                             _carouselController.nextPage();
//                           },
//                           child: Icon(
//                             Icons.arrow_forward_ios, // Right swipe icon
//                             color: Colors.red,
//                             size: 30,
//                           ),
//                         ),
//                       ),
//                     ),


                  ],
                );
              },
            ),
          ),

          SliverToBoxAdapter(

            child: Column(
              children: [
                Selector<CurrentState, Gradient>(
                selector: (context, provider) => provider.bgGradient,
                builder: (context, gradient, __) {
                  return Container(
                    decoration: BoxDecoration(gradient: gradient),
                    child: WavyContainer(
                      height: MediaQuery.of(context).size.height * 0.30, // 30% of screen height
                      width: MediaQuery.of(context).size.width*1,          // 100% of screen width
                      color: const Color(0xff03383e),                    // Dark teal color
                      child: Container(
                        color: const Color(0xff03383e),
                      ),
                    ),
                  );})

                ,Stack(
                  children: [
                    // SizedBox(height: 200,),


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
