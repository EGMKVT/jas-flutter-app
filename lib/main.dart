import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_apartchain/model/navigation_item.dart';
import 'package:mobile_apartchain/pages/favourites_page.dart';
import 'package:mobile_apartchain/pages/header_page.dart';
import 'package:mobile_apartchain/pages/notifications_page.dart';
import 'package:mobile_apartchain/pages/people_page.dart';
import 'package:mobile_apartchain/pages/plugins_page.dart';
import 'package:mobile_apartchain/pages/updates_page.dart';
import 'package:mobile_apartchain/pages/workflow_page.dart';
import 'package:mobile_apartchain/provider/navigation_provider.dart';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Navigation Drawer';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => NavigationProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.header:
        return HeaderPage();
      case NavigationItem.people:
        return PeoplePage();
      case NavigationItem.favourites:
        return FavouritesPage();
      case NavigationItem.workflow:
        return WorkflowPage();
      case NavigationItem.updates:
        return UpdatesPage();
      case NavigationItem.plugins:
        return PluginsPage();
      case NavigationItem.notifications:
        return NotificationsPage();
    }
  }
}
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Learning',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() {
//     return _MyHomePageState();
//   }
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           iconTheme: IconThemeData(
//             color: Color(0xFF466CA4),
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SvgPicture.asset('assets/icons/header-mobile-logo.svg',
//                   color: Color(0xFF466CA4), height: 30, width: 30),
//               Container(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Text(
//                   "APARTCHAIN",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF466CA4),
//                     fontSize: 26,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//         body: Center(child: Center(child: Text("This is Home page"))),
//         drawer: NavDrawer());
//   }
// }
