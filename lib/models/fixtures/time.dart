class Time {
    final String status;
    final StartingAt startingAt;
    final int minute;
    final int addedTime;
    final int injuryTime;

    Time({this.status, this.startingAt, this.minute, this.addedTime, this.injuryTime});

    factory Time.fromJson(Map<String, dynamic> json){
      return Time(
        status: json['status'],
        startingAt: StartingAt.fromJson(json['starting_at']),
        minute: json['minute'],
        addedTime: json['added_time'],
        injuryTime: json['injury_time']
      );
    }
}

class StartingAt {
    final int timestamp;

    StartingAt({this.timestamp});

    factory StartingAt.fromJson(Map<String, dynamic> json){
      return StartingAt(timestamp: json['timestamp']);
    }
}
