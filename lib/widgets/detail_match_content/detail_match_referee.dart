import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DetailMatchReferee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 10.0, top: 7.0),
                    child: Icon(FontAwesomeIcons.solidUserCircle, size: 15.0)),
                Container(
                    padding: EdgeInsets.only(left: 7.0, top: 8.0),
                    child: Text(
                      'Wasit',
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
                    'Kevin Storm',
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
                    'Kebangsaan',
                    style: TextStyle(),
                  )),
                  Container(
                      // padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                    'Norwegia',
                    style: TextStyle(),
                  )),
                ],
              ),
            ),
          ],
        ));
  
  }
}