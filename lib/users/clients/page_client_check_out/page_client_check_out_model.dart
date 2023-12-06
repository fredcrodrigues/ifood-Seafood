import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general/nav_client/nav_client_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/users/clients/components/modal_shop_car_empty/modal_shop_car_empty_widget.dart';
import '/users/clients/components/modal_shop_cart_clear_add/modal_shop_cart_clear_add_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'page_client_check_out_widget.dart' show PageClientCheckOutWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageClientCheckOutModel
    extends FlutterFlowModel<PageClientCheckOutWidget> {
  ///  Local state fields for this page.

  List<ShopCartRecord> listShopCart = [];
  void addToListShopCart(ShopCartRecord item) => listShopCart.add(item);
  void removeFromListShopCart(ShopCartRecord item) => listShopCart.remove(item);
  void removeAtIndexFromListShopCart(int index) => listShopCart.removeAt(index);
  void insertAtIndexInListShopCart(int index, ShopCartRecord item) =>
      listShopCart.insert(index, item);
  void updateListShopCartAtIndex(
          int index, Function(ShopCartRecord) updateFn) =>
      listShopCart[index] = updateFn(listShopCart[index]);

  double? shopTotal = 0.0;

  double total = 0.0;

  int numberCar = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in pageClientCheckOut widget.
  List<ShopCartRecord>? collectionShopCart;
  // Stores action output result for [Firestore Query - Query a collection] action in pageClientCheckOut widget.
  List<ProductsRecord>? collectionProduct;
  // Model for navClient component.
  late NavClientModel navClientModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navClientModel = createModel(context, () => NavClientModel());
  }

  void dispose() {
    navClientModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
