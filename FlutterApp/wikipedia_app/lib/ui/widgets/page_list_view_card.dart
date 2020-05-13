import 'package:flutter/material.dart';
import 'package:wikipediaapp/core/models/PageListItemModel.dart';

class PageListViewCard extends StatelessWidget {
  final PageListItemModel post;
  final Function onTap;
  const PageListViewCard({this.post, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.all(10),
      color: Colors.black,
      elevation: 3,
      shadowColor: Colors.blueAccent,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(post.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26.0),),
              SizedBox(height: 8,),
              Text(post.summary, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
