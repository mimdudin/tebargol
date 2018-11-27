class Standings {
    final int localteamPosition;
    final int visitorteamPosition;

    Standings({this.localteamPosition, this.visitorteamPosition});

    factory Standings.fromJson(Map<String, dynamic> json){
      return Standings(
        localteamPosition: json['localteam_position'],
        visitorteamPosition: json['visitorteam_position']
      );
    }
}