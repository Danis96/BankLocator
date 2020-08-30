import 'package:banklocator/models/searchModel.dart';
import 'package:banklocator/services/getApi.dart';
import 'package:banklocator/view/ListOfBanks/widgets/bankCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget listOfItems(List<SearchModel> list, Function goToTheMap, Color cardColor) {
  return Container(
      child: FutureBuilder(
          future: fetchBanks(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    String bankName = snapshot.data[index]['name'];
                    list.add(SearchModel(
                        name: snapshot.data[index]['name'],
                        address: snapshot.data[index]['address'],
                        type: snapshot.data[index]['type'],
                        location: snapshot.data[index]['location']));
                    String bankAdress = snapshot.data[index]['address'];
                    String type = snapshot.data[index]['type'];
                    return GestureDetector(
                      onTap: () => goToTheMap(snapshot.data[index], context),
                      child: bankCard(
                          context, cardColor, bankName, bankAdress, type),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return SpinKitThreeBounce(
              color: Colors.white,
            );
          }));
}
