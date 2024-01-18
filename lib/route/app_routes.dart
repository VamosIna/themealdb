class AppRoutes {
  static const String initialRoute = dummyScreen;
  static const String dummyScreen = '/';

  static const String homeScreen = '/home';
  static const String favoriteScreen = '/favorite';
  static const String foodListScreen = '/food-list';
  static const String detailScreen = '/detail';

  /// Dashboard
  static const List<String> dashboardRoutes = [homeScreen, favoriteScreen];
}
