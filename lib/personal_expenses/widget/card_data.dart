import 'package:flutter/material.dart';
import 'package:quiz/personal_expenses/AddBloc/data_bloc.dart';

class Data extends StatefulWidget {
  final String heading;
  final String number;
  final int index;
  final DataBloc dataBloc;
  const Data({
    required this.heading,
    required this.number,
    required this.index,
    required this.dataBloc,
  });

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  var isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: Colors.green,
          child: Center(
            child: Text(
              widget.heading[0],
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: Text(
          widget.heading,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          widget.number.toString(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Wrap(
          spacing: -5,
          children: [
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 26,
              ),
              onPressed: () {
                widget.dataBloc.add(
                  DeleteItem(index: widget.index),
                );
              },
            ),
            // IconButton(
            //   onPressed: () {
            //     widget.dataBloc.add(
            //       AddFavorite(
            //         title: widget.heading,
            //         content: widget.number,
            //       ),
            //     );
            //     isFavorite = !isFavorite;
            //   },
            //   icon: isFavorite == false
            //       ? Icon(
            //           Icons.favorite,
            //           size: 26,
            //         )
            //       : Icon(
            //           Icons.favorite,
            //           size: 26,
            //           color: Colors.red,
            //         ),
            // )
          ],
        ),
      ),
    );
  }
}
