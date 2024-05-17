import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color mainColor = const Color.fromRGBO(30, 30, 30, 1);
  Color secondColor = const Color.fromRGBO(45, 177, 185, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: GridView(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 256),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: [
            Align(
              child: ShadowButton(
                size: 75,
                buttonColor: mainColor,
                contentColor: secondColor,
                icon: SvgPicture.asset(
                  "assets/icons/menu.svg",
                  width: 24,
                ),
                innerShadow: false,
              ),
            ),
            Align(
              child: ShadowButton(
                size: 75,
                buttonColor: mainColor,
                contentColor: secondColor,
                text: "-",
                innerShadow: false,
                radiusRatio: 0.20,
              ),
            ),
            Align(
              child: ShadowButton(
                size: 75,
                buttonColor: mainColor,
                contentColor: secondColor,
                icon: SvgPicture.asset(
                  "assets/icons/heart.svg",
                  width: 24,
                ),
                innerShadow: false,
                radiusRatio: 1,
              ),
            ),
            Align(
              child: ShadowButton(
                size: 75,
                buttonColor: mainColor,
                contentColor: secondColor,
                text: "Text",
                contentSize: 20,
                innerShadow: true,
              ),
            ),
            Align(
              child: ShadowButton(
                size: 75,
                buttonColor: mainColor,
                contentColor: secondColor,
                text: "+",
                innerShadow: true,
                radiusRatio: 0.20,
              ),
            ),
            Align(
              child: ShadowButton(
                size: 75,
                buttonColor: mainColor,
                contentColor: secondColor,
                icon: SvgPicture.asset(
                  "assets/icons/heart_filled.svg",
                  width: 24,
                ),
                innerShadow: true,
                radiusRatio: 1,
              ),
            ),
            Align(
              child: ShadowButton(
                size: 75,
                buttonColor: mainColor,
                contentColor: secondColor,
                icon: SvgPicture.asset(
                  "assets/icons/fire-outline.svg",
                  width: 24,
                ),
                innerShadow: true,
                doubleLayer: true,
                radiusRatio: 0.0,
              ),
            ),
            Align(
              child: ShadowButton(
                size: 75,
                buttonColor: mainColor,
                contentColor: secondColor,
                icon: SvgPicture.asset(
                  "assets/icons/fire-solid.svg",
                  width: 24,
                ),
                innerShadow: true,
                doubleLayer: true,
                radiusRatio: 0.20,
              ),
            ),
            Align(
              child: ShadowButton(
                size: 75,
                contentSize: 18,
                buttonColor: mainColor,
                contentColor: secondColor,
                icon: SvgPicture.asset(
                  "assets/icons/bell.svg",
                  width: 24,
                ),
                innerShadow: true,
                doubleLayer: true,
                radiusRatio: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShadowButton extends StatelessWidget {
  const ShadowButton({
    super.key,
    this.buttonFunction,
    this.text,
    this.icon,
    this.radiusRatio = 0,
    this.size = 50,
    this.contentSize,
    this.doubleLayer = false,
    this.innerShadow = false,
    this.buttonColor = Colors.black,
    this.contentColor = Colors.white,
  });

  final Function()? buttonFunction;
  final String? text;
  final Widget? icon;
  final double radiusRatio;
  final double size;
  final double? contentSize;
  final bool doubleLayer;
  final Color buttonColor;
  final Color contentColor;
  final bool innerShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (buttonFunction == null) ? () {} : buttonFunction,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(size * radiusRatio),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(142, 131, 131, 0.25),
              blurStyle: innerShadow ? BlurStyle.inner : BlurStyle.solid,
              blurRadius: 5,
              offset: innerShadow ? const Offset(2, 2) : const Offset(-2, -2),
            ),
            BoxShadow(
              color: Colors.black,
              blurStyle: innerShadow ? BlurStyle.inner : BlurStyle.solid,
              blurRadius: 5,
              offset: innerShadow ? const Offset(-2, -2) : const Offset(2, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            if (doubleLayer)
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: size * 0.80,
                  height: size * 0.80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(size * radiusRatio),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0, 0),
                        blurStyle: BlurStyle.solid,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
            Align(
              alignment: Alignment.center,
              child: (text != null)
                  ? Text(
                      text!,
                      style: TextStyle(
                        color: contentColor,
                        fontSize: contentSize ?? size * 0.5,
                      ),
                    )
                  : (icon != null)
                      ? SizedBox(
                          width: contentSize ?? size * 0.5,
                          child: icon!,
                        )
                      : const Text(""),
            ),
          ],
        ),
      ),
    );
  }
}
