import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/details_page.dart';

Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String goodsId = params['id'].first;
    return DetailsPage(goodsId);
  }
);
