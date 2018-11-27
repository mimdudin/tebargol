import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailMatchVenue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
return Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10.0, top: 7.0),
                  child: Icon(FontAwesomeIcons.home, size: 15.0),
                ),
                Container(
                    padding: EdgeInsets.only(left: 7.0, top: 8.0),
                    child: Text(
                      'Tempat',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ))
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Text(
                    'Nama',
                    style: TextStyle(),
                  )),
                  Container(
                      // padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                    'Wembley Stadium',
                    style: TextStyle(),
                  )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Text(
                    'Lokasi',
                    style: TextStyle(),
                  )),
                  Container(
                      // padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                    'London, England',
                    style: TextStyle(),
                  )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Text(
                    'Attendance',
                    style: TextStyle(),
                  )),
                  Container(
                      // padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                    '32530',
                    style: TextStyle(),
                  )),
                ],
              ),
            )
          ],
        ));
  }
}