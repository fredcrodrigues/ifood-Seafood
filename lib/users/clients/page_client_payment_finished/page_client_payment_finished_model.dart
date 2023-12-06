import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general/nav_client/nav_client_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/users/clients/components/modal_shop_car_empty/modal_shop_car_empty_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'page_client_payment_finished_widget.dart'
    show PageClientPaymentFinishedWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageClientPaymentFinishedModel
    extends FlutterFlowModel<PageClientPaymentFinishedWidget> {
  ///  Local state fields for this page.

  OrdersRecord? order;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in pageClientPaymentFinished widget.
  OrdersRecord? orderCollection;
  // Stores action output result for [Backend Call - Read Document] action in pageClientPaymentFinished widget.
  InvoicingRecord? invoicingCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in pageClientPaymentFinished widget.
  List<ShopCartRecord>? collectionShopCart;
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
