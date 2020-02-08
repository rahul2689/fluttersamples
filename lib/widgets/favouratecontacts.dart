import 'package:flutter/material.dart';
import 'package:flutter_list_items_poc/models/messagemodel.dart';
import 'package:flutter_list_items_poc/widgets/chat_screen.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Favorite Contacts",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 1.0),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                      ),
                      iconSize: 26.0,
                      color: Colors.blueGrey,
                      onPressed: () {})
                ],
              )),
          Container(
            height: 120.0,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreen(favorites[index]))),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage:
                              AssetImage(favorites[index].imageUrl),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          favorites[index].name,
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
