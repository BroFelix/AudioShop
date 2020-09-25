import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Whole Market'),
          elevation: 0,
        ),
        drawer: Drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        ),
      );
}
