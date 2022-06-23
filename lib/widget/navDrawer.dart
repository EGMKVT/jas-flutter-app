import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_apartchain/model/navigation_item.dart';
import 'package:mobile_apartchain/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  static final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          color: Color(0xFF525C6A),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 130.0,
                child: DrawerHeader(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  decoration: BoxDecoration(
                    color: Color(0xFF525C6A),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SvgPicture.asset(
                                  'assets/icons/header-mobile-logo.svg',
                                  color: Color(0xFFFFE074),
                                  height: 30,
                                  width: 30),
                              flex: 1,
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "APARTCHAIN",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Spacer(
                              flex: 1,
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              child: IconButton(
                                icon: SvgPicture.asset(
                                  'assets/icons/eth-icon.svg',
                                  color: Color(0xFFFF8267),
                                  height: 26,
                                  width: 20,
                                ),
                                color: Colors.white,
                                onPressed: () =>
                                    selectItem(context, NavigationItem.header),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "3,421 ETH",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                onTap: () =>
                                    selectItem(context, NavigationItem.header),
                              ),
                              flex: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                indent: 20,
                thickness: 1,
                color: Colors.white70,
              ),
              Container(
                padding: padding,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    buildMenuItem(
                      context,
                      item: NavigationItem.people,
                      text: 'Sign In',
                      icon: Icons.people,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.favourites,
                      text: 'Home',
                      icon: Icons.favorite_border,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.workflow,
                      text: 'Marketplace',
                      icon: Icons.workspaces_outline,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem01(
                      context,
                      item: NavigationItem.updates,
                      text: 'Support',
                      icon: Icons.update,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              Divider(
                indent: 20,
                thickness: 1,
                color: Colors.white70,
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem(
    BuildContext context, {
    required NavigationItem item,
    required String text,
    required IconData icon,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;

    final color = isSelected ? Colors.orangeAccent : Colors.white;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 16)),
        onTap: () => selectItem(context, item),
      ),
    );
  }

  Widget buildMenuItem01(
    BuildContext context, {
    required NavigationItem item,
    required String text,
    required IconData icon,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;

    final color = isSelected ? Colors.orangeAccent : Colors.white;

    return Material(
      color: Colors.transparent,
      child: ExpansionTile(
        trailing: SizedBox.shrink(),
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 16)),
        children: <Widget>[
          ListTileTheme(
            child: ListTile(
              selected: isSelected,
              leading: Icon(icon, color: color),
              title: Text(text, style: TextStyle(color: color, fontSize: 16)),
              onTap: () => selectItem(context, item),
            ),
          ),
        ],
      ),
    );
  }

  void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }
}

// final String assetName = 'assets/icons/header-mobile-logo.svg';
//
// class _NavDrawerState extends State<NavDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         color: Color(0xFF525C6A),
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 130.0,
//               child: DrawerHeader(
//                 margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
//                 decoration: BoxDecoration(
//                   color: Color(0xFF525C6A),
//                 ),
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: SvgPicture.asset(
//                                 'assets/icons/header-mobile-logo.svg',
//                                 color: Color(0xFFFFE074),
//                                 height: 30,
//                                 width: 30),
//                             flex: 1,
//                           ),
//                           Expanded(
//                             flex: 3,
//                             child: Text(
//                               "APARTCHAIN",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                                 fontSize: 26,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Spacer(flex: 1,),
//                           Spacer(flex: 1,),
//                           Expanded(
//                             child: IconButton(
//                               icon: SvgPicture.asset(
//                                 'assets/icons/eth-icon.svg',
//                                 color: Color(0xFFFF8267),
//                                 height: 26,
//                                 width: 20,
//                               ),
//                               color: Colors.white,
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (BuildContext context) =>
//                                         MyHomePage()));
//                               },
//                             ),
//                             flex: 2,
//                           ),
//                           Expanded(
//                             child: ListTile(
//                               title: Text(
//                                 "3,421 ETH",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 15,
//                                 ),
//                               ),
//                               onTap: () {
//                                 Navigator.of(context).pop();
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (BuildContext context) =>
//                                         MyHomePage()));
//                               },
//                             ),
//                             flex: 5,
//                           ),
//                           Spacer(flex: 1,),
//                           Spacer(flex: 1,)
//
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 "Sign In",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//               leading: IconButton(
//                 icon: SvgPicture.asset(
//                   'assets/icons/header-signin-icon.svg',
//                   color: Colors.white,
//                     height: 30,
//                     width: 30,
//                 ),
//                 color: Colors.white,
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (BuildContext context) => MyHomePage()));
//               },
//             ),
//             Divider(
//               indent: 20,
//               thickness: 1,
//               color: Colors.white,
//             ),
//             ListTile(
//               title: Text(
//                 "Search",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//               leading: IconButton(
//                 icon: SvgPicture.asset(
//                   'assets/icons/sidebar-search-icon.svg',
//                   color: Colors.white,
//                 ),
//                 color: Colors.white,
//                 onPressed: () {},
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (BuildContext context) => search()));
//               },
//             ),
//             ListTile(
//               title: Text(
//                 "Home",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//               leading: IconButton(
//                 icon: SvgPicture.asset(
//                   'assets/icons/home-sidebar-icon.svg',
//                   color: Colors.white,
//                 ),
//                 color: Colors.white,
//                 onPressed: () {},
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (BuildContext context) => MyHomePage()));
//               },
//             ),
//             ListTile(
//               title: Text(
//                 "Marketplace",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//               leading: IconButton(
//                 icon: SvgPicture.asset(
//                   'assets/icons/sidebar-marketplace-icon.svg',
//                   color: Colors.white,
//                 ),
//                 color: Colors.white,
//                 onPressed: () {},
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (BuildContext context) => marketPlace()));
//               },
//             ),
//             ExpansionTile(
//               trailing: SizedBox.shrink(),
//               title: Text(
//                 'Support',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//               leading: IconButton(
//                 icon: SvgPicture.asset(
//                   'assets/icons/sidebar-support-icon.svg',
//                   color: Colors.white,
//                 ),
//                 color: Colors.white,
//                 onPressed: () {},
//               ),
//               children: <Widget>[
//                 ListTileTheme(
//                   contentPadding: EdgeInsets.only(left: 80),
//                   child: ListTile(
//                     title: Text(
//                       "Getting Started",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (BuildContext context) => support()));
//                     },
//                   ),
//                 ),
//                 ListTileTheme(
//                   contentPadding: EdgeInsets.only(left: 80),
//                   child: ListTile(
//                     title: Text(
//                       "Buying",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (BuildContext context) => support()));
//                     },
//                   ),
//                 ),
//                 ListTileTheme(
//                   contentPadding: EdgeInsets.only(left: 80),
//                   child: ListTile(
//                     title: Text(
//                       "Selling",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (BuildContext context) => support()));
//                     },
//                   ),
//                 ),
//                 ListTileTheme(
//                   contentPadding: EdgeInsets.only(left: 80),
//                   child: ListTile(
//                     title: Text(
//                       "Creating",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (BuildContext context) => support()));
//                     },
//                   ),
//                 ),
//                 ListTileTheme(
//                   contentPadding: EdgeInsets.only(left: 80),
//                   child: ListTile(
//                     title: Text(
//                       "FAQ",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (BuildContext context) => support()));
//                     },
//                   ),
//                 ),
//                 ListTileTheme(
//                   contentPadding: EdgeInsets.only(left: 80),
//                   child: ListTile(
//                     title: Text(
//                       "User Safety",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (BuildContext context) => support()));
//                     },
//                   ),
//                 ),
//                 ListTileTheme(
//                   contentPadding: EdgeInsets.only(left: 80),
//                   child: ListTile(
//                     title: Text(
//                       "Partners",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (BuildContext context) => support()));
//                     },
//                   ),
//                 ),
//                 ListTileTheme(
//                   contentPadding: EdgeInsets.only(left: 80),
//                   child: ListTile(
//                     title: Text(
//                       "Developers",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (BuildContext context) => support()));
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             Divider(
//               indent: 20,
//               thickness: 1,
//               color: Colors.white,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
