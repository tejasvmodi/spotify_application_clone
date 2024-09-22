import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_application_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_application_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_application_clone/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify_application_clone/core/configs/assets/app_images.dart';
import 'package:spotify_application_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_application_clone/presentation/auth/pages/Signin_page.dart';
import 'package:spotify_application_clone/presentation/auth/pages/signup_page.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppVectors.logo),
                    const SizedBox(height: 55),
                    const Text(
                      'Enjoy Listening To Music',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    const Text(
                      'Spotify is a proprietary swedish audio and media services provider',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          
                            child: BasicAppButton(
                                onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder:  (context) => Signup(),));

                                }, title: 'Register')),
                                const SizedBox(width: 20,),
                                Expanded(
                                  flex: 1,
                                  child: TextButton(onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(),));
                                }, child:  Text('Sign In',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: context.isDarkMode ? Colors.white : Colors.black,
                                ),
                                )))
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
