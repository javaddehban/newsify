import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/config/resource/assets.dart';
import 'package:news/config/router/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  double _width = 10;
  double _height = 10;

  @override
  void initState() {
    _updateUi();
    _goToHome();
    super.initState();
  }

  void _goToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      context.go(Routes.home);
    });
  }

  void _updateUi() {
    Future.delayed(const Duration(microseconds: 1), () {
      setState(() {
        _width = 200;
        _height = 200;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
                duration: const Duration(seconds: 2),
                width: _width,
                height: _height,
                child: Image.asset(
                  Assets.logo,
                  width: _width,
                  height: _height,
                ))
          ],
        ),
      ),
    );
  }
}
