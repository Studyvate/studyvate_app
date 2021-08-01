import 'package:app/QuizScreen.dart';
import 'package:flutter/material.dart';
import 'SignIn.dart';
import 'DecksScreen.dart';
import 'CreateDeckScreen.dart';

void main() {
  runApp(StudyvateApp());
}

class StudyvateApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignInPage(title: 'Flutter Demo Home Page', key: null,),
      routes: <String,WidgetBuilder>{
        //This screen contains alla the decks
        //"/DecksCreation": (Context) => DeckScreen(),
        //This screen is where you create decks
        "/CreateDeck": (context) => CreateDeckScreen(),
        //This screen is where you view content of a deck/ take a quiz
        "/ViewDecks": (context) => ViewDecksScreen(),
        "/ViewFlashcards": (context) => QuizPage(),




      },

    );
  }
}
