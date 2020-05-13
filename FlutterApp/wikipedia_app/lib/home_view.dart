import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wikipediaapp/search_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            'Home',
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: IconButton(
              icon: RawMaterialButton(
                onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                },
                elevation: 2.0,
                child: Icon(
                  Icons.search,
                  size: 25.0,
                  color: Colors.white,
                ),
                shape: CircleBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
