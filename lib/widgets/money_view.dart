import 'package:intl/intl.dart';
import '../import.dart';

class MoneyView extends StatelessWidget {
  final double val;
  const MoneyView(this.val, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.simpleCurrency();
    int start = val.toInt();
    String end = val.toString().split('.')[1];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        appText(
          formatCurrency
              .format(start)
              .replaceAll('.00', '')
              .replaceAll('\$', '\$ '),
          color: Colors.white,
          size: 18,
          weight: FontWeight.w400,
        ),
        appText(
          '.$end',
          color: Colors.white,
          size: 12,
          weight: FontWeight.w400,
        ),
      ],
    );
  }
}
