import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../scoped_models/fixture_models.dart';

class KlasemenMatchTab extends StatefulWidget {
  @override
  _KlasemenMatchTabState createState() => _KlasemenMatchTabState();
}

class _KlasemenMatchTabState extends State<KlasemenMatchTab>
    with AutomaticKeepAliveClientMixin<KlasemenMatchTab> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<FixtureModel>(
        builder: (context, child, model) {
      return Container(
          child: model.getStandingsCount() == 0
              ? Center(child: Text('No standings found'))
              : ListView.builder(
                  itemCount: model.standingTeams == null
                      ? 0
                      : model.getStandingsCount(),
                  itemBuilder: (context, int position) {
                    var standing = model.standingTeams[position];

                    // return Row(
                    //   children: <Widget>[
                    //     Text(standing.teamId.toString()),
                    //     Text(standing.groupName),
                    //     Text(standing.groupId.toString()),
                    //     Text(standing.teamName),
                    //     Text(standing.overall.gamesPlayed.toString()),
                    //     Text(standing.status),
                    //     Text(standing.result),
                    //     Text(standing.position.toString()),
                        return Text(standing.recentForm);
                      // ],
                    // );
                  },
                ));
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
