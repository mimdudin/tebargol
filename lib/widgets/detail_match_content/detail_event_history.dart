import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../scoped_models/fixture_models.dart';
import '../../models/fixtures/events.dart';
import '../../models/fixtures/fixtures.dart';

import './detail_goal_history.dart';
import './detail_subs_history.dart';
import './detail_card_history.dart';

class DetailEventHistory extends StatelessWidget {
  final Fixture fixture;

  DetailEventHistory(this.fixture);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Card(
        elevation: 0.0,
        margin: EdgeInsets.only(bottom: 0.5),
        child: fixture.time.status == 'NS'
            ? Container()
            : NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      // _htStatus(),

                      _timeStatus(),
                      Container(child: Divider(height: 0.0, color: Colors.black38)),
                      ScopedModelDescendant<FixtureModel>(
                        builder: (context, child, model) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: model.eventList == null
                                ? 0
                                : model.getEventsCount(),
                            itemBuilder: (context, int i) {
                              var events = model.eventList[i];
                              return fixture.id != events.fixtureId
                                  ? Container()
                                  : _buildEventHistory(events);
                            },
                          );
                        },
                      ),
                      _ftStatus(),
                      Container(child: Divider(height: 0.0, color: Colors.black38)),
                    ],
                  ),
                ))));
  }

  Widget _timeStatus() {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(
        fixture.time.startingAt.timestamp * 1000);

    var matchTime = formatDate(dateTime, [hh, ':', nn, ' ', am]);

    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              'Hari ini $matchTime',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          Container(
              child: fixture.time.status != 'FT' && fixture.time.minute < 46
                  ? Container(
                      child: Text('HT', style: TextStyle(fontSize: 12.0)))
                  : Container(
                      child: Text('FT', style: TextStyle(fontSize: 12.0)))),
        ],
      ),
    );
  }

  Widget _ftStatus() {
    Widget content = Container();
    if (fixture.time.status != 'FT' && fixture.scores.htScore != null) {
      content = Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'Babak 2',
                  style: TextStyle(color: Colors.grey[700], fontSize: 12.0),
                ),
              )
            ],
          ));
    } else if (fixture.time.status == 'FT' && fixture.scores.ftScore != null) {
      content = Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  fixture.time.status + ' ' + fixture.scores.ftScore,
                  style: TextStyle(color: Colors.grey[700], fontSize: 12.0),
                ),
              )
            ],
          ));
    }
    return content;
  }

  Widget _htStatus() {
    Widget content = Container();
    if (fixture.time.status != 'HT' && fixture.scores.htScore == null) {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              'Babak 1',
              style: TextStyle(color: Colors.grey[700]),
            ),
          )
        ],
      );
    } else if (fixture.scores.htScore != null && fixture.time.minute > 45) {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              'HT ' + fixture.scores.htScore,
              style: TextStyle(color: Colors.grey[700]),
            ),
          )
        ],
      );
    }
    return content;
  }

  Widget _buildEventHistory(Events events) {
    return Container(
      child: Column(
        children: <Widget>[
          DetailCardHistory(fixture, events),
          DetailGoalHistory(fixture, events),
          DetailSubsHistory(fixture, events)
        ],
      ),
    );
  }
}
