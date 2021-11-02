class Society {
  String address;
  int flats;
  String phone;
  String name;
  int residents;
  int vehicles;
  List<Complaints> complaints;
  int chairman;
  int watchment;
  List<String> facilities;

  Society(
      {this.address,
      this.flats,
      this.phone,
      this.name,
      this.residents,
      this.vehicles,
      this.complaints,
      this.chairman,
      this.watchment,
      this.facilities});

  Society.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    flats = json['flats'];
    phone = json['phone'];
    name = json['name'];
    residents = json['residents'];
    vehicles = json['vehicles'];
    if (json['Complaints'] != null) {
      complaints = new List<Complaints>();
      json['Complaints'].forEach((v) {
        complaints.add(new Complaints.fromJson(v));
      });
    }
    chairman = json['chairman'];
    watchment = json['watchment'];
    facilities = json['Facilities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['flats'] = this.flats;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['residents'] = this.residents;
    data['vehicles'] = this.vehicles;
    if (this.complaints != null) {
      data['Complaints'] = this.complaints.map((v) => v.toJson()).toList();
    }
    data['chairman'] = this.chairman;
    data['watchment'] = this.watchment;
    data['Facilities'] = this.facilities;
    return data;
  }
}

class Complaints {
  String date;
  String name;
  String description;
  String id;
  String image;

  Complaints({this.date, this.name, this.description, this.id, this.image});

  Complaints.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    name = json['name'];
    description = json['description'];
    id = json['id'];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['name'] = this.name;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
