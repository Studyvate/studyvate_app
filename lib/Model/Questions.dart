import 'package:app/CreateDeckScreen.dart';
import 'package:app/Constants.dart';
import 'package:app/Database/DatabaseHelper.dart';


List<Map<String, dynamic>> addToQuestionBank(){
  Map<String, dynamic> row;
  List<Map<String, dynamic>> rows = [];
  deckStartingIndex = decks.length;

  print('index ' + deckStartingIndex.toString());
  print("add to bank beginning: " + deckName);
  if (deckName == "") {
    deckName = "Deck" + (decks.length + 1).toString();
  }
  if (questionList.length == 0) {
    row = {
      DatabaseHelper.columnDeckName: deckName,
    };
    rows.add(row);
    print("add to bank question list is zero beginning: " + deckName);
  }
  else if (questionList.length > 0) {

    print("add to bank for beginning: " + deckName);
    List<String> questionAnswers = [];
    print(questionList.length.toString());
    int questionListCount = questionList.length;
    for (int i = 0; i <  questionListCount; i++) {
      if (answerList1.length > 0) {
        questionAnswers.add(answerList1.elementAt(i));
        print("add to bank answer1: " + answerList1.elementAt(i));
      }

      if (answerList2.length > 0) {
        questionAnswers.add(answerList2.elementAt(i));
        print("add to bank answer 2: " + answerList2.elementAt(i));
      }
      if (answerList3.length > 0) {
        questionAnswers.add(answerList3.elementAt(i));
        print("add to bank answer 3: " + answerList3.elementAt(i));
      }
      if (answerList4.length > 0) {
        questionAnswers.add(answerList4.elementAt(i));
        print("add to bank for beginning: " + answerList4.elementAt(i));
      }
      row = {DatabaseHelper.columnDeckName: deckName,
        DatabaseHelper.columnQuestion: questionList[i],
        DatabaseHelper.columnAnswer1: questionAnswers[0],
        DatabaseHelper.columnAnswer2: questionAnswers[1],
        DatabaseHelper.columnAnswer3: questionAnswers[2],
        DatabaseHelper.columnAnswer4: questionAnswers[3],
        DatabaseHelper.columnCorrectAnswer: [1],
      };
      rows.add(row);
      return rows;
        // print("done");
      // qnA.clear();
      // qnA.addAll({questionList.elementAt(i): questionAnswers});
      // decksQnA.addAll(qnA);
      // print("add to bank QnA : " + qnA.keys.elementAt(0));
      // print("add to bank QnA : " + qnA[qnA.keys.elementAt(0)].elementAt(0).toString());
      // print("QnA Length : " + qnA.length.toString());
      // decks.addAll({deckName: qnA.keys.elementAt(i)});
      // print("add to bank decks Key: " + decks.keys.elementAt(i));
      // String question = decks[decks.keys.elementAt(deckStartingIndex + i)];
      // print("add to bank decks value: " + question);
      // print("add to bank decksQNA: " + decksQnA[question].elementAt(0));
      //
      //
      // i++;
      // print("i=" + i.toString() + "and question length = " +
      //     questionList.length.toString());
    }

    // print("add to bank end: " + deckName);
    // cardSample.clear();
    // deckName = "";

  }


}
