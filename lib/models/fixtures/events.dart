class Events {
  final int id;
  final String teamId;
  final String type;
  final int fixtureId;
  final int playerId;
  final String playerName;
  final int relatedPlayerId;
  final String relatedPlayerName;
  final int minute;
  final int extraMinute;
  final String reason;
  final int injuried;
  final String result;

  Events(
      {this.id,
      this.teamId,
      this.type,
      this.fixtureId,
      this.playerId,
      this.playerName,
      this.relatedPlayerId,
      this.relatedPlayerName,
      this.minute,
      this.extraMinute,
      this.reason,
      this.injuried,
      this.result});

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
        id: json['id'],
        teamId: json['team_id'],
        type: json['type'],
        fixtureId: json['fixture_id'],
        playerId: json['player_id'],
        playerName: json['player_name'],
        relatedPlayerId: json['related_player_id'],
        relatedPlayerName: json['related_player_name'],
        minute: json['minute'],
        extraMinute: json['extra_minute'],
        reason: json['reason'],
        injuried: json['injuried'],
        result: json['result']);
  }
}
