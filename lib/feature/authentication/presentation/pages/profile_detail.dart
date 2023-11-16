import 'package:LASYLAB/core/components/styling.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    final screeSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 35,
            color: AppTheme.grayColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: AppTheme.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screeSize.width * .06),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [],
        ),
      ),
    ));
  }
}
