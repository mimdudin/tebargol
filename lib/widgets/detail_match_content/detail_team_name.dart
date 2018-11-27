import 'package:flutter/material.dart';

import '../../models/fixtures/fixtures.dart';

class DetailTeamName extends StatelessWidget {
  final Fixture fixture;

  DetailTeamName(this.fixture);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.0, left: 10.0),
      child: Row(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(right: 5.0),
              child: Text('${fixture.homeTeam.name}',
                  style: TextStyle(fontSize: 16.0))),
          Container(
            child: Text('x'),
          ),
          Container(
              padding: EdgeInsets.only(left: 5.0),
              child: Text('${fixture.awayTeam.name}',
                  style: TextStyle(fontSize: 16.0))),
        ],
      ),
    );
  }
}