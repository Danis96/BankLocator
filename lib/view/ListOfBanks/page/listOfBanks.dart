import 'package:banklocator/models/bankModel.dart';
import 'package:banklocator/services/bankApi.dart';
import 'package:banklocator/services/getApi.dart';
import 'package:banklocator/services/markerService.dart';
import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view-model/listOfBanks-view-model.dart';
import 'package:banklocator/view/listOfBanks/widgets/bankCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


String bankApi = BankApi().bankApi;
var markers;

class ListOfBanksScreen extends StatelessWidget  {

  final secondaryColor = AppColors().secondaryColor;
  final dominantColor = AppColors().dominantColor;
  final btnColor = AppColors().btnGreen;
  final cardColor = AppColors().cardColor;



  List list = [];
  var finalList = [];
  List<dynamic> fetchedBanks;

  String _selectedItemText = "Our Selection Item";


  @override
  Widget build(BuildContext context) {
    final markerService = MarkerService();


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
            GestureDetector(
              onTap:  () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Container(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                   Container(
                     child: GFSearchBar(
                            searchList: list,
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
                   ),
                    Container(
                        child: FutureBuilder(
                            future: fetchBanks(),
                            builder: (context, snapshot) {

                              if (snapshot.hasData) {

                                markers = markerService.getMarkers(snapshot.data, context);

                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      String bankName = snapshot.data[index]['name'];
                                      list.add(bankName);
                                      String bankAdress = snapshot.data[index]['address'];
                                      list.add(bankAdress);
                                      String type = snapshot.data[index]['type'];
                                      ListOfBanksViewModel().fetchLocations(snapshot.data[index]);

//                                    finalList = [...{...list}];
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
                              return SpinKitThreeBounce(
                                color: Colors.white,
                              );
                            })
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

}

