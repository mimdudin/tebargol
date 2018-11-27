class GoalnCard {
  final int cardId;
  final String cardTeamId;
  final String cardType;
  final int cardFixtureId;
  final int cardPlayerId;
  final String cardPlayerName;
  final int cardMinute;
  final int cardExtraMinute;
  final String cardReason;
  //goal
  final int goalId;
  final String goalTeamId;
  final String goalType;
  final int goalFixtureId;
  final int goalPlayerId;
  final String goalPlayerName;
  final int goalAssistId;
  final String goalAssistName;
  final int goalMinute;
  final int goalExtraMinute;
  final String goalReason;
  final String goalResult;

  GoalnCard(
      {this.cardId,
      this.cardTeamId,
      this.cardType,
      this.cardFixtureId,
      this.cardPlayerId,
      this.cardPlayerName,
      this.cardMinute,
      this.cardExtraMinute,
      this.cardReason,
      this.goalId,
      this.goalTeamId,
      this.goalType,
      this.goalFixtureId,
      this.goalPlayerId,
      this.goalPlayerName,
      this.goalAssistId,
      this.goalAssistName,
      this.goalMinute,
      this.goalExtraMinute,
      this.goalReason,
      this.goalResult});

  // factory Cards.fromJson(Map<String, dynamic> json){
  //   return Cards(
  //     id: json['id'],
  //     teamId: json['team_id'],
  //     type: json['type'],
  //     fixtureId: json['fixture_id'],
  //     playerId: json['player_id'],
  //     playerName: json['player_name'],
  //     minute: json['minute'],
  //     extraMinute: json['extra_minute'],
  //     reason: json['reason']
  //   );
  // }
}
