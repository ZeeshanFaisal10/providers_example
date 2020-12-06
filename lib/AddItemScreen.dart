import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_example/ItemAddNotifier.dart';

class AddItemScreen extends StatelessWidget {
  AddItemScreen() : super();
  final String title  = "Add Items";


  final TextEditingController _itemController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            TextField(
              controller:  _itemController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                hintText: "Add Item here",
              ),
            ),

            SizedBox(
              height: 20,
            ),

            RaisedButton(
                child: Text("Add Item"),
                onPressed: (){

                  if(_itemController.text.isEmpty){
                    return;
                  }else{
                  Provider.of<ItemAddNotifier>(context,listen: false).addItem(_itemController.text);
                  }
                  Navigator.pop(context);
                })

          ],
        ),
      ),
    );
  }
}
