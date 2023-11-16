import 'package:LASYLAB/core/components/styling.dart';
import 'package:flutter/material.dart';

class PaymentIntroPage extends StatefulWidget {
  const PaymentIntroPage({Key? key}) : super(key: key);

  @override
  _PaymentIntroPageState createState() => _PaymentIntroPageState();
}

class _PaymentIntroPageState extends State<PaymentIntroPage> {
  @override
  Widget build(BuildContext context) {
    final screeSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: screeSize.height * .05),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
