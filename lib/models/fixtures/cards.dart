class Cards {
    final int id;
    final String teamId;
    final String type;
    final int fixtureId;
    final int playerId;
    final String playerName;
    final int minute;
    final int extraMinute;
    final String reason;

    Cards({this.id, this.teamId, this.type, this.fixtureId, this.playerId, this.playerName, this.minute, this.extraMinute, this.reason});

    factory Cards.fromJson(Map<String, dynamic> json){
      return Cards(
        id: json['id'],
        teamId: json['team_id'],
        type: json['type'],
        fixtureId: json['fixture_id'],
        playerId: json['player_id'],
        playerName: json['player_name'],
        minute: json['minute'],
        extraMinute: json['extra_minute'],
        reason: json['reason']
      );
    }
}

