import 'package:flutter/material.dart';

class widget{

  static appBar (){
    return  AppBar(
        leading: const Icon(Icons.menu_open_rounded),
        title: const Text('Todo'),
        centerTitle: false,
      );
  }
 
}