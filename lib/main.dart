import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(LogoApp());

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    // AnimationController 动画持续时间，以及防止超出屏幕依然进行动画渲染 (vsync)
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    // #docregion addListener
    // Tween 返回的是Animatable对象，.animate方法之后，返回的是animation 对象 Tween，控制变化值， animation.value 从0-300的变化
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      // 每次发生改变，都会主动触发addListener方法中注册的function函数。
      ..addListener(() {
        // #enddocregion addListener
        setState(() { // 直接调用setState方法，进行刷新页面
          // The state that has changed here is the animation object’s value.
        });
        // #docregion addListener
      });
    // #enddocregion addListener
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value, // animation.value就是上面动画计算出来的值的大小
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}