import 'package:flutter/material.dart';
import 'package:mobile_apartchain/widget/navDrawer.dart';


class HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("qwerty"),
          centerTitle: true,
        ),
  );

}
