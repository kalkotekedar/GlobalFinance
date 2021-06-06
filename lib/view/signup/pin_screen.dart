import '../../import.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  TextEditingController controller = TextEditingController(text: "");
  bool hasError = false, newCreated = false;
  String pinText = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: pagePadding,
          child: Stack(
            children: [
              InkWell(
                child: Icon(Icons.arrow_back_ios_rounded),
                onTap: () => Navigator.pop(context),
              ),
              newCreated
                  ? Column(
                      children: [
                        const SizedBox(height: 100),
                        appText('Account Created',
                            size: 20, weight: FontWeight.w600),
                        const SizedBox(height: 20),
                        appText(
                          'Congratulations. Your account has been created.',
                          weight: FontWeight.w400,
                          size: 12,
                        ),
                        const SizedBox(height: 10),
                        appText(
                          'Please click on the \'Continue\' button to\nget into the app and start taking charge of your finances',
                          alignText: TextAlign.center,
                          weight: FontWeight.w400,
                          size: 12,
                        ),
                        const SizedBox(height: 60),
                        Row(
                          children: [
                            Expanded(
                              child: appElevatedButton(
                                t_continue,
                                () => Get.offAll(DashboardScreen()),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 120, child: Image.asset(img_dial)),
                        const SizedBox(height: 20),
                        appText('Check Your Phone',
                            size: 20, weight: FontWeight.w400),
                        const SizedBox(height: 10),
                        appText(
                          'To confirm your account, enter the 4 digit code send to',
                          weight: FontWeight.w400,
                        ),
                        appText('+1 9020 555 555', weight: FontWeight.w400),
                        const SizedBox(height: 40),
                        PinCodeTextField(
                          controller: controller,
                          onTextChanged: (text) {
                            setState(() {
                              hasError = false;
                            });
                          },
                          pinBoxWidth: 30,
                          pinBoxHeight: 50,
                          pinBoxBorderWidth: 1,
                          pinBoxOuterPadding:
                              EdgeInsets.symmetric(horizontal: 15),
                          hasError: hasError,
                          errorBorderColor: Colors.red,
                          defaultBorderColor: Colors.grey,
                          hasTextBorderColor: primaryColor,
                        ),
                        Visibility(
                            child: SizedBox(height: 10), visible: hasError),
                        Visibility(
                          child: appText(t_incorrect_pin, color: Colors.red),
                          visible: hasError,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: appElevatedButton(
                                t_submit,
                                () {
                                  setState(() {
                                    newCreated = true;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: appElevatedButton(
                                t_resend,
                                () {},
                                color: Colors.grey.shade200,
                                txtColor: Colors.black,
                              ),
                            )
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
