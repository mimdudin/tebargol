class Formations {
    final String localteamFormation;
    final String visitorteamFormation;

    Formations({this.localteamFormation, this.visitorteamFormation});

    factory Formations.fromJson(Map<String, dynamic> json){
      return Formations(
        localteamFormation: json['localteam_formation'],
        visitorteamFormation: json['visitorteam_formation']
      );
    }
}