import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/personal_expenses/AddBloc/data_bloc.dart';

class Favorite extends StatefulWidget {
  const Favorite();

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite page"),
      ),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is AddFavorites) {
            var data = state.favModel;
            return Container(
              padding: EdgeInsets.only(left: 8, top: 25, right: 8, bottom: 30),
              color: Colors.grey,
              height: MediaQuery.of(context).size.height,
              child: data.length != 0
                  ? ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.grey,
                          elevation: 6,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.green,
                              child: Center(
                                child: Text(
                                  data[index].title[0],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              data[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              data[index].content,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Wrap(
                              spacing: -4,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      BlocProvider.of<DataBloc>(context)
                                          .add(DeleteFavItem(index: index));
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      size: 26,
                                    )),
                                data[index].isFavorite == true
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 26,
                                      )
                                    : Icon(
                                        Icons.favorite,
                                        size: 26,
                                      ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "Please add some data\nClick appbar icon for Quiz Game",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
            );
          }
          return Center(
            child: Text(
              "No state found!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
