import 'package:flutter/material.dart';
import 'package:flutter_list_items_poc/models/messagemodel.dart';
import 'package:flutter_list_items_poc/widgets/chat_screen.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message message = chats[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatScreen(message.sender))),
                child: Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      color: message.isRead ? Colors.white : Color(0xFFFFEFEE),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage:
                                AssetImage(message.sender.imageUrl),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  message.sender.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 15.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.50,
                                  child: Text(
                                    message.text,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blueGrey),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            message.time,
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.blueGrey),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          message.isRead
                              ? SizedBox.shrink()
                              : Container(
                                  width: 40.0,
                                  height: 20.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Theme.of(context).primaryColor),
                                  child: Text(
                                    'NEW',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
