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
    controller = new AnimationController(duration: const Duration(seconds: 2),vsync: this);
    animation = Tween<double>(begin: 0,end:300).animate(controller)..addStatusListener((status){
      //动画循环了！
      if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
    });
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation);
  }
}
//将动画内容提取出来
class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    //如果 animation没有在 上一个层级中调用 addStatusListener, 这里将会自动调用，并且调用setState
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      )
    );
  }
}
