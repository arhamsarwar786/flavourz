import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/providers/menu_provider.dart';
import '../../widgets.dart';
import '../details_item.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  final searchItems = [];
  final allItems = [];


  @override
  void initState() {    
    super.initState();
    fetchItems();
  }

  fetchItems()async{
    var data =  Provider.of<MenuProvider>(context, listen: false);
    await data.fetchMenu();
    // data.menuProviderList;
    for (var cafe in data.menuProviderList!.cafe!) {
    allItems.add(cafe.toJson());      
    }
    for (var restaurant in data.menuProviderList!.restaurant!) {
    allItems.add(restaurant.toJson());      
    }
   setState(() {
     
   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Search Item"),
      ),
      body: allItems.isEmpty ?const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Column(
          children:[
      
         Container(
        // height: 45,
        child: new Card(
          child: new ListTile(
            leading: new Icon(Icons.search),
            title: new TextField(
              controller: searchController,
              decoration: new InputDecoration(
      
                  hintText: 'Search',
                  border: InputBorder.none),
              onChanged: onSearchTextChanged,
            ),
            trailing: new IconButton(
              icon: new Icon(Icons.cancel),
              onPressed: () {
                searchController.clear();
                onSearchTextChanged('');
              },
            ),
          ),
        ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: searchItems.length,
            itemBuilder: (context,index){
            return  Card(
              child: ListTile(
                onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsItem(item:searchItems[index],)));
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(searchItems[index]['product_image_base64']),
                ),
                title: Text("${searchItems[index]['product_name']}"),
              ),
            );
          })
          ]
        ),
      ),
    );
  }

    onSearchTextChanged(String text) async {
    searchItems.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    allItems.forEach(( itemDetail) {
      if (itemDetail["product_name"].contains(text) ||
          itemDetail["product_description"]!.contains(text)) searchItems.add(itemDetail);
    });
  print(searchItems);

    setState(() {});
  }
}