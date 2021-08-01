import 'package:flutter/material.dart';
import 'CustomClipper.dart';
import 'package:app/DecksScreen.dart';
import 'package:app/Constants.dart';

var mode = "view";
List<String> qnAAnswers = [] ;


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> getAnswers(){
    print('name of deck' + flashDeckName);
    print('wustion' + decks[flashDeckName]);
    qnAAnswers.clear();
    for(var i = 0; i< decksQnA[decks[flashDeckName]].length; i++){
      print("answer" + i.toString() + ": "+decksQnA[decks[flashDeckName]].elementAt(i));
      if (decksQnA[decks[flashDeckName]].elementAt(i) != "" ||  decksQnA[decks[flashDeckName]].elementAt(i) != null){
        qnAAnswers.add(decksQnA[decks[flashDeckName]].elementAt(i));
      }
    }
    return qnAAnswers;
  }

  void initState(){

    super.initState();
  }

  void dispose()
  {
    super.dispose();
  }




  void changeMode(String modeChange){
    mode = modeChange;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              ClipPath(
                  clipper: Clipper(),
                  child: Container(
                    height: 150.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xff9df9ef),
                        Color(0xff7baaff),
                      ]),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10.0,
                              ),
                              PopupMenuButton(
                                onSelected: (index) {
                                  setState(() {
                                    selectedMenuItem = index;
                                    if (index == 1) {
                                      Navigator.pushNamed(
                                          context, '/CreateDeck');
                                    }
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.menu,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 25.0,
                                    ),
                                    Text(
                                      flashDeckName,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                itemBuilder: (buildContext) =>
                                <PopupMenuItem<int>>[
                                  PopupMenuItem(
                                    child: Text(menu[1]),
                                    value: 1,
                                  ),
                                  PopupMenuItem(
                                    child: Text(menu[2]),
                                    value: 2,
                                  ),
                                  PopupMenuItem(
                                    child: Text(menu[3]),
                                    value: 3,
                                  ),
                                  PopupMenuItem(
                                    child: Text(menu[4]),
                                    value: 4,
                                  ),
                                  PopupMenuItem(
                                    child: Text(menu[5]),
                                    value: 5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 16.0,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          changeMode("quiz");
                        });
                      },
                        child: Text('View Mode')),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          changeMode("view");
                        });
                      },
                      child: Text(
                        'Quiz Mode',
                        style: TextStyle(color: Color(0xff7baaff)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: Color(0xff7baaff),
                  borderRadius: BorderRadius.circular(25),
                ),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                            decks[flashDeckName],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                          SizedBox(
                            height: 30,
                          ),

                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: getAnswers().length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        side: BorderSide(color: Colors.white)
                                    ) ,
                                    primary: Colors.white,
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                    child: Text(
                                      '${qnAAnswers[index]}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      ),

                                    ),
                                    onPressed: () {


                                    },
                                  ),
                                );
                              }
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
          ),
        ),
    );
  }}