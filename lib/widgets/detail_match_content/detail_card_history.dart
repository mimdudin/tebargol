import 'package:flutter/material.dart';

import '../../scoped_models/fixture_models.dart';
import '../../models/fixtures/fixtures.dart';
import '../../models/fixtures/events.dart';

class DetailCardHistory extends StatelessWidget {
  final Events events;
  final Fixture fixture;

  DetailCardHistory(this.fixture, this.events);

  @override
  Widget build(BuildContext context) {
    var cardsTeamId = int.parse(events.teamId);
    Widget content = Container();
    if (fixture.homeTeam.id == cardsTeamId && events.type == 'yellowcard' ||
        events.type == 'redcard') {
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
                          Container(
                            padding: EdgeInsets.only(top: 5.0),
                            child: events.type == 'yellowcard'
                                ? _buildYellowCard()
                                : _buildRedCard(),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(top: 4.0, left: 2.0),
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
                              bottom: 3.0, left: 10.0, right: 3.0),
                          child: Text('|',
                              style: TextStyle(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.grey))),
                      Container(
                          child: events.reason == null && events.reason == ""
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(bottom: 2.0),
                                      child: Text(
                                          events.playerName == null ||
                                                  events.playerName == ""
                                              ? 'Player Id: ' +
                                                  events.playerId.toString()
                                              : events.playerName,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      events.playerName == null ||
                                              events.playerName == ""
                                          ? 'Player Id: ' +
                                              events.playerId.toString()
                                          : events.playerName,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      // '${events.reason}',
                                      'Argument',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ))
                    ],
                  )),
            ],
          ));
    } else if (fixture.awayTeam.id == cardsTeamId &&
            events.type == 'yellowcard' ||
        events.type == 'redcard') {
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
                          child: events.reason == null || events.reason == ""
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(bottom: 2.0),
                                      child: Text(
                                          events.playerName == null ||
                                                  events.playerName == ""
                                              ? 'Player Id: ' +
                                                  events.playerId.toString()
                                              : events.playerName,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      events.playerName == null ||
                                              events.playerName == ""
                                          ? 'Player Id: ' +
                                              events.playerId.toString()
                                          : events.playerName,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      // '${events.reason}',
                                      'Argument',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                )),
                      Container(
                          padding: EdgeInsets.only(
                              bottom: 3.0, right: 10.0, left: 3.0),
                          child: Text('|',
                              style: TextStyle(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.grey))),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 5.0),
                            child: events.type == 'yellowcard'
                                ? _buildYellowCard()
                                : _buildRedCard(),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(top: 4.0, left: 2.0),
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

  Widget _buildYellowCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
      decoration: BoxDecoration(
        color: Colors.yellow[600],
      ),
      child: Text(
        '',
      ),
    );
  }

  Widget _buildRedCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Text(
        '',
      ),
    );
  }
}
