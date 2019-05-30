//父控件，管理子控件的状态
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}
//入口的文件需要是 如下的这种title home 的 materialApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: ParentWidget(),
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget{
  @override
  _ParentWidget createState() {
    return _ParentWidget();
  }
}
class _ParentWidget extends State<ParentWidget>{
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        active: _active,// 当前管理的state
        onChanged: _handleTapboxChanged,//自己的方法
      ),
    );
  }
}


class TapboxB extends StatelessWidget{
  TapboxB({Key key,this.active:false,@required this.onChanged}):super(key:key);
  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    //手势处理 GestureDetector
    return GestureDetector(
      onTap: _handleTap,
      child:Container(
        child: Text(
          (active ? 'Active' : 'Inactive'),
          style: TextStyle(fontSize: 32.0, color: Colors.white),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}