import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general/navbar_admin/navbar_admin_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/users/admin/components/modal_detail_order/modal_detail_order_widget.dart';
import '/users/admin/components/modal_pendente/modal_pendente_widget.dart';
import '/users/admin/components/modal_reembolso/modal_reembolso_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'page_admin_invoincing_widget.dart' show PageAdminInvoincingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class PageAdminInvoincingModel
    extends FlutterFlowModel<PageAdminInvoincingWidget> {
  ///  Local state fields for this page.

  bool stateLike = false;

  int? valueReceived;

  int? totalReceived;

  int totalOrders = 0;

  bool loadOrders = false;

  String textReceived = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in pageAdminInvoincing widget.
  List<OrdersRecord>? collectionOrders;
  // Stores action output result for [Firestore Query - Query a collection] action in pageAdminInvoincing widget.
  List<UsersRecord>? collectionUser;
  // Stores action output result for [Firestore Query - Query a collection] action in pageAdminInvoincing widget.
  List<InvoicingRecord>? collectionInvocing;
  // Model for navbarAdmin component.
  late NavbarAdminModel navbarAdminModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  InvoicingRecord? readInvoicing;
  // Stores action output result for [Custom Action - refusedPaymenStripe] action in Button widget.
  int? teste;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarAdminModel = createModel(context, () => NavbarAdminModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navbarAdminModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
