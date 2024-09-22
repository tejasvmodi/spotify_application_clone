import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_application_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_application_clone/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify_application_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_application_clone/data/models/auth/signin_user_req.dart';
import 'package:spotify_application_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_application_clone/presentation/auth/pages/signup_page.dart';
import 'package:spotify_application_clone/presentation/home/pages/home.dart';
import 'package:spotify_application_clone/service_locator.dart';

class SignIn extends StatelessWidget {
   SignIn({super.key});
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Column(
            children: [
              _resgisterText(),
              const SizedBox(
                height: 50,
              ),
              
              _emailIDField(context),
              const SizedBox(
                height: 20,
              ),
              _passwordField(context),
              const SizedBox(
                height: 20,
              ),
              BasicAppButton(onPressed: () async{
              var result = await s1<SigninUsecaase>().call(
                        parmas: SigninUserReq(
                            email: _username.text.toString(),
                            password: _password.text.toString()));
        
                    result.fold((l) {
                      var snackbar = SnackBar(content: Text(l));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }, (r) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                          (route) => false);
                    });
              }, title: "Sign In")
            ],
          ),
        ),
      ),
    );
  }

  Widget _resgisterText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  // Widget _fullNameField(BuildContext context) {
  //   return TextField(
  //       decoration: const InputDecoration(hintText: 'Full Name')
  //           .applyDefaults(Theme.of(context).inputDecorationTheme));
  // }

  Widget _emailIDField(BuildContext context) {
    return TextField(
      controller: _username,
        decoration: const InputDecoration(hintText: 'Enter Username or Email')
            .applyDefaults(Theme.of(context).inputDecorationTheme));
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
        decoration: const InputDecoration(hintText: 'Password ')
            .applyDefaults(Theme.of(context).inputDecorationTheme));
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Not a Member ?",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup(),));

              },
              child: Text(
                "Register Now",
                style: TextStyle(color: Colors.blue.shade200),
              ))
        ],
      ),
    );
  }
}
