import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_application_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_application_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_application_clone/core/configs/assets/app_images.dart';
import 'package:spotify_application_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_application_clone/core/configs/themes/app_color.dart';
import 'package:spotify_application_clone/presentation/home/widgets/news_songs.dart';
import 'package:spotify_application_clone/presentation/home/widgets/play_list.dart';
import 'package:spotify_application_clone/presentation/profile/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          width: 40,
          height: 40,
        ),
        action: IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(),));
        }, icon: const Icon(Icons.person)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _homeArtistCaard(),
            _tabs(),
            SizedBox(
              height: 160,
              child: TabBarView(
                controller: _tabController,
                children: [
                const NewsSongs(),
                Container(),
                Container(),
                Container()
              ],),
            ),
   
            const PlayList(),
          ],
        ),
      ),
    );
  }

  Widget _homeArtistCaard() {
    return Center(
      child: SizedBox(
        height: 188,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(AppVectors.home_top_card),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 60),
              child: Image.asset(AppImages.homeArtist),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _tabs() {
    return Align(
      alignment: Alignment.topLeft,
      child: TabBar(
          labelColor: context.isDarkMode ? Colors.white : Colors.black,
          controller: _tabController,
          isScrollable: true,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 0),
          indicatorColor: AppColors.primary,
          tabs: const [
            Text(
              'News',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Text(
              'Videos',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Text(
              'Artist',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Text(
              'Podcasts',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,overflow: TextOverflow.ellipsis),
            )
          ]),
    );

  }


}
