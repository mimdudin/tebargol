class League {
  final int id, legacyId, countryId, currentSeasonId, currentRoundId, currentStageId;
  final bool isCup;
  final String name;

    League({this.id, this.legacyId, this.name, this.countryId, this.isCup, this.currentSeasonId, this.currentRoundId, this.currentStageId});

    factory League.fromJson(Map<String, dynamic> json){
      return League(
          id: json['id'],
          legacyId: json['legacy_id'],
          name: json['name'],
          countryId: json['country_id'],
          isCup: json['is_cup'],
          currentSeasonId: json['current_season_id'],
          currentRoundId: json['current_round_id'],
          currentStageId: json['current_stage_id'],
        );
    }
}