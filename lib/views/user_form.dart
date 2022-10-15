
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_provide/models/user.dart';
import 'package:learning_provide/provider/users.dart';
import 'package:provider/provider.dart';
class UserForm extends StatelessWidget {
  //late User? user ;
  final _form = GlobalKey <FormState>();
  final Map<String, String> _formData = {};

  UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final   user = ModalRoute.of(context)!.settings.arguments== null ?"NULL":
    ModalRoute.of(context)!.settings.arguments as User;

    print(user);
    return Scaffold(appBar: AppBar(title: Text("User form"),
                              actions: [  IconButton(onPressed: (){
                                final isValid = _form.currentState!.validate();
                                if (isValid) {
                                  _form.currentState!.save();
                                  Provider.of<Users>(context, listen: false).put(
                                      User("",_formData["name"]!, _formData["email"]!, _formData["avatarUrl"]!));
                                  Navigator.of(context).pop();
                                }
                              }, icon: Icon(Icons.save))],

    ),
        body: Padding(padding: EdgeInsets.all(15),
        child: Form(child: Column(children: [
        Center(
          child: CircleAvatar(
          backgroundImage: NetworkImage(
          "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
        ),
           TextFormField(decoration: InputDecoration(labelText:'Nome'),
             validator: (value){

             if (value == null || value.isEmpty) {
               return"Invalid name";
             }
},
             onSaved:(value)=>_formData["name"]=value!,)

          , TextFormField(onSaved: (value)=>_formData["email"]=value!,
            validator: (value){
                if (value == null || value.isEmpty) {
                return"Invalid Email";
                } },
            decoration: InputDecoration(labelText:'Email'),),
          TextFormField(onSaved: (value)=>_formData["avatarUrl"]=value!,
            validator: (value){
              if (value == null || value.isEmpty) {
                return"Invalid vatar";
              } },
            decoration: InputDecoration(labelText:'AvatarUrl'),),
        ],
        ),

        key: _form,),
        ),

    );
  }
}
