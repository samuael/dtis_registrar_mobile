class Address {
  int? id;
  String city;
  String region;
  String zone;
  String woreda;
  String kebele;
  String? uniqueAddress;
  Address({
    this.id,
    required this.city,
    required this.region,
    required this.zone,
    required this.woreda,
    required this.kebele,
    this.uniqueAddress,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: int.parse("${json["id"] ?? 0}"),
      city: "${json["city"]}",
      region: "${json["region"]}",
      zone: "${json["zone"]}",
      woreda: "${json["woreda"]}",
      kebele: "${json["kebele"]}",
      uniqueAddress: "${json["unique_address_name"]??''}",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "city": this.city,
      "region": this.region,
      "zone": this.zone,
      "woreda": this.woreda,
      "kebele": this.kebele,
      "unique_address_name": this.uniqueAddress,
    };
  }

  String toString() {
    return "${this.region}/${this.zone}/${this.woreda}\n ${this.city} / Kebele :${this.kebele}";
  }
}
