import 'package:new_project/activity_page/activity_page.dart';
import 'package:new_project/ask_page/ask_page.dart';
import 'package:new_project/bottom_tab_bar/bottom_tab_bar.dart';
import 'package:new_project/discover_page/discover_detail/discover_detail.dart';
import 'package:new_project/discover_page/discover_page.dart';
import 'package:new_project/discover_page/search_page/discover_search_page.dart';
import 'package:new_project/home_page/home_detail/detail_msg_list/detail_msg_list.dart';
import 'package:new_project/home_page/home_detail/home_detail.dart';
import 'package:new_project/home_page/home_page.dart';
import 'package:new_project/login_page/login_page.dart';
import 'package:new_project/main.dart';
import 'package:new_project/my_page/my_page.dart';
import 'package:new_project/my_page/my_page_follower/message_page/message_page.dart';
import 'package:new_project/my_page/my_page_follower/my_page_follower.dart';
import 'package:new_project/my_page/my_page_follower/shots_list/shots_list_page.dart';
import 'package:new_project/my_page/setting_profile/dart/setting_profile_page.dart';
import 'package:new_project/router/page_builder.dart';
import 'package:new_project/splash_page/splash_page.dart';

class PageRoutes {
  /// public
  // 根
  static String root = "/";
  // 引导页
  static String splashPage = '/splashPage';
  // 登录页
  static String loginPage = '/loginPage';
  // 询问页
  static String askPage = '/askPage';
  // 底部导航
  static String bottomBar = '/bottomBar';
  // 首页
  static String homePage = '/homePage';
  // 首页详情
  static String homeDetail = '/homeDetail';
  // 首页详情消息列表
  static String detailMsgPage = '/detailMsgPage';
  // Discover
  static String discoverPage = '/discoverPage';
  // DiscoverSearchPage
  static String discoverSearchPage = '/discoverSearchPage';
  // DiscoverDetailPage
  static String discoverDetailPage = '/discoverDetailPage';
  // ActivityPage
  static String activityPage = '/activityPage';
  // MyPage
  static String myPage = '/myPage';
  // MyPageFollower
  static String myPageFollower = '/myPageFollower';
  // MyPageShotsListPage
  static String shotsListPage = '/shotsListPage';
  // MyPageMessagePage
  static String messagePage = '/messagePage';
  // MyPageSettingProfile
  static String settingProfile = '/settingProfile';

  static Map<String, PageBuilder> get pageRoutesMap => {
    // 根
    root: PageBuilder(builder: (bundle) => const RootPage()),
    // 引导页
    splashPage: PageBuilder(builder: (bundle) => const SplashPage()),
    // 登录页
    loginPage: PageBuilder(builder: (bundle) => const LoginPage()),
    // 询问页
    askPage: PageBuilder(builder: (bundle) => const AskPage()),
    // 底部导航
    bottomBar: PageBuilder(builder: (bundle) => const BottomTabBar()),
    // 首页
    homePage: PageBuilder(builder: (bundle) => const HomePage()),
    // 首页详情
    homeDetail: PageBuilder(builder: (bundle) => const HomeDetail()),
    // 详情消息列表
    detailMsgPage: PageBuilder(builder: (bundle) => const DetailMsgListPage()),
    // Discover
    discoverPage: PageBuilder(builder: (bundle) => const DiscoverPage()),
    // DiscoverSearchPage
    discoverSearchPage: PageBuilder(builder: (bundle) => const DiscoverSearchPage()),
    // DiscoverDetailPage
    discoverDetailPage: PageBuilder(builder: (bundle) => const DiscoverDetailPage()),
    // ActivityPage
    activityPage: PageBuilder(builder: (bundle) => const ActivityPage()),
    // MyPage
    myPage: PageBuilder(builder: (bundle) => const MyPage()),
    // MyPageFollower
    myPageFollower: PageBuilder(builder: (bundle) => const MyPageFollower()),
    // MyPageShotsListPage
    shotsListPage: PageBuilder(builder: (bundle) => const ShotsListPage()),
    // MyPageMessagePage
    messagePage: PageBuilder(builder: (bundle) => const MessagePage()),
    // MyPageSettingProfile
    settingProfile: PageBuilder(builder: (bundle) => const SettingProfilePage())
  };
}
