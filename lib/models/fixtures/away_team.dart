class AwayTeam {
  final int id;
  final bool nationalTeam;
  final String name, logoPath, shortName;

    AwayTeam({this.id, this.name,  this.nationalTeam, this.logoPath, this.shortName});

    factory AwayTeam.fromJson(Map<String, dynamic> json){
      return AwayTeam(
          id: json['id'],
          name: json['name'],
          nationalTeam: json['national_team'],
          logoPath: json['logo_path'],
          shortName: json['short_code']
        );
    }
}