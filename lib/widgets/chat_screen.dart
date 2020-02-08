import 'package:flutter/material.dart';
import 'package:flutter_list_items_poc/models/messagemodel.dart';
import 'package:flutter_list_items_poc/models/usermodel.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen(this.user);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.user.name,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18.0),
          textAlign: TextAlign.center,
        )),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0))),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message message = messages[index];
                    bool isMe = message.sender.id == currentUser.id;
                    return _buildMessage(message, isMe);
                  }),
            ),
          )
          ),
          _buildMessageSendWidget()
        ],
      ),
    );
  }

  Widget _buildMessage(Message message, bool isMe) {
    return Row(
      children: <Widget>[
        Container(
          margin: isMe
              ? EdgeInsets.only(left: 80.0, top: 10.0, bottom: 10.0)
              : EdgeInsets.only(top: 10.0, bottom: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          decoration: BoxDecoration(
              color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
              borderRadius: isMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0))
                  : BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(message.time),
              SizedBox(height: 5.0),
              Text(message.text),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.80,
        ),
        !isMe
            ? IconButton(
                icon: message.isLiked
                    ? Icon(
                        Icons.favorite,
                        color: Theme.of(context).primaryColor,
                      )
                    : Icon(
                        Icons.favorite_border,
                        color: Colors.blueGrey,
                      ),
                iconSize: 20.0,
                color: Colors.blueGrey,
                onPressed: () {},
              )
            : SizedBox.shrink()
      ],
    );
  }

  Widget _buildMessageSendWidget() {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(child:TextField(

          )),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 20.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
