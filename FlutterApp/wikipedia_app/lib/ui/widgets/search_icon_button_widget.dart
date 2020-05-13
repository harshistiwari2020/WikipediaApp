
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wikipediaapp/search_widget.dart';

class SearchIconButton extends StatelessWidget {
  const SearchIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
    );
  }
}
