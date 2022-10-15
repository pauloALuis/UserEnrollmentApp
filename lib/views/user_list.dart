import 'package:flutter/material.dart';
import 'package:learning_provide/components/user_tile.dart';
import 'package:learning_provide/data/dummy_user.dart';
import 'package:learning_provide/models/user.dart';
import 'package:learning_provide/provider/users.dart';
import 'package:learning_provide/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends  StatelessWidget{

  @override
  Widget build(BuildContext context) {
   // final users = Provider.of<Users>(context);//{...DUMMY_USERS};

    final Users users = Provider.of(context);//{...DUMMY_USERS};
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text("List User"),
      actions: [IconButton(onPressed: (){
        //users.put(User("","Teste", "teste@gmail.com", ""));
        Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
      },
          icon: Icon(Icons.add))],
      

      ),body: ListView.builder(
      itemCount: users.count,
      itemBuilder: (context, index) {
        return ListTile(
          title: Card(child:UserTite(users.all.elementAt(index),
           ),)
        );
      },padding: EdgeInsets.all(8),

    ),
    );
  }

}

class Contrainer {
}