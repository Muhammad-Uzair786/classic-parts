import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
import 'package:com.classic.classicparts/models/product_price_list_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/product_detail_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/api_provider.dart';
import '../../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  TextEditingController? _quantityController;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(text: '1');
  }

  @override
  Widget build(BuildContext context) {
    int quantity = int.tryParse(_quantityController!.text) ?? 1;
    var tr= AppLocalizations.of(context);

    return Center(
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  quantity = int.tryParse(_quantityController!.text)!;
                  quantity != 1 ? quantity-- : quantity;
                  _quantityController!.text = quantity.toString();
                });
              },
              child: Icon(Icons.remove_circle_outline),
            ),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(border: Border.all()),
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextField(
                  controller: _quantityController,
                  style: TextStyle(color: CustomColor.BlackColor),
                  maxLength: 4,
                  decoration: InputDecoration(border: InputBorder.none,counterText: ''),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  quantity = int.tryParse(_quantityController!.text)!;
                  quantity++;
                  _quantityController!.text = quantity.toString();
                });
              },
              child: Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _quantityController?.dispose();
    super.dispose();
  }
}



///static


class PriceList extends StatefulWidget {
  const PriceList({super.key});

  @override
  State<PriceList> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<PriceList> {
  @override
  void initState() {
    fetchdata();

    super.initState();
  }

   fetchdata() async {
     await Provider.of<ApiProvider>(context,listen: false).fetchproductpricelist(context);
     print("dataloaded");
   }


  final searchController = TextEditingController();



  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged(String text) {

    setState(() {
      final filterprovider=Provider.of<ApiProvider>(context,listen: false);
      filterprovider.filteredList = text.isEmpty
          ? filterprovider.staticlist
          : filterprovider.staticlist
          .where((item) =>
          item['product_name'].toLowerCase().contains(text.toLowerCase())).toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    final pricelistprovider=Provider.of<ApiProvider>(context,listen: true);
    final rememberMeProvider=Provider.of<RememberMeProvider>(
        context, listen: false);
    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
      body: SafeArea(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: CustomColor.TextFieldColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: searchController,
              cursorColor: CustomColor.BlackColor,
              onChanged: _onSearchTextChanged,
              decoration: InputDecoration(
                hintText: "${tr.search_item}",

                hintStyle: TextStyle(color: CustomColor.TextGreyColor,fontSize: 15),
                border: InputBorder.none,

              ),
            ),
          ),
          Expanded(
           // width: double.infinity,
           // height: MediaQuery.of(context).size.height*.85,
            child: SingleChildScrollView(

              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 30.0,

                columns:  <DataColumn>[
                    DataColumn(
                      label: Center(child: Text('${tr.sr_no}',style: TextStyle(color: CustomColor.BlackColor),)),
                      numeric: false,
                    ),
                  DataColumn(
                    label: Center(child: Text('${tr.code}',style: TextStyle(color: CustomColor.BlackColor),)),
                    numeric: false,
                  ),
                    DataColumn(
                      label: Center(child: Text('${tr.name}',style: TextStyle(color: CustomColor.BlackColor),)),
                    ),
                  DataColumn(
                    label: Center(child: Text('${tr.unit}',style: TextStyle(color: CustomColor.BlackColor),)),
                    numeric: true,
                  ),
                  if(rememberMeProvider.userRoleIndex!='2')
                    DataColumn(
                      label: Center(child: Text('${tr.price}',style: TextStyle(color: CustomColor.BlackColor),)),
                    ),
                    // DataColumn(
                    //   label: SizedBox(
                    //       width: 110,
                    //       child: Text('Quantity',textAlign: TextAlign.center,style: TextStyle(color: CustomColor.BlackColor),)),
                    //   numeric: false,
                    // ),

                  ],
                  rows: List.generate(pricelistprovider.filteredList.length, (index) {
                    final item = pricelistprovider.filteredList[index];
                    print("check${pricelistprovider.filteredList}");
                    return DataRow(
                      cells: [
                        DataCell(Text("${index+1}",style: TextStyle(color: CustomColor.BlackColor),)),
                        DataCell(Text(item['product_code'].toString(),style: TextStyle(color: CustomColor.BlackColor),)),
                        DataCell(Text(item['product_name'],style: TextStyle(color: CustomColor.BlackColor),)),
                        DataCell(Text(item['product_unit'],style: TextStyle(color: CustomColor.BlackColor),)),
                        if(rememberMeProvider.userRoleIndex!='2')
                        DataCell(Text(item['product_price'].toString(),style: TextStyle(color: CustomColor.BlackColor),)),
                        // DataCell(
                        //   CounterWidget(),
                        // ),
                      ],
                      onLongPress: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ProductDetailBody(product_id: item['id']);
                        }));
                      }
                    );
                  }),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}