import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learning_provide/models/user.dart';
import 'package:learning_provide/routes/app_routes.dart';

class UserTite extends StatelessWidget {

  final User user;

  const UserTite(this.user,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final avatar = (user.avatarUrl == null || user.avatarUrl.isEmpty)
        ?CircleAvatar(maxRadius: 30,child: Icon(Icons.person),)
        : CircleAvatar(maxRadius: 30,backgroundImage: NetworkImage(user.avatarUrl),);

//------------------------
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(onPressed: (){
              //update the User
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM, arguments: user);
              },
               icon: Icon(Icons.edit,color: Colors.orange,)),
            IconButton(onPressed: (){
              //delete the user
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM, arguments: user);
              },icon: Icon(Icons.delete, color: Colors.red,)),
          ],
        ),
      ),
      autofocus: true ,


    );
  }
}
