import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../scoped_models/fixture_models.dart';
import '../../models/fixtures/fixtures.dart';
import '../../models/fixtures/standingteams.dart';

class DetailMatchKlasemen extends StatelessWidget {
  final Fixture fixture;

  DetailMatchKlasemen(this.fixture);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<FixtureModel>(
      builder: (context, child, model) {
        return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
            },
            child: Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                    color: Colors.brown[50],
                    borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.only(
                    bottom: 15.0, left: 10.0, right: 10.0, top: 15.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            'Klasemen sementara >',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                          ),
                        )
                      ],
                    ),
                    _buildKlasemenMenu(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: model.standingTeams == null
                          ? 0
                          : model.getStandingsCount(),
                      itemBuilder: (context, int i) {
                        var standings = model.standingTeams[i];

                        return fixture.homeTeam.id != standings.teamId &&
                                fixture.awayTeam.id != standings.teamId
                            ? Container()
                            : _buildKlasemen(standings);
                      },
                    ),
                  ],
                )));
      },
    );
  }

  Widget _buildKlasemenMenu() {
    return Container(
        padding: EdgeInsets.only(top: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 9.0),
              child: Text(
                '#',
                style: TextStyle(fontSize: 12.0, color: Colors.grey[700]),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50.0),
              child: Text('Pertandingan Terakhir',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey[700])),
            ),
            Container(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('PTS',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey[700])),
            )
          ],
        ));
  }

  Widget _buildKlasemenTest() {
    return Container(
        padding: EdgeInsets.only(top: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: '12'.length == 2
                      ? EdgeInsets.only(left: 0.0)
                      : EdgeInsets.only(left: 6.5),
                  margin: EdgeInsets.only(right: 10.0),
                  child: Text(
                    '5',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                Container(
                  child: Image.network(fixture.homeTeam.logoPath,
                      width: 25.0, height: 25.0),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                    height: 16.0,
                    width: 35.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        left: 14.0, bottom: 1.0, right: 14.0, top: 1.0),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10.0))),
                    child: Text('W',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))),
                Container(
                    height: 16.0,
                    width: 35.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Text('W',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))),
                Container(
                    height: 16.0,
                    width: 35.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.red),
                    child: Text('L',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))),
                Container(
                    height: 16.0,
                    width: 35.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Text('D',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))),
                Container(
                    height: 16.0,
                    width: 35.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10.0))),
                    child: Text('L',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))),
              ],
            ),
            Container(
              padding: '4'.length == 2
                  ? EdgeInsets.only(right: 0.0)
                  : EdgeInsets.only(right: 6.5),
              child: Text(
                '10',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ],
        ));
  }

  Widget _buildKlasemen(StandingTeams standings) {
    String recentForm = standings.recentForm;
    Widget content = Container();
    if (fixture.homeTeam.id == standings.teamId) {
      content = Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: standings.position.toString().length == 2
                        ? EdgeInsets.only(left: 0.0)
                        : EdgeInsets.only(left: 6.5),
                    margin: EdgeInsets.only(right: 10.0),
                    child: Text(
                      standings.position.toString(),
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                  Container(
                    child: Image.network(fixture.homeTeam.logoPath,
                        width: 25.0, height: 25.0),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                      height: 16.0,
                      width: 38.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: getColor(recentForm.substring(0, 1)),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10.0))),
                      child: Text(recentForm.substring(0, 1),
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),
                  Container(
                      height: 16.0,
                      width: 35.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: getColor(recentForm.substring(1, 2))),
                      child: Text(recentForm.substring(1, 2),
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),
                  Container(
                      height: 16.0,
                      width: 35.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: getColor(recentForm.substring(2, 3))),
                      child: Text(recentForm.substring(2, 3),
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),
                  Container(
                      height: 16.0,
                      width: 35.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: getColor(recentForm.substring(3, 4))),
                      child: Text(recentForm.substring(3, 4),
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),
                  Container(
                      height: 16.0,
                      width: 38.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: getColor(recentForm.substring(4, 5)),
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10.0))),
                      child: Text(recentForm.substring(4, 5),
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),
                ],
              ),
              Container(
                padding: standings.total.points.toString().length == 2
                    ? EdgeInsets.only(right: 0.0)
                    : EdgeInsets.only(right: 6.5),
                child: Text(
                  standings.total.points.toString(),
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ));
    } else if (fixture.awayTeam.id == standings.teamId) {
      content = Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: standings.position.toString().length == 2
                        ? EdgeInsets.only(left: 0.0)
                        : EdgeInsets.only(left: 6.5),
                    margin: EdgeInsets.only(right: 10.0),
                    child: Text(
                      standings.position.toString(),
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                  Container(
                    child: Image.network(
                      fixture.awayTeam.logoPath,
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                      height: 16.0,
                      width: 38.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: getColor(recentForm.substring(0, 1)),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10.0))),
                      child: Text(recentForm.substring(0, 1),
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),
                  Container(
                      height: 16.0,
                      width: 35.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: getColor(recentForm.substring(1, 2))),
                      child: Text(recentForm.substring(1, 2),
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),
                  Container(
                      height: 16.0,
                      width: 35.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: getColor(recentForm.substring(2, 3))),
                      child: Text(recentForm.substring(2, 3),
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),
                  Container(
                      height: 16.0,
                      width: 35.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: getColor(recentForm.substring(3, 4))),
                      child: Text(recentForm.substring(3, 4),
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),
                  Container(
                      height: 16.0,
                      width: 38.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: getColor(recentForm.substring(4, 5)),
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10.0))),
                      child: Text(recentForm.substring(4, 5),
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),
                ],
              ),
              Container(
                padding: standings.total.points.toString().length == 2
                    ? EdgeInsets.only(right: 0.0)
                    : EdgeInsets.only(right: 6.5),
                child: Text(
                  standings.total.points.toString(),
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ));
    }
    return content;
  }

  Color getColor(String recentForm) {
    if (recentForm == 'L') {
      return Colors.red;
    } else if (recentForm == 'W') {
      return Colors.green;
    }
    return Colors.grey;
  }
}
