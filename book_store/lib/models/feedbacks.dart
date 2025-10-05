class Feedbacks {
  String? name;
  String? email;
  String? subject;
  String? message;

  Feedbacks({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
});



  factory Feedbacks.fromJson(Map<String ,dynamic> json){
    return Feedbacks(
      name: json['name'],
      email: json['email'],
      subject: json['subject'],
      message: json['message'],
    );
  }


  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'email': email,
      'subject': subject,
      'message': message,
    };


  }


}
