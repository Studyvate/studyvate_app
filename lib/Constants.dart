import 'package:flutter/material.dart';

const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const lightBlueColor = Color(0xff9df9ef);
const deepBlueColor = Color(0xff7baaff);


const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kDefaultPadding = 20.0;
Map<String,List<String>> qnA = {};
Map<String,List<String>> decksQnA = {};
Map<String,String> decks = {};
Map<String,List<String>> correctAnswers = {};

int deckStartingIndex = 0;

