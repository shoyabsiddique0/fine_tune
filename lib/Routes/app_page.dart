import 'package:fine_tune/Pages/AuthPage/LoginPage/login_binding.dart';
import 'package:fine_tune/Pages/AuthPage/LoginPage/login_screen.dart';
import 'package:fine_tune/Pages/AuthPage/OtpPage/otp_binding.dart';
import 'package:fine_tune/Pages/AuthPage/OtpPage/otp_screen.dart';
import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_binding.dart';
import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_screen.dart';
import 'package:fine_tune/Pages/HomePage/PlaylistPage/playlist_bindng.dart';
import 'package:fine_tune/Pages/HomePage/PlaylistPage/playlist_screen.dart';
import 'package:fine_tune/Pages/HomePage/RecentlyPlayedPage/recently_played_bindng.dart';
import 'package:fine_tune/Pages/HomePage/RecentlyPlayedPage/recently_played_screen.dart';
import 'package:fine_tune/Pages/HomePage/home_binding.dart';
import 'package:fine_tune/Pages/HomePage/home_screen.dart';
import 'package:fine_tune/Pages/LibraryPage/library_binding.dart';
import 'package:fine_tune/Pages/LibraryPage/library_screen.dart';
import 'package:fine_tune/Pages/PlayerPage/player_binding.dart';
import 'package:fine_tune/Pages/PlayerPage/player_screen.dart';
import 'package:fine_tune/Pages/PremiumPage/premium_binding.dart';
import 'package:fine_tune/Pages/PremiumPage/premium_screen.dart';
import 'package:fine_tune/Pages/ProfilePage/EditProfilePage/edit_profile_binding.dart';
import 'package:fine_tune/Pages/ProfilePage/EditProfilePage/edit_profile_screen.dart';
import 'package:fine_tune/Pages/ProfilePage/MyListPage/my_list_bindng.dart';
import 'package:fine_tune/Pages/ProfilePage/MyListPage/my_list_screen.dart';
import 'package:fine_tune/Pages/ProfilePage/profile_binding.dart';
import 'package:fine_tune/Pages/ProfilePage/profile_screen.dart';
import 'package:fine_tune/Pages/SearchPage/search_binding.dart';
import 'package:fine_tune/Pages/SearchPage/search_screen.dart';
import 'package:fine_tune/Routes/app_route.dart';
import 'package:get/get.dart';

class AppPage {
  static final List<GetPage> getPages = [
    GetPage(
        name: AppRoute.loginScreen,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.otpScreen,
        page: () => const OtpScreen(),
        binding: OtpBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.homeScreen,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.searchScreen,
        page: () => const SearchScreen(),
        binding: SearchBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.bottomNavigationScreen,
        page: () => const BottomNavigationScreen(),
        binding: BottomNavigationBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.libraryScreen,
        page: () => const LibraryScreen(),
        binding: LibraryBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.premiumScreen,
        page: () => const PremiumScreen(),
        binding: PremiumBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.profileScreen,
        page: () => const ProfileScreen(),
        binding: ProfileBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.myListScreen,
        page: () => const MyListScreen(),
        binding: MyListBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.editProfileScreen,
        page: () => const EditProfileScreen(),
        binding: EditProfileBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.playlistScreen,
        page: () => const PlaylistScreen(),
        binding: PlaylistBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.playerScreen,
        page: () => const PlayerScreen(),
        binding: PlayerBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: AppRoute.recentlyPlayedScreen,
        page: () => const RecentlyPlayedScreen(),
        binding: RecentlyPlayedBinding(),
        transition: Transition.rightToLeft),
  ];
}
