import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'image_upload.dart';

class ItemList extends StatefulWidget {
  ItemList({super.key});
  // late Stream<QuerySnapshot> _stream;

  @override
  State<ItemList> createState() => ItemListState();
}

class ItemListState extends State<ItemList> {
  List searchResult = [];

  Future<void> searchFromFirebase() async {
    final result = await FirebaseFirestore.instance.collection('prescription').get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    searchFromFirebase();
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploaded Images'),
      ),
      body : Container(
        child: Column(
          children : [
            Expanded(
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  String url = searchResult[index]['image'];

                  return ListTile(
                    title: SizedBox(
                      height: 80,
                      width: 80,
                      child : Image.network(url),
                    ),
                  );
                },
              ),
            ),
          ]
        ),
      ),
      
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: widget._stream,
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     //Check error
      //     if (snapshot.hasError) {
      //       return Center(child: Text('Some error occurred ${snapshot.error}'));
      //     }

      //     //Check if data arrived
      //     if (snapshot.hasData) {
      //       //get the data
      //       QuerySnapshot querySnapshot = snapshot.data;
      //       List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      //       //Convert the documents to Maps
      //       List<Map> items = documents.map((e) => e.data() as Map).toList();

      //       //Display the list
      //       return ListView.builder(
      //           itemCount: items.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             //Get the item at this index
      //             Map thisItem = items[index];
      //             //REturn the widget for the list items
      //             return ListTile(
      //               // title: Text('${thisItem['name']}'),
      //               // subtitle: Text('${thisItem['quantity']}'),
      //               title: Container(
      //                 height: 80,
      //                 width: 80,
      //                 child: thisItem.containsKey('image-url') ? Image.network(
      //                     '${thisItem['image-url']}') : Container(),
      //               ),
      //               /*onTap: () {
      //                 Navigator.of(context).push(MaterialPageRoute(
      //                     builder: (context) => ItemDetails(thisItem['id'])));
      //               },*/
      //             );
      //           });
      //     }

      //     //Show loader
      //     return Center(child: CircularProgressIndicator());
      //   },
      // ), //Display a list // Add a FutureBuilder
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddItem()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}