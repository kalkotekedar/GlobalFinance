import 'import.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: t_app_name,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: primaryColor,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      home: LandingScreen(),
    );
  }
}
