import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

double subtotalListShopCart(List<ShopCartRecord> listShopCart) {
  double valueInit = 0;
  double count = 0;

  for (final shop in listShopCart) {
    count = shop.subTotal + valueInit;
    valueInit = count;
  }

  return count;
}

String converNumberFormatCurrency(double number) {
  var numberConvert = NumberFormat.currency(locale: 'pt_BR', symbol: "R\$");

  double adjustedNumber = number / 100;

  return numberConvert.format(adjustedNumber);
}

DocumentReference? refProduct(
  String name,
  List<TypeOfProductRecord> listTypeCategory,
) {
  DocumentReference? referenceType = null;
  for (final types in listTypeCategory) {
    if (types.type == name) {
      referenceType = types.reference;
    }
  }

  return referenceType;
}

String? nameProduct(
  List<TypeOfProductRecord> listTypeProduct,
  DocumentReference refType,
) {
  String name = "";
  for (final types in listTypeProduct) {
    if (types.reference == refType) {
      name = types.type;
    }
  }

  return name;
}

String productNamed(
  List<ProductsRecord> listProduct,
  DocumentReference? refProduct,
) {
  String name = "";
  for (final product in listProduct) {
    if (product.reference == refProduct) {
      name = product.name;
    }
  }

  return name;
}

double subTotalProduct(
  double qtd,
  double value,
) {
  return qtd * value;
}

String converNumberFormat(double number) {
  var numberConvert = NumberFormat.decimalPattern('pt_BR');

  return numberConvert.format(number);
}

double convertNumberPayment(double number) {
  return number / 100;
}

List<String> listNamedDetails(
  List<DocumentReference> listRefShop,
  DocumentReference refShop,
  String name,
) {
  List<String> details = [];
  for (final ref in listRefShop) {
    if (refShop == ref.id) {
      details.add(name);
    }
  }

  return details;
}

List<ShopCartRecord>? updateStatus(List<ShopCartRecord> listShopCart) {
  //List<ShopCartRecord>? lista = null;
  // Iterate a list of shopCart
  for (var cart in listShopCart) {
    if (cart.finished == false) {}
  }
  return listShopCart;
}

int qtdItemList(
  List<DocumentReference> listRefShop,
  List<ShopCartRecord> listShopCart,
  int index,
) {
  int quantify = 0;
  for (final prod in listShopCart) {
    if (listRefShop[index] == prod.reference) {
      quantify = prod.qtd;
    }
  }
  return quantify;
}

DateTime formatedDat(DateTime date) {
  var formatter = DateFormat('dd/MM/yyyy');
  String formattedDate = formatter.format(date);
  DateTime dataFormatada = formatter.parse(formattedDate);

  return dataFormatada;
}

double? sumInvoicing(List<InvoicingRecord>? listInvoincing) {
  double sum = 0;
  if (listInvoincing != null) {
    for (final value in listInvoincing) {
      sum = sum + value.totalReceived;
    }
  } else {
    sum = 0;
  }

  return sum;
}

double convertNumberProduct(String number) {
  return double.parse(number.replaceAll(RegExp(r'[R$.,]'), ''));
}
