class Season {

  final int id;
  final String name;
  final bool isCurrentSeason;

    Season({this.id, this.name, this.isCurrentSeason});

    factory Season.fromJson(Map<String, dynamic> json){
      return Season(
          id: json['id'],
          name: json['name'],
          isCurrentSeason: json['is_current_season']
        );
    }
}