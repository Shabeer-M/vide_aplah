import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:videalpha/constants/app_color.dart';
import 'package:videalpha/constants/app_contants.dart';
import 'package:videalpha/module/login/bloc/auth_cubit.dart';
import 'package:videalpha/module/login/bloc/auth_state.dart';
import 'package:videalpha/module/login/presentation/widget/cover_image_stack.dart';
import 'package:videalpha/module/login/presentation/widget/custom_text_form_field.dart';
import 'package:videalpha/module/otp%20verification/presentation/otp_verify_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNumber = "";
  String countryCode = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Form(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CoverImageStack(
                coverImageHeight: 300,
                //topOffset: coverImageHeight * .75,
                contentPadding: const EdgeInsets.all(30),
                image: Image.network(
                  loginScreenImage,
                  fit: BoxFit.cover,
                ),

                child: _buildForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeaders(),
        _buildTextFormField(),
        IntlPhoneField(
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.tealAccent,
              ),
            ),
          ),
          onChanged: (phone) {
            phoneNumber = phone.completeNumber;
          },
          onCountryChanged: (country) {
            countryCode = country.code;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthCodeSentState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OtpScreen(verificationId: "")),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      print(phoneNumber);
                      print("checl ------------\n $countryCode$phoneNumber");
                      BlocProvider.of<AuthCubit>(context).sendOTP(
                        phoneNumber: phoneNumber,
                        name: nameController.text,
                        age: ageController.text,
                        email: emailController.text,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    child: Text(
                      loginText,
                      style: GoogleFonts.padauk(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).viewInsets.bottom > 60 ? 60 : 0,
        ),
      ],
    );
  }

  Column _buildTextFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        CustomText(
          validator: ((userValue) {
            if (userValue.isEmpty) {
              return 'Please enter Your Name ';
            }
            return null;
          }),
          textinputaction: TextInputAction.next,
          textinputtype: TextInputType.name,
          obscure: false,
          controller: nameController,
          hinttext: "Enter your Name",
          labeltext: 'Name',
        ),
        const SizedBox(
          height: 10,
        ),
        CustomText(
          validator: ((userValue) {
            if (userValue.isEmpty) {
              return 'Please enter Your Age ';
            }
            return null;
          }),
          textinputaction: TextInputAction.next,
          textinputtype: TextInputType.number,
          obscure: false,
          controller: ageController,
          hinttext: "Enter your Age",
          labeltext: 'Age',
        ),
        const SizedBox(
          height: 10,
        ),
        CustomText(
          validator: ((userValue) {
            if (userValue.isEmpty) {
              return 'Please enter Your Email id ';
            }
            return null;
          }),
          textinputaction: TextInputAction.next,
          textinputtype: TextInputType.emailAddress,
          obscure: false,
          controller: emailController,
          hinttext: "Enter your Email ",
          labeltext: 'Email Id',
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Column _buildHeaders() {
    return Column(
      children: [
        Center(
          child: Text(
            loginToVideAlphaTitle,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
