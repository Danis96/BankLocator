

import 'package:flutter/material.dart';

class StatusNotifier extends ValueNotifier<String> {
   StatusNotifier(value): super(value);

   changeStatus(String status) {
     value = status;
   }

}