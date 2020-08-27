

import 'package:banklocator/utils/size_config.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {

  final Color btnColor;
  final String text;
  final Function function;

  BottomButton({this.btnColor, this.text, this.function});


  @override
  Widget build(BuildContext context) {
    return  Container(
        height: SizeConfig.blockSizeHorizontal * 11,
        width: SizeConfig.blockSizeHorizontal * 33.3,
        child: RaisedButton(
          color: btnColor,
          onPressed: () => function(context),
          child: Text(
            text,
            style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 4),
          ),
        ));
  }
}
