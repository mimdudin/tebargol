class Goals {
  final int id;
  final String teamId;
  final String type;
  final int fixtureId;
  final int playerId;
  final String playerName;
  final int assistId;
  final String assistName;
  final int minute;
  final int extraMinute;
  final String reason;
  final String result;

  Goals(
      {this.id,
      this.teamId,
      this.type,
      this.fixtureId,
      this.playerId,
      this.playerName,
      this.assistId,
      this.assistName,
      this.minute,
      this.extraMinute,
      this.reason,
      this.result});

  factory Goals.fromJson(Map<String, dynamic> json) {
    return Goals(
        id: json['id'],
        teamId: json['team_id'],
        type: json['type'],
        fixtureId: json['fixture_id'],
        playerId: json['player_id'],
        playerName: json['player_name'],
        assistId: json['player_assist_id'],
        assistName: json['player_assist_name'],
        minute: json['minute'],
        extraMinute: json['extra_minute'],
        reason: json['reason'],
        result: json['result']);
  }
}
