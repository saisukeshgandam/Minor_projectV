import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({ Key? key }) : super(key: key);

  get nameController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Details"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 200,
              width: 200,
              child: Image.network("https://static.thenounproject.com/png/854951-200.png",)
              ),
              Container(
            padding: EdgeInsets.all(9),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Name'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(9),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Email'),
            ),
          ),
          

          ],
        ),
      ),
      
    );
  }
}