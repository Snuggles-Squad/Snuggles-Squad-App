import '../services/fb_auth_service.dart';

class UserDetails {
  String? uid, name, mail, phone, state, district;
  bool approved = false;

  DateTime? creationDateTime;

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
