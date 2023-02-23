import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videalpha/module/login/bloc/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String userName = "";
  String userAge = "";
  String userEmail = "";

  AuthCubit() : super(AuthInitialState()) {
    User? currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      emit(AuthLoggedInState(currentUser));
    } else {
      emit(AuthLogOutState());
    }
  }

  String? _verificationId;

  void sendOTP({
    required String phoneNumber,
    required String name,
    required String age,
    required String email,
  }) async {
    userName = name;
    userAge = age;
    userEmail = email;
    emit(AuthLoadingState());
    await _firebaseAuth.verifyPhoneNumber(
        verificationCompleted: (phoneAuthCredential) {
          signInWithPhone(phoneAuthCredential);
        },
        verificationFailed: (error) {
          emit(AuthErrorState(error.message.toString()));
        },
        codeSent: (verificationId, forceResendingToken) {
          _verificationId = verificationId;
          emit(AuthCodeSentState());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationId = verificationId;
        },
        phoneNumber: phoneNumber);
  }

  void verifyOTP({required String otp}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: _verificationId!, smsCode: otp);
    signInWithPhone(credential);
  }

  void signInWithPhone(PhoneAuthCredential credential) async {
    try {
      // UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      _firebaseAuth.signInWithCredential(credential).then((value) {
        FirebaseFirestore.instance.collection("userData").doc(value.user?.phoneNumber).set({
          "email": userEmail,
          "age": userAge,
          "name": userName,
          "phone": value.user?.phoneNumber,
        });
      });

      //emit(AuthLoggedInState(userCredential.user!));
    } on FirebaseAuthException catch (ex) {
      emit(AuthErrorState(ex.message.toString()));
    }
  }
}
