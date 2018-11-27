import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/fixtures/fixtures.dart';
import '../models/fixtures/goals.dart';
import '../scoped_models/fixture_models.dart';
import '../pages/match_tab/home_tab_detail.dart';

class FixtureListItem extends StatelessWidget {
  final Fixture fixture;

  FixtureListItem({@required this.fixture});

  @override
  Widget build(BuildContext context) {
    var route = MaterialPageRoute(builder: (BuildContext context) {
      return ScopedModelDescendant<FixtureModel>(
        builder: (context, child, model) {
          return HomeTabDetail(fixture: fixture, model: model);
        },
      );
    });
    return InkWell(
      onTap: () => Navigator.push(context, route),
      child: Card(
        elevation: 1.0,
        color: Colors.white,
        margin: EdgeInsets.all(2.0),
        child: Container(
            child: fixture.time.status == 'NS'
                ? _buildAlarmDate()
                : _buildScoreMin()),
      ),
    );
  }

  Widget _buildAlarmDate() {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(
        fixture.time.startingAt.timestamp * 1000);
      var matchTime =  formatDate(dateTime, [hh, ':', nn, ' ', am]);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Text(
                '${fixture.league.name}',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Image.network('${fixture.homeTeam.logoPath}',
                  width: 25.0, height: 25.0),
            ),
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(
                      Icons.alarm,
                      color: Colors.grey[500],
                    )),
                Container(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(matchTime,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Colors.grey[600]))),
              ],
            )),
            Container(
              child: Image.network('${fixture.awayTeam.logoPath}',
                  width: 25.0, height: 25.0),
            ),
          ],
        )),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  '${fixture.homeTeam.shortName}',
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
                )),
            Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  '',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )),
            Container(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text('${fixture.awayTeam.shortName}',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ))),
          ],
        ))
      ],
    );
  }

  Widget _buildScoreMin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Text(
                '${fixture.league.name}',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
        Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 7.0),
                  child: Image.network('${fixture.homeTeam.logoPath}',
                      width: 25.0, height: 25.0),
                ),
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child: fixture.time.status != 'FT'
                            ? Text(
                                '${fixture.time.minute}\'',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 10.0),
                              )
                            : Text(
                                '${fixture.time.status}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0),
                              )),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right: 5.0),
                              child: Text(
                                '${fixture.scores.localteamScore}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              )),
                          Container(
                              padding: EdgeInsets.only(bottom: 2.0),
                              child: Text(
                                ':',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 5.0),
                            child: Text(
                              '${fixture.scores.visitorteamScore}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                Container(
                  padding: EdgeInsets.only(top: 7.0),
                  child: Image.network('${fixture.awayTeam.logoPath}',
                      width: 25.0, height: 25.0),
                ),
              ],
            )),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(bottom: 5.0, top: 12.0),
                child: Text(
                  '${fixture.homeTeam.shortName}',
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
                )),
            Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  '',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )),
            Container(
                padding: EdgeInsets.only(bottom: 5.0, top: 12.0),
                child: Text('${fixture.awayTeam.shortName}',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ))),
          ],
        ))
      ],
    );
  }
}
