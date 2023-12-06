import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general/navbar_admin/navbar_admin_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'page_admin_home_widget.dart' show PageAdminHomeWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class PageAdminHomeModel extends FlutterFlowModel<PageAdminHomeWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> userCollections = [];
  void addToUserCollections(UsersRecord item) => userCollections.add(item);
  void removeFromUserCollections(UsersRecord item) =>
      userCollections.remove(item);
  void removeAtIndexFromUserCollections(int index) =>
      userCollections.removeAt(index);
  void insertAtIndexInUserCollections(int index, UsersRecord item) =>
      userCollections.insert(index, item);
  void updateUserCollectionsAtIndex(
          int index, Function(UsersRecord) updateFn) =>
      userCollections[index] = updateFn(userCollections[index]);

  int? valueOrder = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in pageAdminHome widget.
  List<UsersRecord>? collectionUser;
  // Stores action output result for [Firestore Query - Query a collection] action in pageAdminHome widget.
  List<OrdersRecord>? collectionOrderns;
  // Model for navbarAdmin component.
  late NavbarAdminModel navbarAdminModel;

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
