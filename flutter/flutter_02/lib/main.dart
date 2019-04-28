import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: '首页'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

//   This widget is the home page of your application. It is stateful, meaning
//   that it has a State object (defined below) that contains fields that affect
//   how it looks.
//
//   This class is the configuration for the state. It holds the values (in this
//   case the title) provided by the parent (in this case the App widget) and
//   used by the build method of the State. Fields in a Widget subclass are
//   always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int distance = 2;
  void _incrementCounter() {
    setState(() {
      distance +=2;
      _counter += distance;
    });
  }
  void _descCounter() {
    setState(() {
      distance -=2;
      _counter -= distance;
    });
  }
  void _resetCount(){
    setState(() {
      _counter = 0;
      distance = 0;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            myText(title: '老弟来了几次？',backgroundColor: Colors.red,fontSize: 30,),
            myText(title: '老弟来了'+'$_counter'+'次',backgroundColor: Colors.green,fontSize: 30,),
            myText(title: 'Step:'+'$distance',backgroundColor: Colors.red,fontSize: 30,),
            new Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton.icon(
                      icon: new Image.asset('source/icon_3.png',width: 20,),
                      onPressed: _incrementCounter,
                      label: new Text("push + "+"$_counter"),
                  color: Colors.white,),
                  RaisedButton.icon(
                      icon:new Image.asset('source/icon_1.png',width: 20,),
                      onPressed: _descCounter,
                      label: new  Text('push -'+'$distance'),
                      color: Colors.white
                  ),
                  RaisedButton.icon(
                    icon:new Image.asset('source/icon_2.png',width: 20,) ,
                      onPressed: _resetCount,
                      label: new  Text('reset =0'),
                      color: Colors.white,
                  ),

                ],
              ),
            ),
            setTwoIconLine(),
          ],
        ),
      ),
    );
  }
}
class setTwoIconLine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: Column(
        children: <Widget>[
          setLineIcon(),
          setLineIcon(),
        ],
      ),
    );
  }
}
class setLineIcon extends StatelessWidget{
final List showTitles;
setLineIcon({this.showTitles});

  @override
  Widget build(BuildContext context) {
    return  new Container(
      padding: const EdgeInsets.only(top: 2,bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          _View(bgColor: Colors.green,title: "小白来了",iconname: 'source/icon_1.png',),
          _View(bgColor: Colors.red,title: "小鹿来了",iconname: 'source/icon_2.png',),
          _View(bgColor: Colors.green,title: "小红来了",iconname: 'source/icon_3.png',),
          _View(bgColor: Colors.red,title: "小黑来了",iconname: 'source/icon_1.png',),
        ],
      ),
    );
  }
}
class _View extends StatelessWidget{
  final Color bgColor;
  final String title;
  final String iconname;
  _View({this.bgColor,this.title,this.iconname});
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      padding: const EdgeInsets.all(0),
        width: 80,
        height: 80,
      child: Column(
        children: <Widget>[
          imageIcon(iconname:this.iconname),
          new Container(
            padding: const EdgeInsets.only(top: 10),
            child: Text(this.title,style: TextStyle(fontSize: 12),),
          )
        ],
      ),
    );
  }
}
class imageIcon extends StatelessWidget{
  final String iconname;
  imageIcon({this.iconname});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        padding: const EdgeInsets.only(top: 10),
        child: Image.asset(this.iconname,width: 40,),

    );
  }
}

class myText extends StatelessWidget{
  final String title;
  final Color backgroundColor;
  double fontSize;

  myText({this.title,this.backgroundColor,this.fontSize});
  @override Widget build(BuildContext context){
    return new Container(
      padding: const EdgeInsets.all(20),
      color: this.backgroundColor,
      child: Text(this.title,style: TextStyle(fontSize: this.fontSize),),
    );
  }
}
Widget _buildImageRow(int imageIndex) => Row(
  children: [
    _buildDecoratedImage(imageIndex),
    _buildDecoratedImage(imageIndex + 1),
  ],
);
Widget _buildDecoratedImage(int imageIndex) => Expanded(
  child: Container(
    decoration: BoxDecoration(
      border: Border.all(width: 10, color: Colors.black38),
      borderRadius: const BorderRadius.all(const Radius.circular(8)),
    ),
    margin: const EdgeInsets.all(4),
    child: Image.asset('source/icon.png'),
  ),
);
Widget _buildImageColumn() => Container(
  decoration: BoxDecoration(
    color: Colors.black26,
  ),
  child: Column(
    children: [
      _buildImageRow(1),
      _buildImageRow(3),
    ],
  ),
);
