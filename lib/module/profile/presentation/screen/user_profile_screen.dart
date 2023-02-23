import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videalpha/module/profile/data/model/user_profile_model.dart';
import 'package:videalpha/module/profile/data/repository/user_profile_repository.dart';
import 'package:videalpha/module/profile/presentation/bloc/bloc.dart';
import 'package:videalpha/module/profile/presentation/bloc/state.dart';

import '../bloc/event.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);
  final UserProfileRepository _userProfileRepository = UserProfileRepository();

  @override
  Widget build(BuildContext context) {
    List<UserProfileModel> userList = [];

    return BlocProvider(
      create: (context) => UserProfileBloc(_userProfileRepository)..add(GetUserDetails()),
      child: BlocListener<UserProfileBloc, UserProfileState>(
        listener: (context, state) {
          if (state is ShowUserDetails) {
            userList = state.userDetails.reversed.toList();
          }
        },
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SafeArea(
                  child: userList.isNotEmpty
                      ? ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Semantics(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: ListTile(
                                  title: Text(userList[index].name),
                                  subtitle: Text(userList[index].email),
                                  trailing: Text(userList[index].age),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
