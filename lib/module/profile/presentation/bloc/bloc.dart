import 'package:bloc/bloc.dart';
import 'package:videalpha/module/profile/data/model/user_profile_model.dart';
import 'package:videalpha/module/profile/data/repository/user_profile_repository.dart';

import 'event.dart';
import 'state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserProfileRepository _userProfileRepository;

  UserProfileBloc(this._userProfileRepository) : super(UserProfileInitial()) {
    on<GetUserDetails>(_onFetchUserProfileDetails);
  }

  List<UserProfileModel> userDetailsList = [];

  Future<void> _onFetchUserProfileDetails(GetUserDetails event, Emitter<UserProfileState> emit) async {
    var details = await _userProfileRepository.getUserDetails();
    if (details.isEmpty) {
      userDetailsList = details;
      emit(ShowUserDetails(userDetails: userDetailsList));
    }
  }
}
