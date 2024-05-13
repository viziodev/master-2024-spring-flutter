class CoursModel {
    int id;
    String module;
    String professor;
    String status;
    String icon;
    CoursModel({required this.id,required this.module,required this.icon,required this.professor,required this.status});
  
  factory CoursModel.fromMap(Map<String, dynamic> data){
           return CoursModel(
                  id:data["id"] ,
                  icon: data["icon"] ,
                  professor: data["professor"],
                  module: data["module"],
                  status:data["status"]
              );
  }

}