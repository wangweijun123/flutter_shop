import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'router_handler.dart';

class Routes{
  static String root = '/';
  static String detailsPage = '/detail';

  static void configureRoutes(Router router){

    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print('error::: router 没有找到');
      }
    );
    router.define(detailsPage, handler: detailsHandler);
  }

}
