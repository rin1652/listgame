import 'package:flutter/material.dart';

const PAGE_HOME = 1;
const PAGE_SETTING = 2;
const PAGE_SCORE = 3;
const PAGE_LOGIN = 4;
// trang hiện tại
var current_page = PAGE_LOGIN;

var scoreP1 = 0;
var scoreP2 = 0;

const DARKTHEME = 1;
const LIGHTTHEME = 2;
var _tcontrol;
// lưu trạng thái vào dispose
var TOPPICSTATUS = 1;
const Color BEECOLOR = Color(0xFFFFC000);
const USER_NAME = 1;
const PASSWORLD = 2;
const backgroundImage = AssetImage('assets/images/backgroud.png');
const logoBeeText = AssetImage('assets/images/logobeText.png');
const TextStyle fontButon = TextStyle(
    fontFamily: 'Inter',
    color: Colors.black,
    fontSize: 15.0,
    fontWeight: FontWeight.w500);
const TextStyle lblText = TextStyle(
    fontFamily: 'Inter',
    color: Colors.white,
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
    height: 1.8);
const TextStyle lblTextAppbar = TextStyle(
    fontFamily: 'Inter',
    color: Colors.black,
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    height: 1.8);

