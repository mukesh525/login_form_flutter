import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  String welomeString = "";
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();

  String _value = 'Hello World';

  void _clear() {
    setState(() {
      _userController.clear();
      _passController.clear();
      welomeString = "";
    });
  }

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty && _passController.text.isNotEmpty) {
        welomeString = _userController.text;
      } else {
        welomeString = "";
      }
    });
  }

  void _onPressed() {
    setState(() {
      _value = new DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.lightGreen,
            ),
            new Padding(padding: new EdgeInsets.all(5.0)),
            new Image.network('http://www.google.de/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',width: 300.0,),

            //conatiner
            new Padding(padding: new EdgeInsets.all(15.0)),
            new Container(
              height: 180.0,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                  bottomLeft: const Radius.circular(20.0),
                  bottomRight: const Radius.circular(20.0),
                ),
                color: Colors.white,
                shape: BoxShape.rectangle,
                gradient: new LinearGradient(
                    colors: [Colors.red, Colors.cyan],
                    begin: Alignment.centerRight,
                    end: new Alignment(-1.0, -1.0),
                    tileMode: TileMode.clamp),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      offset: Offset(1.0, 1.0),
                      spreadRadius: 1.0),
                ],
                border: Border.all(color: Colors.black),
              ),
              width: 380.0,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                        hintText: "Username", icon: new Icon(Icons.person)),
                  ),
                  new TextField(
                    controller: _passController,
                    decoration: new InputDecoration(
                        hintText: "Password", icon: new Icon(Icons.lock)),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Center(
                      child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new RaisedButton(
                          onPressed: _showWelcome,
                          child: new Text('Login',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 16.9)),
                          color: Colors.redAccent),
                      new RaisedButton(
                          onPressed: _clear,
                          child: new Text('Clear',
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 16.9)),
                          color: Colors.green)
                    ],
                  ))
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(25.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Welcome ${welomeString}",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
