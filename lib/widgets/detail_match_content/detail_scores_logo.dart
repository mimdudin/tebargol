import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import '../../models/fixtures/fixtures.dart';

class DetailScoresLogo extends StatelessWidget {
  final Fixture fixture;

  DetailScoresLogo(this.fixture);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5.0),
        child: Column(
          children: <Widget>[
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Image.network('${fixture.homeTeam.logoPath}',
                      width: 50.0, height: 50.0),
                ),
                Container(
                    child: fixture.time.status == 'NS'
                        ? _buildCountdown()
                        : _buildScore()),
                Container(
                  child: Image.network('${fixture.awayTeam.logoPath}',
                      width: 50.0, height: 50.0),
                ),
              ],
            )),
            Container(
                child: fixture.scores.htScore == null && fixture.time.status == 'NS' ?
                Container() : 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 3.0, top: 2.0),
                    child: Text(
                      '( ${fixture.scores.localteamScore}',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0),
                    )),
                Container(
                    child: Text(
                      '-',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 3.0, top: 2.0),
                  child: Text(
                    '${fixture.scores.visitorteamScore} )',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0),
                  ),
                ),
              ],
            )),
          ],
        ));
  }

  Widget _buildScore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(right: 5.0),
            child: Text(
              '${fixture.scores.localteamScore}',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w200,
                  fontSize: 35.0),
            )),
        Container(
            padding: EdgeInsets.only(bottom: 2.0),
            child: Text(
              '-',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w200,
                  fontSize: 45.0),
            )),
        Container(
          margin: EdgeInsets.only(left: 5.0),
          child: Text(
            '${fixture.scores.visitorteamScore}',
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w200,
                fontSize: 35.0),
          ),
        ),
      ],
    );
  }

  Widget _buildCountdown() {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(
        fixture.time.startingAt.timestamp * 1000);
    print(dateTime);
    print(fixture.time.startingAt.timestamp);
    // print(formatDate(dateTime, [HH, ':', nn]));
    print(formatDate(dateTime, [HH, ':', nn, ':', ss]));

    var matchTime = formatDate(dateTime, [hh, ':', nn, ' ', am]);
    return Column(
      children: <Widget>[
        Container(
          child: Text('Hari ini $matchTime', style: TextStyle(fontSize: 12.0)),
        ),
        Container(
            child: Text(
          '06:04:12',
          style: TextStyle(fontSize: 20.0),
        )),
      ],
    );
  }
}
