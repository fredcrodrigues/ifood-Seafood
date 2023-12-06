import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general/navbar_admin/navbar_admin_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/users/admin/components/modal_deliver/modal_deliver_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'page_admin_orders_widget.dart' show PageAdminOrdersWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageAdminOrdersModel extends FlutterFlowModel<PageAdminOrdersWidget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navbarAdmin component.
  late NavbarAdminModel navbarAdminModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Query cache managers for this widget.

  final _listOrdersPageCacheManager =
      StreamRequestManager<List<OrdersRecord>>();
  Stream<List<OrdersRecord>> listOrdersPageCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<OrdersRecord>> Function() requestFn,
  }) =>
      _listOrdersPageCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearListOrdersPageCacheCache() => _listOrdersPageCacheManager.clear();
  void clearListOrdersPageCacheCacheKey(String? uniqueKey) =>
      _listOrdersPageCacheManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarAdminModel = createModel(context, () => NavbarAdminModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navbarAdminModel.dispose();

    /// Dispose query cache managers for this widget.

    clearListOrdersPageCacheCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
