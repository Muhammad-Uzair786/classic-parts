import 'package:com.classic.classicparts/constants.dart';
import 'package:flutter/material.dart';

class Item {
  String title;
  String subtitle;
  String description;
  bool isSelected;

  Item({
    required this.title,
    required this.subtitle,
    required this.description,
    this.isSelected = false,
  });
}

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  List<Item> itemList = [
    Item(title: 'Hassan Road', subtitle: 'Faisalabad', description: 'Note to ride: none'),
    Item(title: 'Anarkali', subtitle: 'Lahore', description: 'Note to rider: none'),
    Item(title: 'Jhang', subtitle: 'paradise city Ali block', description: 'Note to rider: none'),
    Item(title: 'Jhang', subtitle: 'paradise city Ali block', description: 'Note to rider: none'),
    Item(title: 'Jhang', subtitle: 'paradise city Ali block', description: 'Note to rider: none'),
    Item(title: 'Jhang', subtitle: 'paradise city Ali block', description: 'Note to rider: none'),
    Item(title: 'Jhang', subtitle: 'paradise city Ali block', description: 'Note to rider: none'),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.WhiteColor,
        // Set the background color of the AppBar
        elevation: 0,
        // Set the elevation to 0 to remove the shadow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: CustomColor.GradientColor
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 12,
                    color: Colors.black, // Icon color
                  ),
                ),
              ),
            ),
            Text(
              'Addresses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(),
          ],
        ),
      ),

      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.8,
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),

                  child: Card(
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20)

                   ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: CustomColor.GradientColor,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: index,
                            activeColor: CustomColor.WhiteColor,
                            fillColor: MaterialStatePropertyAll(CustomColor.WhiteColor),
                            groupValue: _selectedItemIndex,
                            onChanged: (value) {
                              setState(() {
                                _selectedItemIndex = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  itemList[index].title,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.WhiteColor),
                                ),
                                Text(itemList[index].subtitle,style: CustomColor.StyleWhitenormal,),
                                Text(itemList[index].description,style: CustomColor.StyleWhitenormal,),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Handle delete action
                                  _deleteItem(index);
                                },
                                icon: Icon(Icons.delete,color: CustomColor.WhiteColor,),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Handle edit action
                                  _editItem(index);
                                },
                                icon: Icon(Icons.edit,color: CustomColor.WhiteColor,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(

                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(CustomColor.DarkBlueColor),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(15))

                ),
                onPressed: (){}, child: Text("Add New Address",style: CustomColor.StyleWhitenormal,)),
          )
        ],
      ),
    );
  }

  int _selectedItemIndex = -1;

  void _deleteItem(int index) {
    setState(() {
      itemList.removeAt(index);
      if (_selectedItemIndex == index) {
        _selectedItemIndex = -1;
      }
    });
  }

  void _editItem(int index) {
    // Handle edit action here
    // You can show a dialog or navigate to another screen for editing the item
  }
}

