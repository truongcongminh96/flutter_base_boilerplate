import 'package:flutter/material.dart';
import 'package:flutter_base_structure/models/user.dart';
import 'package:flutter_base_structure/stores/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserList(),
    );
  }
}

class UserList extends StatelessWidget {
  final UserStore store = UserStore();

  UserList() {
    store.getTheUsers();
  }

  @override
  Widget build(BuildContext context) {
    final future = store.userListFuture;
    return Observer(
      builder: (_) {
        final List<User> users = future.result;
        if (store.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                    radius: 25,
                  ),
                  title: Text(
                    user.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    user.email,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  trailing: Text(
                    user.followers.toString(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  Future _refresh() => store.fetchUsers();
}
