import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/components/general/nav_client/nav_client_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/users/clients/components/modal_payment_recuse/modal_payment_recuse_widget.dart';
import '/users/clients/components/modal_shop_car_empty/modal_shop_car_empty_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'page_client_payment_page_widget.dart' show PageClientPaymentPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageClientPaymentPageModel
    extends FlutterFlowModel<PageClientPaymentPageWidget> {
  ///  Local state fields for this page.

  bool statePayment = true;

  List<ShopCartRecord> listShopAll = [];
  void addToListShopAll(ShopCartRecord item) => listShopAll.add(item);
  void removeFromListShopAll(ShopCartRecord item) => listShopAll.remove(item);
  void removeAtIndexFromListShopAll(int index) => listShopAll.removeAt(index);
  void insertAtIndexInListShopAll(int index, ShopCartRecord item) =>
      listShopAll.insert(index, item);
  void updateListShopAllAtIndex(int index, Function(ShopCartRecord) updateFn) =>
      listShopAll[index] = updateFn(listShopAll[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navClient component.
  late NavClientModel navClientModel;
  // State field(s) for typeDelivery widget.
  String? typeDeliveryValue1;
  FormFieldController<String>? typeDeliveryValueController1;
  // State field(s) for typeDelivery widget.
  String? typeDeliveryValue2;
  FormFieldController<String>? typeDeliveryValueController2;
  // Stores action output result for [Stripe Payment] action in ButtonBuyCardWeb widget.
  String? paymentId;
  // Stores action output result for [Backend Call - Create Document] action in ButtonBuyCardWeb widget.
  InvoicingRecord? createdInvoicingWeb;
  // Stores action output result for [Backend Call - Create Document] action in ButtonBuyCardWeb widget.
  OrdersRecord? createdOrderWeb;
  // Stores action output result for [Backend Call - Read Document] action in ButtonBuyCardWeb widget.
  ShopCartRecord? currentShopCartWeb;
  // Stores action output result for [Backend Call - Create Document] action in ButtonBuyCardcashWeb widget.
  InvoicingRecord? createdInvoicingcashWeb;
  // Stores action output result for [Backend Call - Create Document] action in ButtonBuyCardcashWeb widget.
  OrdersRecord? createdOrdercashWeb;
  // Stores action output result for [Backend Call - Read Document] action in ButtonBuyCardcashWeb widget.
  ShopCartRecord? currentShopCartcashWeb;
  // State field(s) for typeDelivery widget.
  String? typeDeliveryValue3;
  FormFieldController<String>? typeDeliveryValueController3;
  // State field(s) for typeDelivery widget.
  String? typeDeliveryValue4;
  FormFieldController<String>? typeDeliveryValueController4;
  // Stores action output result for [Stripe Payment] action in ButtonBuyCardMobile widget.
  String? paymentIdMob;
  // Stores action output result for [Backend Call - Create Document] action in ButtonBuyCardMobile widget.
  OrdersRecord? createdOrderMobile;
  // Stores action output result for [Backend Call - Create Document] action in ButtonBuyCardMobile widget.
  InvoicingRecord? createdInvoicingMobile;
  // Stores action output result for [Backend Call - Read Document] action in ButtonBuyCardMobile widget.
  ShopCartRecord? currentShopCartMobile;
  // Stores action output result for [Backend Call - Create Document] action in ButtonBuyCardcashMobile widget.
  OrdersRecord? createdOrdercashMobile;
  // Stores action output result for [Backend Call - Create Document] action in ButtonBuyCardcashMobile widget.
  InvoicingRecord? createdInvoicingcashMobile;
  // Stores action output result for [Backend Call - Read Document] action in ButtonBuyCardcashMobile widget.
  ShopCartRecord? currentShopCartcashMob;

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
