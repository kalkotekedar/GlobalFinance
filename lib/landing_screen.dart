import 'import.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(
            children: [
              Expanded(child: Center(child: appLogo)),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: appElevatedButton(
                          t_open_account,
                          () => Get.to(RegisterScreen()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: appOutlinedButton(
                          t_sign_in,
                          () => Get.to(LoginScreen()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
