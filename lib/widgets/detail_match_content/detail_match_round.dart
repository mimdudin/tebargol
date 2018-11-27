import 'package:flutter/material.dart';

import '../../models/fixtures/fixtures.dart';
import '../../scoped_models/fixture_models.dart';


class DetailMatchRound extends StatelessWidget {
  final FixtureModel model;
  final Fixture fixture;


  DetailMatchRound(this.model, this.fixture);

  @override
  Widget build(BuildContext context) {
     return Container(
        padding: EdgeInsets.only(top: 8.0, left: 10.0),
        child: Row(
          children: <Widget>[
            Container(
              child: Text('${model.country.name},',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12.0)),
            ),
            Container(
              child: Text('${fixture.league.name},',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12.0)),
            ),
            Container(
              child: Text('Gameweek ${fixture.round.name}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12.0)),
            )
          ],
        ));
  }
}
