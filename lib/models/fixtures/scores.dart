class Scores {
    final int localteamScore;
    final int visitorteamScore;
    final int localteamPenScore;
    final int visitorteamPenScore;
    final String htScore;
    final String ftScore;
    final String etScore;

  Scores({this.localteamScore, this.visitorteamScore, this.localteamPenScore, this.visitorteamPenScore, this.htScore, this.ftScore, this.etScore});

  factory Scores.fromJson(Map<String, dynamic> json){
    return Scores(
      localteamScore: json['localteam_score'],
      visitorteamScore: json['visitorteam_score'],
      localteamPenScore: json['localteam_pen_score'],
      visitorteamPenScore: json['visitorteam_pen_score'],
      htScore: json['ht_score'],
      ftScore: json['ft_score'],
      etScore: json['et_score'], 
    );
  }
}