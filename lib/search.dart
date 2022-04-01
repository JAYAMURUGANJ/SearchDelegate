import 'package:flutter/material.dart';

import 'Api_service.dart';
import 'HomeScreen.dart';
import 'user_model.dart';

class SearchUser extends SearchDelegate {
  FetchUserList _userList = FetchUserList();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: FutureBuilder<List<Userlist>>(
        future: _userList.getuserList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Userlist>? data = snapshot.data;
          return UserListView(data: data);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: FutureBuilder<List<Userlist>>(
        future: _userList.getuserList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.length == 0) {
            return Center(
              child: Text('No Data Found'),
            );
          }
          List<Userlist>? data = snapshot.data;
          return UserListView(data: data);
        },
      ),
    );
  }
}

class UserListView extends StatelessWidget {
  const UserListView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Userlist>? data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data?.length,
      itemBuilder: (context, index) {
        return UserCard(data: data, index: index);
      },
    );
  }
}
