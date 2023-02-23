import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:videalpha/module/profile/data/model/user_profile_model.dart';

const String kUserData = "userData";

class UserProfileRepository {
  List<UserProfileModel> userDataList = [];

  Future<List<UserProfileModel>> getUserDetails() async {
    final result = await FirebaseFirestore.instance.collection(kUserData).get();
    result.docs.forEach((element) {
      return userDataList.add(UserProfileModel.fromJson(element.data()));
    });
    return userDataList;
  }
}
