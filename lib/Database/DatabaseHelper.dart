import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {

  static final _dbName = 'studyvateFlashcardDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'studyvateFlashcardTable';

  static final columnId = 'id';
  static final columnDeckName = 'deckName';
  static final columnQuestion = 'question';
  static final columnAnswer1 = 'answer1';
  static final columnAnswer2 = 'answer2';
  static final columnAnswer3 = 'answer3';
  static final columnAnswer4 = 'answer4';
  static final columnCorrectAnswer = 'correctAnswer';


  //making it a singleton class
  DatabaseHelper.privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper.privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initiateDatabase();
    return _database;
  }

  Future<Database> initiateDatabase() async {
    final databasePath = await getDatabasesPath();

    //Directory directory = await getApplicationDocumentsDirectory();
    final path = join(databasePath, _dbName);
    return await openDatabase(path, version: _dbVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''
      CREATE TABLE $_tableName(
      $columnId INTEGER PRIMARY KEY, 
      $columnDeckName TEXT NOT NULL,
      $columnQuestion TEXT,
      $columnAnswer1 TEXT,
      $columnAnswer2 TEXT,
      $columnAnswer3 TEXT,
      $columnAnswer4 TEXT,
      $columnCorrectAnswer TEXT
      )
      '''
    );
  }

  //Insert
  Future<int> insertQuestion(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  //Query
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

//update
  Future<int> updateQuestion(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(
        _tableName, row, where: '$columnId = ?', whereArgs: [id]);
  }

  //delete
  Future<int> deleteQuestion(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }


//get list of Decks

  Future<List<Map<String, dynamic>>> queryGetAllDeckNames() async {
    Database db = await instance.database;
    return await db.rawQuery(
        '''
      SELECT DISTINCT $columnDeckName
      FROM $_dbName;
      '''
    );
  }


//get the list of questions and answers

  Future<List<Map<String, dynamic>>> queryGetQuestionsAndAnswers(String deckName) async {
    Database db = await instance.database;
    return await db.query(_dbName,
        columns:[columnQuestion,columnAnswer1,columnAnswer2,columnAnswer3,columnAnswer4,columnCorrectAnswer],
        where: '$columnDeckName = ?',
        whereArgs: [deckName]
    );
  }

  //get db row id
  Future<List<Map<String, dynamic>>> queryGetQuestionId(String deckName,String question) async {
    Database db = await instance.database;
    return await db.query(_dbName,
        columns:[columnId],
        where: '$columnDeckName = ? $columnQuestion = ?',
        whereArgs: [deckName,question]
    );
  }

  //delete deck
  Future<int> deleteDeck(String deckName) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnDeckName = ?', whereArgs: [deckName]);
  }


}


