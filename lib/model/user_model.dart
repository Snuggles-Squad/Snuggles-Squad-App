import '../services/fb_auth_service.dart';

class UserDetails {
  String? uid, name, mail, phone, state, district;
  bool approved = false;

  DateTime? creationDateTime;

//  UserDetails({
//    required this.uid,
//    required this.name,
//    required this.mail,
//    required this.userType,
//  }) {
//    setCreationTime();
//  }

  // UserDetails.fromFbUser(FUser fuser) {
  //   uid = fuser.uid;
  //   name = fuser.displayName;
  //   phone = fuser.phoneNumber;
  //   mail = fuser.email;
  //   creationDateTime = fuser.metadata.creationTime;
  // }

  // void setCreationTime() async {
  //   final fuser = await FbAuthService.fUser.first;
  //   creationDateTime = fuser?.metadata.creationTime;
  // }

  UserDetails.fromFbMap(Map<String, dynamic> map) {
    uid = map['uid'];
    name = map['name'];
    mail = map['mail'];
    phone = map['phone'];

    approved = map['approved'];

    creationDateTime = DateTime.tryParse(map['creationDateTime'] ?? '');
  }

  Map<String, dynamic> get toFbMap => {
        'uid': uid,
        'name': name,
        'phone': phone,
        'mail': mail,
        'approved': approved,
        'creationDateTime': creationDateTime?.toIso8601String(),
      };
}
