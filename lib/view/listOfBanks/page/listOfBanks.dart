import 'package:banklocator/repository/bankApi.dart';
import 'package:banklocator/repository/getApi.dart';
import 'package:banklocator/utils/colors.dart';
import 'package:banklocator/utils/size_config.dart';
import 'package:banklocator/view/listOfBanks/widgets/bankCard.dart';
import 'package:flutter/material.dart';
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
     data = fetchBanks();
  }
  
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
            bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: SizeConfig.blockSizeHorizontal * 11,
                    width: SizeConfig.blockSizeHorizontal * 33.3,
                    child: RaisedButton(
                      color: btnColor,
                      onPressed: () => {},
                      child: Text(
                        'My location',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4),
                      ),
                    )),
                Container(
                  height: SizeConfig.blockSizeHorizontal * 11,
                  width: SizeConfig.blockSizeHorizontal * 33.3,
                  child: RaisedButton(
                    color: btnColor,
                    onPressed: () => {},
                    child: Text(
                      'Location',
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4),
                    ),
                  ),
                ),
                Container(
                  height: SizeConfig.blockSizeHorizontal * 11,
                  width: SizeConfig.blockSizeHorizontal * 33.3,
                  child: RaisedButton(
                    color: btnColor,
                    onPressed: () => {},
                    child: Text(
                      'List',
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 4),
                    ),
                  ),
                )
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
                child: FutureBuilder(
                    future: data,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              String bankName = snapshot.data[index]['name'];
                              String bankAdress = snapshot.data[index]['address'];
                              String type = snapshot.data[index]['type'];
                              return bankCard(context, cardColor, bankName,
                                  bankAdress, type);
                            });
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return CircularProgressIndicator();
                    })
            )),
      ),
    );
  }
}
