
import 'package:flutter/material.dart';
import 'package:wikipediaapp/ui/widgets/search_icon_button_widget.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppbar({
    Key key,
    String title
  }) :_title = title, preferredSize= const Size.fromHeight(56.0),super(key: key);

  final String _title;
  @override

  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Text(
          _title,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: SearchIconButton(),
        )
      ],
    );
  }

}

