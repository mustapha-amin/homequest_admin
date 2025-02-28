import 'package:homequest_admin/models/review.dart';

import 'user.dart';

class AgentModel extends User {
  final int phoneNumber;

  final String agentID;

  final String name;

  final String profilePicture;

  final List<String> listingsIDs;

  final int revenue;

  final List<Review> reviews;

  final String email;

  AgentModel({
    required this.agentID,
    required this.name,
    required this.phoneNumber,
    required this.profilePicture,
    required this.listingsIDs,
    required this.reviews,
    required this.revenue,
    required this.email,
  }) : super(
         id: agentID,
         name: name,
         phoneNumber: phoneNumber,
         profilePicture: profilePicture,
         email: email,
       );

  @override
  String toString() {
    return "$phoneNumber $agentID $name";
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'agentID': agentID,
      'name': name,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'listingsIDs': listingsIDs,
      'reviews': reviews,
      'revenue': revenue,
    };
  }

  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      agentID: json['agentID'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      profilePicture: json['profilePicture'],
      listingsIDs: List<String>.from(json['listingsIDs']),
      reviews:
          (json['reviews'] as List<dynamic>)
              .map((review) => Review.fromJson(review))
              .toList(),
      revenue: json['revenue'] as int,
      email: json['email'],
    );
  }

  AgentModel copyWith({
    int? phoneNumber,
    String? agentID,
    String? name,
    String? profilePicture,
    List<String>? listingsIDs,
    List<Review>? reviews,
  }) {
    return AgentModel(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      agentID: agentID ?? this.agentID,
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
      listingsIDs: listingsIDs ?? this.listingsIDs,
      reviews: reviews ?? this.reviews,
      revenue: revenue ?? this.revenue,
      email: email,
    );
  }
}
