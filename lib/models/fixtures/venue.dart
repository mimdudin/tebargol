class Venue {
  final int id, capacity;
  final String name, address, city, imagePath;

  Venue(
      {this.id,
      this.capacity,
      this.name,
      this.address,
      this.city,
      this.imagePath});

  // factory Venue.fromJson(Map<String, dynamic> json) {
  //   return Venue(
  //       id: json['id'],
  //       capacity: json['capacity'],
  //       name: json['name'],
  //       address: json['address'],
  //       city: json['city'],
  //       imagePath: json['image_path']);
  // }
}
