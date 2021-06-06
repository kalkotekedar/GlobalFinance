import 'package:flutter/services.dart';
import 'package:global_finance/view/signup/pin_screen.dart';

import '../../import.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final List<String> items = <String>['Male', 'Female', 'Other'];
  final _formKey = GlobalKey<FormState>();
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    registerUser() {
      if (_formKey.currentState!.validate()) Get.to(PinScreen());
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: pagePadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    InkWell(
                      child: Icon(Icons.arrow_back_ios_rounded),
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
                Container(height: 150, child: Center(child: appLogo)),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: appInputDecoration(t_first_name),
                        validator: helper.mandatoryTextValidatorName,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: appInputDecoration(t_middle_name),
                        validator: helper.mandatoryTextValidatorName,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: appInputDecoration(t_last_name),
                        validator: helper.mandatoryTextValidatorName,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: appInputDecoration(t_date_birth),
                        validator: helper.mandatoryDate,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
                          LengthLimitingTextInputFormatter(10),
                          CustomDateFormatter(),
                        ],
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: appInputDecoration(t_confirm_pwd),
                        validator: helper.mandatoryTextValidator,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        validator: helper.mandatoryPhoneNumber,
                        decoration: appInputDecoration(t_phone),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: appInputDecoration(t_email),
                        textInputAction: TextInputAction.next,
                        validator: helper.isValidEmail,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: .5,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Row(
                                  children: [
                                    DropdownButton<String>(
                                      icon: SizedBox(),
                                      value: selectedItem,
                                      hint: Container(
                                        alignment: Alignment.centerLeft,
                                        width: 180,
                                        child: appText(
                                          t_gender,
                                          color: Colors.grey,
                                          weight: FontWeight.w400,
                                          size: 16,
                                        ),
                                      ),
                                      onChanged: (String? string) =>
                                          setState(() => selectedItem = string),
                                      selectedItemBuilder:
                                          (BuildContext context) {
                                        return items.map<Widget>((String item) {
                                          return Container(
                                            alignment: Alignment.centerLeft,
                                            width: 180,
                                            child: appText(
                                              item,
                                              size: 16,
                                              weight: FontWeight.w400,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      underline: SizedBox(),
                                      items: items.map((String item) {
                                        return DropdownMenuItem<String>(
                                          child: Text(item),
                                          value: item,
                                        );
                                      }).toList(),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: appElevatedButton(
                              t_create_account,
                              registerUser,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: msg_accept_terms,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: t_terms_condition,
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
