import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz/personal_expenses/AddBloc/data_bloc.dart';
import 'package:quiz/personal_expenses/model/expense_model.dart';
import 'package:quiz/personal_expenses/model/fav_model.dart';
import 'package:quiz/personal_expenses/repositary/database.dart';
import 'package:quiz/personal_expenses/repositary/fav_database.dart';
import 'package:quiz/personal_expenses/screens/note_app/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter<ExpenseModel>(ExpenseModelAdapter());
  Hive.registerAdapter<FavModel>(FavModelAdapter());
  await Hive.openBox<ExpenseModel>("Note");
  await Hive.openBox<FavModel>("FavNote");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final NoteDataBase noteDataBase = NoteDataBase();
  final FavDatabase favDatabase = FavDatabase();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DataBloc(
            noteDataBase: noteDataBase,
            favDatabase: favDatabase,
          ),
        ),
      ],
      child: HomeScreen(),
    );
  }
}

        // backgroundColor: Color(0xFF181818),
        