class Coaches {
    final int localteamCoachId;
    final int visitorteamCoachId;

    Coaches({this.localteamCoachId, this.visitorteamCoachId});

    factory Coaches.fromJson(Map<String, dynamic> json){
      return Coaches(localteamCoachId: json['localteam_coach_id'], visitorteamCoachId: json['visitorteam_coach_id']);
    }
}