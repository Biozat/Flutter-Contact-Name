import 'package:contact_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  late final TextEditingController _editingController;
  final ContactBook contactBook = ContactBook();
  @override
  void initState(){
    _editingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    _editingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Add Contact"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
               controller: _editingController,
               decoration: const InputDecoration(
                 hintText: "Enter Your Name",
               ),
            ),
            const SizedBox(height: 10,),
            TextButton(
                onPressed: (){
                  final contact = Contact(name: _editingController.text);
                  contactBook.add(contact: contact);
                  Navigator.of(context).pop();
                }, child: const Text("Add Contact")),
          ],
        ),
      ),
    );
  }
}
