import 'package:flutter/material.dart';
import 'package:videalpha/module/profile/data/model/user_profile_model.dart';

@immutable
abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class ShowUserDetails extends UserProfileState {
  final List<UserProfileModel> userDetails;

  ShowUserDetails({
    required this.userDetails,
  });
}
