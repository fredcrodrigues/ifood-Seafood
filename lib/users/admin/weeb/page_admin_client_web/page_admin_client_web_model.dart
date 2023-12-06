import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general/navbar_admin/navbar_admin_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/users/admin/components/modal_admin_clien/modal_admin_clien_widget.dart';
import '/users/admin/components/modal_category/modal_category_widget.dart';
import '/users/admin/components/modal_delete/modal_delete_widget.dart';
import '/users/admin/components/modal_update_client_web/modal_update_client_web_widget.dart';
import 'page_admin_client_web_widget.dart' show PageAdminClientWebWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class PageAdminClientWebModel
    extends FlutterFlowModel<PageAdminClientWebWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> userClients = [];
  void addToUserClients(UsersRecord item) => userClients.add(item);
  void removeFromUserClients(UsersRecord item) => userClients.remove(item);
  void removeAtIndexFromUserClients(int index) => userClients.removeAt(index);
  void insertAtIndexInUserClients(int index, UsersRecord item) =>
      userClients.insert(index, item);
  void updateUserClientsAtIndex(int index, Function(UsersRecord) updateFn) =>
      userClients[index] = updateFn(userClients[index]);

  bool isSeacher = true;

  bool closed = true;

  bool isLoad = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in pageAdminClientWeb widget.
  List<UsersRecord>? userCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in pageAdminClientWeb widget.
  List<CategoryClientRecord>? collectionCategory;
  // Model for navbarAdmin component.
  late NavbarAdminModel navbarAdminModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarAdminModel = createModel(context, () => NavbarAdminModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navbarAdminModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
