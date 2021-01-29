import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: AppContainer(),
      ),
    );
  }
}

class AppContainer extends StatefulWidget {
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final List<String> menuItems = [
    'Home',
    'Blogger',
    'Add New Post',
    'Settings'
  ];

  final List<String> menuIcons = ['home', 'article', 'post_add', 'settings'];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Text('Search Bar'),
                ),
                Container(
                    child: Expanded(
                  child: ListView.builder(
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) => Container(
                      child: Row(
                        children: [
                          Icon(Icons.add),
                          Container(
                            padding: EdgeInsets.all(20.0),
                              child: Text(menuItems[index], style: TextStyle(
                                fontSize: 16.0
                              ))
                          )
                        ],
                      ),
                    ),
                  ),
                )),
                Container(
                  child: Text('Log out'),
                )
              ],
            ))
      ],
    ));
  }
}
