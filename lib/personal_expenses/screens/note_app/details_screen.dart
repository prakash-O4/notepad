import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/personal_expenses/AddBloc/data_bloc.dart';
import 'package:quiz/personal_expenses/constants.dart';
import 'package:quiz/personal_expenses/model/note_model.dart';
import 'package:quiz/personal_expenses/screens/note_app/update_screen.dart';
import 'package:quiz/personal_expenses/widget/icon_card.dart';

class DetaiScreen extends StatefulWidget {
  final NoteModel noteModel;
  final int index;
  const DetaiScreen({required this.noteModel, required this.index});

  @override
  _DetaiScreenState createState() => _DetaiScreenState();
}

class _DetaiScreenState extends State<DetaiScreen> {
  // ignore: unused_field
  late DataBloc _dataBloc;
  @override
  void initState() {
    super.initState();
    _dataBloc = BlocProvider.of<DataBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final DataBloc _updateDataBloc = BlocProvider.of<DataBloc>(context);
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const IconCard(
                            icon: Icons.arrow_back_ios_new_rounded)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: _updateDataBloc,
                              child: UpdateScreen(
                                index: widget.index,
                                noteModel: widget.noteModel,
                              ),
                            ),
                          ),
                        );
                      },
                      child: const IconCard(icon: Icons.edit),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.noteModel.title,
                  style: const TextStyle(
                    height: 1.6,
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  widget.noteModel.date,
                  style: TextStyle(
                    color: Color(dateColor),
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  widget.noteModel.content,
                  style: const TextStyle(
                    height: 1.6,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// '''In no impression assistance contrasted. Manners she wishing justice hastily new anxious. At discovery discourse departure objection we. Few extensive add delighted tolerably sincerity her. Law ought him least enjoy decay one quick court. Expect warmly its tended garden him esteem had remove off. Effects dearest staying now sixteen nor improve. 
        
//         Extremely we promotion remainder eagerness enjoyment an. Ham her demands removal brought minuter raising invited gay. Contented consisted continual curiosity contained get sex. Forth child dried in in aware do. You had met they song how feel lain evil near. Small she avoid six yet table china. And bed make say been then dine mrs. To household rapturous fulfilled attempted on so.'''
