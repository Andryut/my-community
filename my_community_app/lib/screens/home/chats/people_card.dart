import 'package:flutter/material.dart';

class PeopleCard extends StatelessWidget {
  PeopleCard({this.imageUrl, this.name});

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: FlatButton(
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: imageUrl == null
                  ? CircleAvatar(
                      child: Icon(Icons.person, color: Colors.black38),
                    )
                  : Container(
                      child: Material(
                        child: Image.asset(
                          this.imageUrl,
                          fit: BoxFit.cover,
                        ),
                        shape: CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                      ),
                      constraints: BoxConstraints(
                          minHeight: 35.0,
                          minWidth: 35.0,
                          maxHeight: 40.0,
                          maxWidth: 40.0),
                    ),
            ),
            Container(
              child: Text(
                name,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              margin: EdgeInsets.only(right: 50.0, top: 10.0, bottom: 10.0),
            ),
          ],
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
