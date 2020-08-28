import 'package:banklocator/repository/bankApi.dart';
import 'package:banklocator/repository/getApi.dart';
import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view-model/home-view-model.dart';
import 'package:banklocator/view-model/listOfBanks-view-model.dart';
import 'package:banklocator/view/HomePage/widgets/bottomButton.dart';
import 'package:banklocator/view/listOfBanks/widgets/bankAddressCard.dart';
import 'package:banklocator/view/listOfBanks/widgets/bankCard.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:http/http.dart' as http;


String bankApi = BankApi().bankApi;

class ListOfBanksScreen extends StatefulWidget {
  @override
  _ListOfBanksScreenState createState() => _ListOfBanksScreenState();
}

class _ListOfBanksScreenState extends State<ListOfBanksScreen> {
  Future data;
  List<dynamic> listaDate;


  final secondaryColor = AppColors().secondaryColor;
  final dominantColor = AppColors().dominantColor;
  final btnColor = AppColors().btnGreen;
  final cardColor = AppColors().cardColor;

  @override
  void initState() {
    super.initState();
//     data = fetchBanks();
  }

  printF(BuildContext context) {
    return print('Danis1');
  }



  List list = [];
  var finalList = [];

  String _selectedItemText = "Our Selection Item";
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
            colors: [secondaryColor, dominantColor],
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
            bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomButton(btnColor: btnColor, text: 'My location',  function: printF),
                BottomButton(btnColor: btnColor, text: 'Location',  function: printF),
                BottomButton(btnColor: btnColor, text: 'List',  function: HomeViewModel().navigateToListOfBanks)
              ],
            ),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.clamp,
                    colors: [secondaryColor, dominantColor],
                  ),
                ),
              ),
              title: Text('Mobile Assignment'),
              centerTitle: true,
            ),
            body:
            Container(
              child: Column(
                children: [
                 GFSearchBar(
                        searchList: finalList,
                        searchQueryBuilder: (query, list) {
                          return list
                              .where((item) =>
                              item.toLowerCase().contains(query.toLowerCase()))
                              .toList();
                        },
                        overlaySearchListItemBuilder: (item) {
                          return Container(
                            color: Colors.transparent,
                            child: Text(
                              item,
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        },
                        onItemSelected: (item) {
                           /// na klik ide na mapu

                        },
                      ),
                  Container(
                      child: FutureBuilder(
                          future: fetchBanks(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    String bankName = snapshot.data[index]['name'];
                                    list.add(bankName);
                                    String bankAdress = snapshot.data[index]['address'];
                                    list.add(bankAdress);
                                    String type = snapshot.data[index]['type'];
                                    finalList = [...{...list}];
                                    return GestureDetector(
                                      /// open details view
                                      onTap: () => ListOfBanksViewModel().navigateToDetailsView(context, snapshot.data[index]),
                                      child: bankCard(context, cardColor, bankName,
                                          bankAdress, type),
                                    );

                                  });
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                            return CircularProgressIndicator();
                          })
                  ),
                ],
              ),
            )),
      ),
    );
  }
}


class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}
