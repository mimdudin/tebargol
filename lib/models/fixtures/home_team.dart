class HomeTeam {
  final int id;
  final bool nationalTeam;
  final String name, logoPath, shortName;

    HomeTeam({this.id, this.name, this.nationalTeam, this.logoPath, this.shortName});

    factory HomeTeam.fromJson(Map<String, dynamic> json){
      return HomeTeam(
          id: json['id'],
          name: json['name'],
          nationalTeam: json['national_team'],
          logoPath: json['logo_path'],
          shortName: json['short_code']
        );
    }
}