import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../scoped_models/fixture_models.dart';
import '../../models/fixtures/fixtures.dart';
import '../../models/fixtures/events.dart';

class DetailGoalHistory extends StatelessWidget {
  final Events events;
  final Fixture fixture;

  DetailGoalHistory(this.fixture, this.events);

  @override
  Widget build(BuildContext context) {
    var goalsTeamId = int.parse(events.teamId);
    Widget content = Container();
    if (fixture.homeTeam.id == goalsTeamId && events.type == 'goal') {
      content = Container(
          padding: EdgeInsets.only(top: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidFutbol,
                              color: Colors.green, size: 17.0),
                          Row(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    '${events.minute}',
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey[600]),
                                  )),
                              Container(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    '\'',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.grey[600]),
                                  ))
                            ],
                          )
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              bottom: 3.0, left: 10.0, right: 5.0),
                          child: Text('|',
                              style: TextStyle(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.grey))),
                      Container(
                          padding: EdgeInsets.only(bottom: 4.0, right: 15.0),
                          child: Text(events.result,
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w300))),
                      Container(
                          child: events.relatedPlayerName != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      events.playerName,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'assist: ${events.relatedPlayerName}',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(bottom: 2.0),
                                      child: Text(events.playerName,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ))
                    ],
                  )),
            ],
          ));
    } else if (fixture.awayTeam.id == goalsTeamId && events.type == 'goal') {
      content = Container(
          padding: EdgeInsets.only(top: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          child: events.relatedPlayerName != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      events.playerName,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'assist: ${events.relatedPlayerName}',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(bottom: 2.0),
                                      child: Text(events.playerName,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                )),
                      Container(
                          padding: EdgeInsets.only(bottom: 4.0, left: 15.0),
                          child: Text(events.result,
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w300))),
                      Container(
                          padding: EdgeInsets.only(
                              bottom: 3.0, right: 10.0, left: 5.0),
                          child: Text('|',
                              style: TextStyle(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.grey))),
                      Column(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidFutbol,
                              color: Colors.green, size: 17.0),
                          Row(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    '${events.minute}',
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey[600]),
                                  )),
                              Container(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    '\'',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.grey[600]),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ],
          ));
    }
    return content;
  }
}

