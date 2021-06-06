import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import '../../import.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;
  bottomBar() {
    return TitledBottomNavigationBar(
      height: 60,
      currentIndex: selectedIndex,
      indicatorColor: primaryColor,
      activeColor: primaryColor,
      onTap: (index) => setState(() => selectedIndex = index),
      items: [
        TitledNavigationBarItem(
          title: Icon(Icons.home_outlined, color: Colors.grey),
          icon: Icon(Icons.home_outlined),
        ),
        TitledNavigationBarItem(
          title: Icon(Icons.account_balance_outlined, color: Colors.grey),
          icon: Icon(Icons.account_balance_outlined),
        ),
        TitledNavigationBarItem(
          title: Icon(Icons.payments_outlined, color: Colors.grey),
          icon: Icon(Icons.payments_outlined),
        ),
        TitledNavigationBarItem(
          title: Icon(Icons.payment_outlined, color: Colors.grey),
          icon: Icon(Icons.payment_outlined),
        ),
        TitledNavigationBarItem(
          title: Icon(Icons.person_outline, color: Colors.grey),
          icon: Icon(Icons.person_outline),
        ),
      ],
    );
  }

  cardView(Color color, String title, double bal, int action) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: color,
        ),
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.only(top: 15, bottom: 15, right: 10),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText(
                title,
                color: Colors.white,
                weight: FontWeight.w400,
              ),
              const SizedBox(height: 10),
              MoneyView(bal),
              const SizedBox(height: 20),
              if (action == 1)
                ElevatedButton.icon(
                  icon: Text(t_withdrawl_funds,
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                  label: Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    primary: Colors.yellow.shade900,
                    elevation: 0,
                  ),
                ),
              if (action == 2)
                ElevatedButton.icon(
                  icon: Text(t_view_details,
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                  label: Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    primary: Colors.yellow.shade900,
                    elevation: 0,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  cards() {
    return Container(
      height: 220,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          cardView(Colors.red, t_wallet, 540293.45, 1),
          cardView(Colors.yellow.shade700, t_loan, 540293.45, 2),
          cardView(primaryColor, t_investment_ac, 540293.45, 2),
        ],
      ),
    );
  }

  serviceView(String txt, IconData icon, Function fun) {
    return InkWell(
      onTap: () => fun,
      child: Card(
        elevation: .5,
        child: Container(
          height: 120,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: primaryColor.shade400, size: 48),
              const SizedBox(height: 10),
              appText(
                txt,
                size: 10,
                color: Colors.grey,
                weight: FontWeight.w400,
                alignText: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  pageBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        cards(),
        Container(
          padding: pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText(t_services, weight: FontWeight.w400, size: 18),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child:
                        serviceView(t_fund, Icons.data_saver_off_sharp, () {}),
                  ),
                  Expanded(
                    flex: 1,
                    child: serviceView(t_send_money, Icons.money, () {}),
                  ),
                  Expanded(
                    flex: 1,
                    child: serviceView(
                        t_bank_trans, Icons.account_balance_outlined, () {}),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: serviceView(
                        t_loan_request, Icons.clean_hands_outlined, () {}),
                  ),
                  Expanded(
                    flex: 1,
                    child: serviceView(t_airtime, Icons.phone_android, () {}),
                  ),
                  Expanded(
                    flex: 1,
                    child: serviceView(t_cards, Icons.credit_card, () {}),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  logOut() {
    Navigator.of(context).pop();
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(msg_log_out),
            actions: [
              TextButton(
                onPressed: () => Get.offAll(LandingScreen()),
                child: Text(t_ok),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, t_cancel),
                child: Text(t_cancel),
              ),
            ],
          );
        });
  }

  appDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: primaryColor),
            child: Text(
              'Hello,',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(t_log_out),
            onTap: logOut,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        drawer: appDrawer(),
        body: pageBody(),
        bottomNavigationBar: bottomBar(),
      ),
    );
  }
}
