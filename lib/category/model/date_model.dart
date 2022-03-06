class Date {
  int seconds;
  int minutes;
  int hours;
  int day;
  int month;
  int year;
  String? dayname;
  String? yearname;

  Date({
    this.seconds = 0,
    this.minutes = 0,
    this.hours = 0,
    this.day = 0,
    this.month = 0,
    this.year = 0,
    this.dayname = "",
    this.yearname = "",
  });
  @override
  String toString() {
    return "${this.year}/${this.month}/${this.day} ${this.hours}:${this.minutes}:${this.seconds}";
  }

  Map<String, dynamic> toJson() {
    return {
      "year": this.year,
      "month": this.month,
      "day": this.day,
      "hours": this.hours,
      "minutes": this.minutes,
      "seconds": this.seconds,
    };
  }

  factory Date.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Date();
    }
    return Date(
      seconds: int.parse("${json["seconds"]}"),
      minutes: int.parse("${json["minutes"]}"),
      hours: int.parse("${json["hours"]}"),
      day: int.parse("${json["day"]}"),
      month: int.parse("${json["month"]}"),
      year: int.parse("${json["month"]}"),
      dayname: json["day_name"] ?? "",
      yearname: json["year_name"] ?? "",
    );
  }
}