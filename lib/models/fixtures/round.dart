class Round {

  final int id, name;

    Round({this.id, this.name});

    factory Round.fromJson(Map<String, dynamic> json){
      return Round(
          id: json['id'],
          name: json['name'],
        );
    }
}