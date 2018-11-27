class Coach {
   final int coachId;
   final String firstName, lastName, nationality; 

  Coach({this.coachId, this.firstName, this.lastName, this.nationality});

  factory Coach.fromJson(Map<String, dynamic> json){
    return Coach(
      coachId: json['coach_id'],
      firstName: json['firstname'],
      lastName: json['lastname'],
      nationality: json['nationality']);
  }
}