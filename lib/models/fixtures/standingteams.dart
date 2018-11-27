class StandingTeams {
    final int position;
    final int teamId;
    final String teamName;
    final int groupId;
    final String groupName;
    final Overall overall;
    final Total total;
    final String result;
    final String recentForm;
    final String status;

    StandingTeams({this.position, this.teamId, this.teamName, this.groupId, this.groupName, this.overall, this.total, this.result, this.recentForm, this.status});

    factory StandingTeams.fromJson(Map<String, dynamic> json){
      return StandingTeams(
        position: json['position'],
        teamId: json['team_id'],
        teamName: json['team_name'],
        groupId: json['group_id'],
        groupName: json['group_name'],
        overall: Overall.fromJson(json['overall']),
        total: Total.fromJson(json['total']),
        result: json['result'],
        recentForm: json['recent_form'],
        status: json['status']
      );
    }
}

class Overall {
    final int gamesPlayed;

    Overall({this.gamesPlayed});

    factory Overall.fromJson(Map<String, dynamic> json){
      return Overall(
        gamesPlayed: json['games_played'],
      );
    }
}

class Total {
    final String goalDiff;
    final int points;

    Total({this.goalDiff, this.points});

    factory Total.fromJson(Map<String, dynamic> json){
      return Total(
        goalDiff: json['goal_different'],
        points: json['points']
      );
    }
}