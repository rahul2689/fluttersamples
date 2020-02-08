import 'package:flutter/material.dart';
import 'package:flutter_list_items_poc/widgets/categoryselector.dart';
import 'package:flutter_list_items_poc/widgets/favouratecontacts.dart';
import 'package:flutter_list_items_poc/widgets/recentchats.dart';

class HomeScreenWidget extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Theme.of(context).primaryColor,
       appBar: AppBar(
         leading: IconButton
           (icon: Icon(Icons.menu),
           iconSize: 30.0,
           color: Colors.white,
           onPressed: (){},
         ),
         title: Text( 'Chats',
           style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
           ),
           textAlign: TextAlign.center,
         ),
         actions: <Widget>[
           IconButton
             (icon: Icon(Icons.search),
             iconSize: 30.0,
             color: Colors.white,
             onPressed: (){},
           )
         ],
       ),

       body: Column(
         children: <Widget>[
           CategorySelector(),
           Expanded(
               child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only
                  (topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                )
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats()
                ],
              ),
           )
           )
         ],
       ),
     );
  }
}
