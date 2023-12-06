import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/users/clients/components/modal_shop_cart_clear/modal_shop_cart_clear_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'modal_product_details_widget.dart' show ModalProductDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalProductDetailsModel
    extends FlutterFlowModel<ModalProductDetailsWidget> {
  ///  Local state fields for this component.

  double? total = 0.0;

  bool stateModal = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in modalProductDetails widget.
  List<ShopCartRecord>? collectionShop;
  // Stores action output result for [Backend Call - Read Document] action in modalProductDetails widget.
  ProductsRecord? productRead;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for contadorQtd widget.
  int? contadorQtdValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
