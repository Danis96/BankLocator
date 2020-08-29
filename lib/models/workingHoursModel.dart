

class WorkingHoursModel {

   int day;
   int startHours;
   int startMinutes;
   int endHours;
   int endMinutes;

  WorkingHoursModel(
      {this.day,
      this.startHours,
      this.startMinutes,
      this.endHours,
      this.endMinutes});


  WorkingHoursModel.fromJson(Map<dynamic, dynamic> json) :
         day = json['day'],
         startHours  = json['start_hours'],
         startMinutes  =  json['start_minutes'],
         endHours =  json['end_hours'],
         endMinutes  = json['end_minutes'];
}