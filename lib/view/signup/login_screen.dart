import 'package:global_finance/view/signup/pin_screen.dart';

import '../../import.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = '', pin = '';
  bool? rememberMe = false;

  signIn() {
    if (_formKey.currentState!.validate()) Get.to(PinScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.width / 2.5,
                child: appLogo,
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      validator: helper.mandatoryPhoneNumber,
                      decoration: appInputDecoration(t_phone),
                      textInputAction: TextInputAction.next,
                      onChanged: (txt) {
                        phoneNumber = txt;
                        if (txt.length == 10)
                          FocusScope.of(context).nextFocus();
                      },
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: appInputDecoration(t_pin),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      validator: helper.mandatoryPin,
                      onChanged: (txt) {
                        phoneNumber = txt;
                        if (txt.length == 4) FocusScope.of(context).unfocus();
                      },
                      obscureText: true,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 16,
                          width: 16,
                          child: Transform.scale(
                            scale: .7,
                            child: Checkbox(
                              value: rememberMe,
                              onChanged: (s) {
                                setState(() {
                                  rememberMe = s;
                                });
                              },
                              checkColor: Colors.white,
                              activeColor: primaryColor,
                              side: BorderSide(width: .6),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        appText(t_remember, weight: FontWeight.w400),
                        Expanded(child: SizedBox()),
                        TextButton(
                          child: appText(t_forget_pwd, weight: FontWeight.w400),
                          onPressed: null,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: appElevatedButton(
                      t_sign_in,
                      () => signIn(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  appText(t_dont_have_account, weight: FontWeight.w500),
                  TextButton(
                    onPressed: () => Get.to(PinScreen()),
                    style: TextButton.styleFrom(padding: EdgeInsets.all(5)),
                    child: appText(
                      t_sign_up_here,
                      color: primaryColor,
                      weight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
