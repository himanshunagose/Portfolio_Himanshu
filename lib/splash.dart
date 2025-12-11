import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio_site/app.dart';

import 'core/constants/app_colors.dart';
import 'core/theme/app_theme.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PortfolioApp(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.darkSurface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImageContainer(width: 100,height: 100,),
            SizedBox(height: 20.0,),
            AnimatedLoadingText(),
          ],
        ),
      ),
    );
  }
}


class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer({Key? key, this.height = 300, this.width = 250})
      : super(key: key);
  final double? width;
  final double? height;
  @override
  AnimatedImageContainerState createState() => AnimatedImageContainerState();
}
class AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        return Transform.translate(
          offset: Offset(0, 2 * value), // Move the container up and down
          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(defaultPadding / 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [
                Colors.pinkAccent,
                Colors.blue,
              ]),
              boxShadow: const [
                BoxShadow(
                  color: Colors.pink,
                  offset: Offset(-2, 0),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(2, 0),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(
                'assets/images/image.png',
                height: Responsive.isLargeMobile(context)
                    ? MediaQuery.sizeOf(context).width * 0.2
                    : Responsive.isTablet(context)
                    ? MediaQuery.sizeOf(context).width * 0.14
                    : 200,
                width: Responsive.isLargeMobile(context)
                    ? MediaQuery.sizeOf(context).width * 0.2
                    : Responsive.isTablet(context)
                    ? MediaQuery.sizeOf(context).width * 0.14
                    : 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}



class AnimatedLoadingText extends StatelessWidget {
  const AnimatedLoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: defaultPadding * 5,
      child: TweenAnimationBuilder(duration: const Duration(seconds: 2),builder: (context, value, child) => Column(
        children: [
          LinearProgressIndicator(
            backgroundColor: Colors.black,
            color: Colors.deepPurpleAccent,
            value: value,
          ),
          const SizedBox(height: defaultPadding/2,),
          Text(
            '${(value * 100).toInt()}%',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,shadows: [
            Shadow(color: Colors.pink,blurRadius: 10 , offset: Offset(2,2)),
            Shadow(color: Colors.blue,blurRadius: 10 , offset: Offset(-2,-2)),
          ]),)
        ],
      ), tween: Tween(begin: 0.0,end: 1.0),),
    );
  }
}

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isLargeMobile(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
          MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
          MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}