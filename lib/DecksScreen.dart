import 'package:app/Database/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'CustomClipper.dart';
import 'package:app/Constants.dart';


String flashDeckName;
List<String> menu = [
  'Search Deck',
  'Create Deck',
  'Upload Deck',
  'User Guide',
  'Upgrade to Premium',
  'Contact Admins'
];

var selectedMenuItem = 0;



class ViewDecksScreen extends StatefulWidget {
  @override
  _ViewDecksScreenState createState() => _ViewDecksScreenState();
}

class _ViewDecksScreenState extends State<ViewDecksScreen> {

  List<Widget> getDeckNames() {
  List<Widget> cards = [];
  List<Map<String, dynamic>> dbDeckNames =  DatabaseHelper.instance.queryGetAllDeckNames() as List<Map<String, dynamic>>;
  dbDeckNames.forEach((element) {
    element.values.forEach((element) {
      cards.add(Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(element.toString())),
          )
      ));

    });
   });
   return cards;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                                    'Your Decks',
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
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 16.0,
                  ),
                  Text('Recent'),
                  Spacer(),
                  Text(
                    'Alphabetical Order',
                    style: TextStyle(color: Color(0xff7baaff)),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: MySearchBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class MySearchBar extends StatefulWidget {
  MySearchBar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MySearchBarState createState() => new _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  TextEditingController editingController = TextEditingController();

  final List<String> duplicateItems = [];

  var items = [];

  @override
  void initState() {
    decks.forEach((key, value) {
      duplicateItems.add(key);
    });
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        String itemTemp = item.toLowerCase();
        if(itemTemp.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value.toLowerCase());
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ViewFlashcards');
                      flashDeckName = items[index];
                      print(flashDeckName);
                    },
                    child: Card(
                      color: Colors.white,

                      child: ListTile(
                        title: Text('${items[index]}'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.lightBlueAccent,
                      ),
                    ),),
                  );
                },
              ),
            ),
          ],
        ),

    );
  }
}
