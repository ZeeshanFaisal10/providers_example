import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_example/AddItemScreen.dart';
import 'package:providers_example/ItemAddNotifier.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen() : super();


  final String title  = "Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(icon: Icon(Icons.add)
              , onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) {
                  return AddItemScreen();
                }));
              })
        ],
      ),
      body: SingleChildScrollView(
        physics:NeverScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[

            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,

              child: Consumer<ItemAddNotifier>(builder:
              (context,itemAddNotifier,_){
                return ListView.builder(
                    itemCount: itemAddNotifier.itemList.length,
                    itemBuilder: (context , index){
                      return InkWell(
                        onDoubleTap: (){
                          itemAddNotifier.updateItem(index, "ponka");
                        },
                        onLongPress: (){
                          itemAddNotifier.deleteItem(index);
                        },
                        child: Padding(padding: EdgeInsets.all(15),
                        child: Text(
                          itemAddNotifier.itemList[index].itemName,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.orange
                          ),
                        ),),
                      );
                });
              }
              ),
            ),

            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
