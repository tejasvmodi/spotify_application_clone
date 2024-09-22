import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_application_clone/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify_application_clone/core/configs/assets/app_images.dart';
import 'package:spotify_application_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_application_clone/core/configs/themes/app_color.dart';
import 'package:spotify_application_clone/presentation/choose_mode/pages/choose_mode.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.introBG),fit: BoxFit.cover)),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(AppVectors.logo)),
                const Spacer(),
                const Text(
                  "Enjoy Listening to Music",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  "Discover new music, dive into endless playlists, and enjoy your favorite songs all in one place. Welcome to Spotify!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                      fontSize: 13),
                ),
                const SizedBox(
                  height: 20,
                ),
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Choosemode(),
                          ));
                    },
                    title: 'Get Startded'),
              ],
            ),
          ),

          // Container(
          //   color: Colors.black.withOpacity(0.15),
          // )
        ],
      ),
    );
  }
}
