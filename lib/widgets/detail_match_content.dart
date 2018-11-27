import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_admob/firebase_admob.dart';

import '../scoped_models/fixture_models.dart';
import '../models/fixtures/fixtures.dart';

import './detail_match_content/detail_match_round.dart';
import './detail_match_content/detail_team_name.dart';
import './detail_match_content/detail_scores_logo.dart';
import './detail_match_content/detail_event_history.dart';
import './detail_match_content/detail_match_referee.dart';
import './detail_match_content/detail_match_venue.dart';
import './detail_match_content/detail_match_klasemen.dart';
import './detail_match_content/detail_match_prediction.dart';


class DetailMatchContent extends StatelessWidget {
  final Fixture fixture;

  DetailMatchContent({this.fixture});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<FixtureModel>(
      builder: (context, child, model) {
        return ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                DetailMatchRound(model, fixture),
                DetailTeamName(fixture),
                DetailScoresLogo(fixture),
                Container(
                    child: fixture.time.status == 'NS'
                        ? DetailMatchKlasemen(fixture)
                        : Column(
                            children: <Widget>[
                              DetailEventHistory(fixture),
                            ],
                          )),
                DetailMatchPrediction(),
                DetailMatchReferee(),
                Container(
                    padding: EdgeInsets.only(left: 7.0, right: 7.0),
                    child: Divider(color: Colors.black38)),
                DetailMatchVenue(),
              ],
            )
          ],
        );
      },
    );
  }
}
