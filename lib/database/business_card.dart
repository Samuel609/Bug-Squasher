
class Business_card{
  int? id;
  // String workArea;
  String email;
  // String phoneNO;
  String jobType;
  String company;


Business_card({
  this.id,
  // required this.workArea,
  required this.email,
  // required this.phoneNO,
  required this.jobType,
  required this.company,
});

factory Business_card.fromJson(Map<String, dynamic> json) => Business_card(
  id: json['id'], 
  // workArea: json ['workArea'], 
  email: json ['email'], 
  // phoneNO: json ['phoneNO'], 
  jobType: json ['jobType'], 
  company: json ['company']);

  Map<String,dynamic> tojson() => {
    'id' : id,
    // 'workArea': workArea,
    'email': email,
    // 'phoneNO': phoneNO,
    'jobType': jobType,
    'company': company,
  };

}