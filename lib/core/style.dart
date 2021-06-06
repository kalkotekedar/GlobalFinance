import 'package:global_finance/import.dart';

const EdgeInsets pagePadding = EdgeInsets.all(10);
const EdgeInsets btnPadding = EdgeInsets.all(16);

appBar() {
  return AppBar(
    title: appText('Hello, Jeremy', color: primaryColor, size: 18),
    iconTheme: IconThemeData(color: primaryColor),
    backgroundColor: Colors.white,
    actions: <Widget>[
      IconButton(
        onPressed: null,
        icon: Icon(Icons.notifications_none, color: primaryColor),
      )
    ],
  );
}

appText(
  String text, {
  Color color = Colors.black,
  double size = 14,
  FontWeight weight = FontWeight.bold,
  TextAlign alignText = TextAlign.start,
}) {
  return Text(
    text,
    textAlign: alignText,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
    ),
  );
}

appElevatedButton(
  String text,
  Function() onTap, {
  Color color = primaryColor,
  Color txtColor = Colors.white,
  EdgeInsetsGeometry padding = btnPadding,
}) {
  return ElevatedButton(
    child: Text(text, style: TextStyle(color: txtColor)),
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      padding: padding,
      primary: color,
      elevation: 0,
    ),
  );
}

appOutlinedButton(String text, Function() onTap) {
  return OutlinedButton(
    child: Text(text),
    onPressed: onTap,
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      side: BorderSide(color: primaryColor),
      padding: btnPadding,
    ),
  );
}

appInputDecoration(String hint) {
  return InputDecoration(
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: .5),
    ),
    labelText: hint,
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    labelStyle: TextStyle(color: Colors.grey),
  );
}
