import 'package:app/Database/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'DecksScreen.dart';
import 'package:app/Constants.dart';
import 'package:app/Model/Questions.dart';

_CreateDeckScreen parent;
List<Widget> cardSample = [];
String deckName = "";
List<String> questionList = [];
List<String> answerList1 = [];
List<String> answerList2 = [];
List<String> answerList3 = [];
List<String> answerList4 = [];



class CreateDeckScreen extends StatefulWidget {
  @override
  _CreateDeckScreen createState() {
    parent = _CreateDeckScreen();
    return parent;
  }
}
class _CreateDeckScreen extends State<CreateDeckScreen> {
  TextEditingController deckNamesController = TextEditingController();

//ADD to card logic
void addToCards() {

  cardSample.add(CreateCard(
    key: UniqueKey(),
  ));
}
  void clearAll(){
    cardSample.clear();
    questionList.clear();
    answerList1.clear();
    answerList2.clear();
    answerList3.clear();
    answerList4.clear(); }

    void addToDB() {
      List<Map<String, dynamic>> dbRows;
      dbRows = addToQuestionBank();
      dbRows.forEach((element) async{
        int i = await DatabaseHelper.instance.insertQuestion(element);
        print("the id of the added question is"+i.toString());
      });

    }
// void addToQuestionBank(){
//   deckStartingIndex = decks.length;
//
//   print('index ' + deckStartingIndex.toString());
//   print("add to bank beginning: " + deckName);
//   if (deckName == "") {
//     deckName = "Deck" + (decks.length + 1).toString();
//   }
//   if (questionList.length == 0) {
//     print("add to bank question list is zero beginning: " + deckName);
//   }
//   else if (questionList.length > 0) {
//
//     print("add to bank for beginning: " + deckName);
//     List<String> questionAnswers = [];
//     print(questionList.length.toString());
//     int questionListCount = questionList.length;
//     for (int i = 0; i <  questionListCount; i++) {
//       if (answerList1.length > 0) {
//         questionAnswers.add(answerList1.elementAt(i));
//         print("add to bank answer1: " + answerList1.elementAt(i));
//       }
//
//       if (answerList2.length > 0) {
//         questionAnswers.add(answerList2.elementAt(i));
//         print("add to bank answer 2: " + answerList2.elementAt(i));
//       }
//       if (answerList3.length > 0) {
//         questionAnswers.add(answerList3.elementAt(i));
//         print("add to bank answer 3: " + answerList3.elementAt(i));
//       }
//       if (answerList4.length > 0) {
//         questionAnswers.add(answerList4.elementAt(i));
//         print("add to bank for beginning: " + answerList4.elementAt(i));
//       }
//       print("done");
//       qnA.clear();
//       qnA.addAll({questionList.elementAt(i): questionAnswers});
//       decksQnA.addAll(qnA);
//       print("add to bank QnA : " + qnA.keys.elementAt(0));
//       print("add to bank QnA : " + qnA[qnA.keys.elementAt(0)].elementAt(0).toString());
//       print("QnA Length : " + qnA.length.toString());
//       decks.addAll({deckName: qnA.keys.elementAt(i)});
//       print("add to bank decks Key: " + decks.keys.elementAt(i));
//       String question = decks[decks.keys.elementAt(deckStartingIndex + i)];
//       print("add to bank decks value: " + question);
//       print("add to bank decksQNA: " + decksQnA[question].elementAt(0));
//
//
//       i++;
//       print("i=" + i.toString() + "and question length = " +
//           questionList.length.toString());
//     }
//
//     print("add to bank end: " + deckName);
//     cardSample.clear();
//     deckName = "";
//
//   }
//
//
// }
Widget _deleteDeckPopupDialog(BuildContext context,String message) {
    return AlertDialog(
      title: const Text("Confirm"),
      content: Text(message),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("DELETE")
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text("CANCEL"),
        ),
      ],
    );
  }
  @override void initState() {
    super.initState();
  }
 @override void dispose(){
   super.dispose();
 }
//I don't know what this is doing
@override
/*void initState() {
  deckName = "";
  if (CardSample.length == 0) {
    questionList.clear();
    // TODO: implement initState
    super.initState();
    CardSample.add(Deck(
      key: UniqueKey(),
    ));
  }
}*/
@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: PopupMenuButton(
          onSelected: (index) {
            setState(() {
              selectedMenuItem =  index;
              if(index == 0) {
                Navigator.pushNamed(context, '/DecksCreation');
              }
            });
          },
          child: Icon(Icons.menu, color: Colors.black,),
          itemBuilder: (buildContext) => <PopupMenuItem<int>>[
            PopupMenuItem(
              child: Text(menu[0]),
              value: 0,
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

        actions: [
          //logic for deckName
          Container(
            height: 100,
            width: 200,
            child: new TextField(
              controller: deckNamesController,
              maxLines: 1,
              decoration: new InputDecoration(
                labelText: 'Type Deck Name',
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(1.0),
                  borderSide: new BorderSide(),
                ),
//fillColor: Colors.green
              ),
              keyboardType: TextInputType.multiline,
              onChanged: (text) {
                deckName = text;
              },
              style: new TextStyle(),
            ),
          ),
          //logic for clicking save deck
          IconButton(
            icon: Icon(Icons.save),
            tooltip: 'Save Cards',
            onPressed: () {
              setState(() {
                addToDB();
              });
              print('testing - question list length is:' + questionList.length.toString());
              if(questionList.length > 0)
              {
                Navigator.pushNamed(context, '/ViewDecks');
              }
              if(questionList.length == 0){

                showDialog(
                  context: context,
                  builder: (BuildContext context) => _deleteDeckPopupDialog(context,"You cannot save an empty deck. Do you wish to delete this item?"),
                );
              }
              setState(() {
                clearAll();
              });
            },
          ),
          //logic for clicking add deck
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Add Card',
            onPressed: () {
              setState(() {
                addToCards();
              });
            },
          ),
          //logic for clicking remove deck
          IconButton(
            icon: Icon(Icons.remove),
            tooltip: 'Delete All Cards',
            onPressed: () {
              setState(() {

              });
              if(questionList.length > 0){

                showDialog(
                  context: context,
                  builder: (BuildContext context) => _deleteDeckPopupDialog(context,"Are you sure you wish to delete this item?"),
                );
              }
              if(questionList.length == 0) {
                clearAll();
              }

            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(children: cardSample),
      ),
    ),
  );
}
}


class CreateCard extends StatefulWidget {
  Key key;
  CreateCard({key}) : super(key: key);

  _CreateCard createState() => _CreateCard();
}
class _CreateCard extends State<CreateCard> {

  TextEditingController questionController = TextEditingController();
  TextEditingController answerController1 = TextEditingController();
  TextEditingController answerController2 = TextEditingController();
  TextEditingController answerController3 = TextEditingController();
  TextEditingController answerController4 = TextEditingController();
  @override void initState() {
    super.initState();
    questionController.addListener(() {

    });
  }

  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    int num = cardSample.indexOf(this.widget);
    String question = "";

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return deepBlueColor;
    }


    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 250,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 220,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: Color(0xff7baaff),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Text('Question',
                                style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              icon: Icon(Icons.photo_camera),
                              tooltip: 'upload a picture',
                              onPressed: () {
                                setState(() {
                                  print(num.toString());
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              tooltip: 'remove Cards',
                              onPressed: () {
                                print('question is: '+ question);


                                if(question != ""){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => parent._deleteDeckPopupDialog(context,"You cannot save an empty deck. Do you wish to delete this item?"),
                                  );
                                }
                                if (question == ""){
                                  print(num.toString());
                                  cardSample.remove(this.widget);
                                  parent.setState(() {});
                                }
                                setState(() {

                                });


                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new TextFormField(
                          controller: questionController,
                          maxLines: 5,
                          decoration: new InputDecoration(
                            labelText: 'Type here',
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(1.0),
                              borderSide: new BorderSide(),
                            ),
//fillColor: Colors.green
                          ),

                          keyboardType: TextInputType.multiline,
                          onTap: (){
                            print("tapped");
                            questionList.insert(num, "");
                          },
                          onChanged: (text) {
                            setState(() {
                              print("question begin:" + question);
                              questionList.removeAt(num);
                              question = text;
                              questionList.insert(num, question);
                              print("question mid:" + question);

                            });
                          },
                          validator: (val) {
                            if (val.length == 0) {
                              return "Question cannot be empty";
                            } else {
                              return null;
                            }

                          },

                          style: new TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 220,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: Color(0xff9df9ef),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value;
                                });
                                print(isChecked.toString());
                              },
                            ),
                            Text(
                              "Answer 1",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              icon: Icon(Icons.photo_camera),
                              tooltip: 'upload a picture',
                              onPressed: () {
                                setState(() {
                                  print(num.toString());
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new TextFormField(
                          maxLines: 5,
                          decoration: new InputDecoration(
                            labelText: 'Type here',
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(1.0),
                              borderSide: new BorderSide(),
                            ),
//fillColor: Colors.green
                          ),
                          keyboardType: TextInputType.multiline,
                          onTap: (){
                            print("tapped");
                            answerList1.insert(num, "");
                          },
                          onChanged: (text) {
                            setState(() {
                              print("changed");
                              answerList1.removeAt(num);
                              question = text;
                              answerList1.insert(num, question);

                            });
                          },
                          style: new TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 220,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: Color(0xff9df9ef),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value;
                              });
                            },
                          ),
                          Text(
                            "Answer 2",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            icon: Icon(Icons.photo_camera),
                            tooltip: 'upload a picture',
                            onPressed: () {
                              setState(() {
                                print(num.toString());
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      new TextFormField(
                        maxLines: 5,
                        decoration: new InputDecoration(
                          labelText: 'Type here',
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(1.0),
                            borderSide: new BorderSide(),
                          ),
//fillColor: Colors.green
                        ),
                        keyboardType: TextInputType.multiline,
                        onTap: (){
                          print("tapped");
                          answerList2.insert(num, "");
                        },
                        onChanged: (text) {
                          setState(() {
                            print("changed");
                            answerList2.removeAt(num);
                            question = text;
                            answerList2.insert(num, question);

                          });
                        },
                        style: new TextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 220,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: Color(0xff9df9ef),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value;
                              });
                            },
                          ),
                          Text(
                            "Answer 3",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            icon: Icon(Icons.photo_camera),
                            tooltip: 'upload a picture',
                            onPressed: () {
                              setState(() {
                                print(num.toString());
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      new TextFormField(
                        maxLines: 5,
                        decoration: new InputDecoration(
                          labelText: 'Type here',
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(1.0),
                            borderSide: new BorderSide(),
                          ),
//fillColor: Colors.green
                        ),
                        keyboardType: TextInputType.multiline,
                        onTap: (){
                          print("tapped");
                          answerList3.insert(num, "");
                        },
                        onChanged: (text) {
                          setState(() {
                            print("changed");
                            answerList3.removeAt(num);
                            question = text;
                            answerList3.insert(num, question);

                          });
                        },
                        style: new TextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 220,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: Color(0xff9df9ef),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value;
                              });
                            },
                          ),
                          Text(
                            "Answer 4",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            icon: Icon(Icons.photo_camera),
                            tooltip: 'upload a picture',
                            onPressed: () {
                              setState(() {
                                print(num.toString());
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      new TextFormField(
                        maxLines: 5,
                        decoration: new InputDecoration(
                          labelText: 'Type here',
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(1.0),
                            borderSide: new BorderSide(),
                          ),
//fillColor: Colors.green
                        ),
                        keyboardType: TextInputType.multiline,
                        onTap: (){
                          print("tapped");
                          answerList4.insert(num, "");
                        },
                        onChanged: (text) {
                          setState(() {
                            print("changed");
                            answerList4.removeAt(num);
                            question = text;
                            answerList4.insert(num, question);

                          });
                        },
                        style: new TextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**Dismissible(
background: Container(
color: Colors.red,
alignment: Alignment.centerLeft,
child: Text("Swipe all the way to delete.", style: TextStyle(fontWeight: FontWeight.bold))),
key: Key(legendKey),
confirmDismiss: (DismissDirection direction) async {
return await showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: const Text("Confirm"),
content: const Text("Are you sure you wish to delete this item?"),
actions: <Widget>[
FlatButton(
onPressed: () => Navigator.of(context).pop(true),
child: const Text("DELETE")
),
FlatButton(
onPressed: () => Navigator.of(context).pop(false),
child: const Text("CANCEL"),
),
],
);
*/