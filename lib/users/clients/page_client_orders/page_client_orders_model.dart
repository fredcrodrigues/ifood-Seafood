import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general/nav_client/nav_client_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/users/admin/components/modal_deliver/modal_deliver_widget.dart';
import '/users/clients/components/modal_shop_car_empty/modal_shop_car_empty_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'page_client_orders_widget.dart' show PageClientOrdersWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageClientOrdersModel extends FlutterFlowModel<PageClientOrdersWidget> {
  ///  Local state fields for this page.

  bool stateLike = false;

  List<OrdersRecord> listOrders = [];
  void addToListOrders(OrdersRecord item) => listOrders.add(item);
  void removeFromListOrders(OrdersRecord item) => listOrders.remove(item);
  void removeAtIndexFromListOrders(int index) => listOrders.removeAt(index);
  void insertAtIndexInListOrders(int index, OrdersRecord item) =>
      listOrders.insert(index, item);
  void updateListOrdersAtIndex(int index, Function(OrdersRecord) updateFn) =>
      listOrders[index] = updateFn(listOrders[index]);

  List<DocumentReference> listShop = [];
  void addToListShop(DocumentReference item) => listShop.add(item);
  void removeFromListShop(DocumentReference item) => listShop.remove(item);
  void removeAtIndexFromListShop(int index) => listShop.removeAt(index);
  void insertAtIndexInListShop(int index, DocumentReference item) =>
      listShop.insert(index, item);
  void updateListShopAtIndex(int index, Function(DocumentReference) updateFn) =>
      listShop[index] = updateFn(listShop[index]);

  String btnState = '';

  int? numberCar = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in pageClientOrders widget.
  List<ShopCartRecord>? collectionShopCart;
  // Stores action output result for [Firestore Query - Query a collection] action in pageClientOrders widget.
  List<OrdersRecord>? ordersList;
  // Model for navClient component.
  late NavClientModel navClientModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navClientModel = createModel(context, () => NavClientModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navClientModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
