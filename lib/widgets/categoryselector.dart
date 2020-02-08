import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget{
  @override
  CategorySelectorWidget createState() => CategorySelectorWidget();

}

class CategorySelectorWidget extends State<CategorySelector>{
  int selectedIndex =0;
  final List<String> categories = ["Messages", "Groups", "Online", "Requests"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      color: Colors.red,
      child: ListView.builder(scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){

        return GestureDetector(
          onTap: (){
           setState(() {
             selectedIndex = index;
           });
        },
          child:Padding(
            padding: EdgeInsets.symmetric(

              horizontal: 20.0,
              vertical: 30.0
            ),
            child: Text(
              this.categories[index],
              style: TextStyle(
                color: index == selectedIndex ? Colors.white:Colors.white60,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.2
              ),
            ),
          )
        );
        },
      ),
    );
  }

}