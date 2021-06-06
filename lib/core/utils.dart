import '../import.dart';

RichText appLogo = RichText(
  text: TextSpan(
    text: t_global,
    style: TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w900,
      fontSize: 32,
    ),
    children: const <TextSpan>[
      TextSpan(
        text: t_finance,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 32,
        ),
      ),
    ],
  ),
);
