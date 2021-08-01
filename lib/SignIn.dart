import 'package:flutter/material.dart';
import 'package:app/CustomClipper.dart';
import 'package:flutter/widgets.dart';



class SignInPage extends StatefulWidget {
  SignInPage({Key key,  this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xff7baaff),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xff97F3FA),
                Color(0xff49E2EE),
                Color(0xff00B7D5),
                Color(0xff017DAB),
                Color(0xff005A87),

              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Stack(
                  children: [
                    ClipPath(
                      clipper: Clipper(),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('StudyVate',
                                  style: TextStyle(
                                    color: Color(0xffe4c580),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),


                            ],
                          ),
                          height: 150.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff8E92D1),
                                Color(0xffBBA3D7 ),
                                Color(0xffDBAFCB),
                                Color(0xffDC9A9B),
                                Color(0xff4367AF),
                              ]),
            ),

                        )

                    ),
          ],
    ),
                SizedBox(
                  height: 145,
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white,


                          ]),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xff0d1983), fontSize: 15),
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter valid email id as abc@gmail.com'),


                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.white,


                          ]),
                    ),
                    child: TextField(

                      obscureText: true,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xff0d1983), fontSize: 15),
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter secure password'),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: Color(0xff0d1983), fontSize: 15),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,


                        ]),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ViewDecks');
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Color(0xff0d1983), fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 140,
                ),
                Text(
                  'New User? Create Account',
                  style: TextStyle(color: Color(0xff0d1983), fontSize: 15),

                ),

              ],
          ),
        ),
      ),
    );
  }
}
