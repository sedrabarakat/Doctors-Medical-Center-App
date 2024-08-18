class WorkingHoursModel {
  final List<String> monday;
  final List<String> tuesday;
  final List<String> wednesday;
  final List<String> thursday;
  final List<String> friday;
  final List<String> saturday;
  final List<String> sunday;

  WorkingHoursModel({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  factory WorkingHoursModel.fromJson(Map<String, dynamic> json) {
    return WorkingHoursModel(
      monday: List<String>.from(json['Monday']),
      tuesday: List<String>.from(json['Tuesday']),
      wednesday: List<String>.from(json['Wednesday']),
      thursday: List<String>.from(json['Thursday']),
      friday: List<String>.from(json['Friday']),
      saturday: List<String>.from(json['Saturday']),
      sunday: List<String>.from(json['Sunday']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Monday': monday,
      'Tuesday': tuesday,
      'Wednesday': wednesday,
      'Thursday': thursday,
      'Friday': friday,
      'Saturday': saturday,
      'Sunday': sunday,
    };
  }
}
