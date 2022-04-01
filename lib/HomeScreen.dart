import 'package:flutter/material.dart';
import 'package:search_list_api_working/Api_service.dart';
import 'package:search_list_api_working/search.dart';
import 'package:search_list_api_working/user_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FetchUserList _userList = FetchUserList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('UserList'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchUser());
              },
              icon: Icon(Icons.search_sharp),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: FutureBuilder<List<Userlist>>(
              future: _userList.getuserList(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      if (!snapshot.hasData) {
                        List<Userlist> shimmerData = List.generate(
                            10,
                            (index) => Userlist(
                                id: 0,
                                name: '',
                                username: '',
                                email: '',
                                address: Address(
                                    street: '',
                                    suite: '',
                                    city: '',
                                    zipcode: '',
                                    geo: Geo(lat: '', lng: ''))));
                        return UserCard(
                          data: shimmerData,
                          index: index,
                          cardBk: Colors.grey,
                        );
                      }
                      return UserCard(data: data, index: index);
                    });
              }),
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.data,
    required this.index,
    this.cardBk = Colors.white,
  }) : super(key: key);

  final List<Userlist>? data;
  final int index;
  final Color cardBk;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBk,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color.fromARGB(238, 49, 48, 41),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    data?[index].id != 0 ? '${data?[index].id}' : '',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: data?[index].id != 0
                            ? Color.fromARGB(255, 20, 20, 20)
                            : Color.fromARGB(255, 196, 190, 190)),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  '${data?[index].name}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Text(
                  '${data?[index].email}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ])
            ],
          ),
          // trailing: Text('More Info'),
        ),
      ),
    );
  }
}
