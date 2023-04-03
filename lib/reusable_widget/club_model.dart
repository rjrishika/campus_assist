

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Club extends Equatable{
   final String name;
   final String desc;
  final List<dynamic> logo;

  const Club(
  {
    required this.name,
    required this.desc,
    required this.logo,
}
      );

  @override
  // TODO: implement props
  List<Object?> get props => [name,desc,logo];

  static Club fromSnapshot(DocumentSnapshot snap ){
    Club club = Club(
      name: snap['name'],
      desc: snap['desc'],
      logo: snap['logo'],
    );
    return club;
  }

}