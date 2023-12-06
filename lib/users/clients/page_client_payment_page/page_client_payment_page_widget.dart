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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_client_payment_page_model.dart';
export 'page_client_payment_page_model.dart';

class PageClientPaymentPageWidget extends StatefulWidget {
  const PageClientPaymentPageWidget({
    Key? key,
    required this.totalPayment,
    this.listShopCart,
    this.refUserAdmin,
  }) : super(key: key);

  final double? totalPayment;
  final List<ShopCartRecord>? listShopCart;
  final DocumentReference? refUserAdmin;

  @override
  _PageClientPaymentPageWidgetState createState() =>
      _PageClientPaymentPageWidgetState();
}

class _PageClientPaymentPageWidgetState
    extends State<PageClientPaymentPageWidget> {
  late PageClientPaymentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageClientPaymentPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.statePayment = true;
        _model.listShopAll =
            widget.listShopCart!.toList().cast<ShopCartRecord>();
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 295.0,
                        height: 63.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).black600,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset(
                              'assets/images/camaron.JPG',
                              width: 264.0,
                              height: 155.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(
                          'pageClientHome',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Container(
                        width: 100.0,
                        height: 67.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.home,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 14.0,
                              ),
                              Text(
                                'Inicio',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                      fontSize: 14.0,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 14.0,
                                ),
                              ),
                            ].divide(SizedBox(width: 70.0)),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(
                          'pageClientOrders',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Container(
                        width: 100.0,
                        height: 67.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.food_bank_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0,
                              ),
                              Text(
                                'Pedidos',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                      fontSize: 14.0,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 14.0,
                                ),
                              ),
                            ].divide(SizedBox(width: 40.0)),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (FFAppState().numberCar == 0) {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: ModalShopCarEmptyWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));

                          return;
                        } else {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'pageClientCheckOut',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          return;
                        }
                      },
                      child: Container(
                        width: 100.0,
                        height: 67.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.shopping_cart_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0,
                              ),
                              Text(
                                'Carrinho',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                      fontSize: 14.0,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 14.0,
                                ),
                              ),
                            ].divide(SizedBox(width: 70.0)),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        context.goNamedAuth('pageLogin', context.mounted);
                      },
                      child: Container(
                        width: 100.0,
                        height: 67.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.logout,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0,
                              ),
                              Text(
                                'Sair',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                      fontSize: 14.0,
                                    ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 14.0,
                              ),
                            ].divide(SizedBox(width: 65.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.navClientModel,
                  updateCallback: () => setState(() {}),
                  child: NavClientWidget(),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: double.infinity,
                            height: 307.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: double.infinity,
                                                  child: Stack(
                                                    children: [
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        tablet: false,
                                                        tabletLandscape: false,
                                                        desktop: false,
                                                      ))
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.00, 0.00),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.00,
                                                                      0.00),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Stack(
                                                                              alignment: AlignmentDirectional(0.0, -1.0),
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.00, 0.00),
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 2.0,
                                                                                    shape: const CircleBorder(),
                                                                                    child: Container(
                                                                                      width: 40.0,
                                                                                      height: 40.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).orangeCamaron,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 5.0,
                                                                                            color: Color(0x3416202A),
                                                                                            offset: Offset(0.0, 2.0),
                                                                                          )
                                                                                        ],
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.00, 1.00),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Carrinho',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            fontSize: 10.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.shopping_cart,
                                                                                    color: FlutterFlowTheme.of(context).whiteCamaron,
                                                                                    size: 28.0,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, -1.00),
                                                                              child: Container(
                                                                                height: 40.0,
                                                                                child: Stack(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  children: [
                                                                                    Material(
                                                                                      color: Colors.transparent,
                                                                                      elevation: 2.0,
                                                                                      child: Container(
                                                                                        width: 70.0,
                                                                                        height: 7.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).orangeCamaron,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 5.0,
                                                                                              color: Color(0x3416202A),
                                                                                              offset: Offset(0.0, 2.0),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Stack(
                                                                              alignment: AlignmentDirectional(0.0, -1.0),
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.00, 0.00),
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 2.0,
                                                                                    shape: const CircleBorder(),
                                                                                    child: Container(
                                                                                      width: 40.0,
                                                                                      height: 40.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).orangeCamaron,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 5.0,
                                                                                            color: Color(0x3416202A),
                                                                                            offset: Offset(0.0, 2.0),
                                                                                          )
                                                                                        ],
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.00, -1.00),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.00, 1.00),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      'Pagamentos',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            fontSize: 10.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.add_card,
                                                                                    color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                    size: 28.0,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, -1.00),
                                                                              child: Container(
                                                                                height: 40.0,
                                                                                child: Stack(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  children: [
                                                                                    Material(
                                                                                      color: Colors.transparent,
                                                                                      elevation: 2.0,
                                                                                      child: Container(
                                                                                        width: 70.0,
                                                                                        height: 7.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).whiteCamaron,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 5.0,
                                                                                              color: Color(0x3416202A),
                                                                                              offset: Offset(0.0, 2.0),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Stack(
                                                                                alignment: AlignmentDirectional(0.0, -1.0),
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.00, 0.00),
                                                                                    child: Material(
                                                                                      color: Colors.transparent,
                                                                                      elevation: 2.0,
                                                                                      shape: const CircleBorder(),
                                                                                      child: Container(
                                                                                        width: 40.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).whiteCamaron,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 5.0,
                                                                                              color: Color(0x3416202A),
                                                                                              offset: Offset(0.0, 2.0),
                                                                                            )
                                                                                          ],
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.00, 0.00),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        'Finalização',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              fontSize: 10.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.check_sharp,
                                                                                      color: FlutterFlowTheme.of(context).orangeCamaron,
                                                                                      size: 28.0,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                      ))
                                                        Container(
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Stack(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 2.0,
                                                                                shape: const CircleBorder(),
                                                                                child: Container(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).orangeCamaron,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 5.0,
                                                                                        color: Color(0x3416202A),
                                                                                        offset: Offset(0.0, 2.0),
                                                                                      )
                                                                                    ],
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.00, -1.00),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 1.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'Carrinho',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.shopping_cart,
                                                                                color: FlutterFlowTheme.of(context).whiteCamaron,
                                                                                size: 32.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.00,
                                                                              -1.00),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                Stack(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 2.0,
                                                                                    child: Container(
                                                                                      width: 200.0,
                                                                                      height: 7.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).orangeCamaron,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 5.0,
                                                                                            color: Color(0x3416202A),
                                                                                            offset: Offset(0.0, 2.0),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Stack(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 0.00),
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 2.0,
                                                                                shape: const CircleBorder(),
                                                                                child: Container(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).orangeCamaron,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 5.0,
                                                                                        color: Color(0x3416202A),
                                                                                        offset: Offset(0.0, 2.0),
                                                                                      )
                                                                                    ],
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  alignment: AlignmentDirectional(0.00, -1.00),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.00, 1.00),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'Pagamento',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.add_card,
                                                                                color: FlutterFlowTheme.of(context).whiteCamaron,
                                                                                size: 32.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.00,
                                                                              -1.00),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                Stack(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 2.0,
                                                                                    child: Container(
                                                                                      width: 200.0,
                                                                                      height: 7.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).whiteCamaron,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 5.0,
                                                                                            color: Color(0x3416202A),
                                                                                            offset: Offset(0.0, 2.0),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.00,
                                                                              0.00),
                                                                          child:
                                                                              Stack(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 2.0,
                                                                                  shape: const CircleBorder(),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).whiteCamaron,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 5.0,
                                                                                          color: Color(0x3416202A),
                                                                                          offset: Offset(0.0, 2.0),
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.00, 0.00),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'Finalização',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.check,
                                                                                  color: FlutterFlowTheme.of(context).orangeCamaron,
                                                                                  size: 32.0,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tabletLandscape: false,
                                        ))
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Container(
                                                      width: 307.0,
                                                      height: 94.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        border: Border.all(
                                                          color:
                                                              Color(0x85B5B5B5),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons.place,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .orangeCamaron,
                                                                  size: 24.0,
                                                                ),
                                                                Text(
                                                                  'Entrega',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 10.0)),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Rua general Arthur de carvalho',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        'São luis Ma',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Container(
                                                      width: 307.0,
                                                      height: 94.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        border: Border.all(
                                                          color:
                                                              Color(0x85B5B5B5),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .shopping_bag_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .orangeCamaron,
                                                                  size: 24.0,
                                                                ),
                                                                Text(
                                                                  'Retirada',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 10.0)),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Rua Agentina ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        'São luis Ma',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 30.0)),
                                              ),
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          desktop: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 20.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Container(
                                                    width: 307.0,
                                                    height: 84.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            Color(0x85B5B5B5),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .shopping_bag_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .orangeCamaron,
                                                                size: 24.0,
                                                              ),
                                                              Text(
                                                                'Retirada',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Rua Agentina ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      'São luis Ma',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Container(
                                                    width: 307.0,
                                                    height: 84.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            Color(0x85B5B5B5),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons.place,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .orangeCamaron,
                                                                size: 24.0,
                                                              ),
                                                              Text(
                                                                'Entrega',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Rua general Arthur de carvalho',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      'São luis Ma',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 5.0)),
                                            ),
                                          ),
                                      ].divide(SizedBox(height: 2.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 330.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tabletLandscape: false,
                            ))
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 5.0, 10.0, 5.0),
                                  child: Container(
                                    width: 474.0,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .typeDeliveryValueController1 ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: [
                                                      'Delivery',
                                                      'Retirada'
                                                    ],
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .typeDeliveryValue1 =
                                                            val),
                                                    width: 300.0,
                                                    height: 50.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    hintText: 'Tipo de entrega',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Color(0x85B5B5B5),
                                                    borderWidth: 0.0,
                                                    borderRadius: 10.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                    hidesUnderline: true,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        setState(() {
                                                          _model.statePayment =
                                                              false;
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 289.0,
                                                        height: 53.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          border: Border.all(
                                                            color: Color(
                                                                0x85B5B5B5),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .payment_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .orangeCamaron2,
                                                                  size: 20.0,
                                                                ),
                                                                Text(
                                                                  'Pagar com cartão ',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            10.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 10.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        setState(() {
                                                          _model.statePayment =
                                                              true;
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 289.0,
                                                        height: 53.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          border: Border.all(
                                                            color: Color(
                                                                0x85B5B5B5),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .monetization_on_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .orangeCamaron2,
                                                                  size: 20.0,
                                                                ),
                                                                Text(
                                                                  'Pagar com dinheiro',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            10.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 10.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Wrap(
                                              spacing: 0.0,
                                              runSpacing: 0.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .typeDeliveryValueController2 ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: [
                                                      'Delivery',
                                                      'Retirada'
                                                    ],
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .typeDeliveryValue2 =
                                                            val),
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    hintText: 'Tipo de entrega',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Color(0x85B5B5B5),
                                                    borderWidth: 0.0,
                                                    borderRadius: 10.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                    hidesUnderline: true,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        setState(() {
                                                          _model.statePayment =
                                                              false;
                                                        });
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          border: Border.all(
                                                            color: Color(
                                                                0x85B5B5B5),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      1.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .payment_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .orangeCamaron2,
                                                                    size: 20.0,
                                                                  ),
                                                                  Text(
                                                                    'Pagar com cartão ',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        setState(() {
                                                          _model.statePayment =
                                                              true;
                                                        });
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          border: Border.all(
                                                            color: Color(
                                                                0x85B5B5B5),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .monetization_on_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .orangeCamaron2,
                                                                  size: 20.0,
                                                                ),
                                                                Text(
                                                                  'Pagar com dinheiro',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            10.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 10.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        Flexible(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0x5CE52500),
                                                          width: 0.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tabletLandscape:
                                                                  false,
                                                            ))
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Entrega Padrão',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .help_rounded,
                                                                      color: Color(
                                                                          0x69AFAFAF),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tabletLandscape:
                                                                  false,
                                                            ))
                                                              Text(
                                                                'Hoje, 40 - 50 min',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                              ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tabletLandscape:
                                                                  false,
                                                            ))
                                                              Text(
                                                                'Taxa de entrega',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .orangeCamaron,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              tablet: false,
                                                              desktop: false,
                                                            ))
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.00,
                                                                        0.00),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Total a pagar: ${valueOrDefault<String>(
                                                                      formatNumber(
                                                                        functions
                                                                            .convertNumberPayment(widget.totalPayment!),
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            'R\$ ###.##',
                                                                        locale:
                                                                            'BR',
                                                                      ),
                                                                      '0',
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xBAE52500),
                                                                          fontSize:
                                                                              18.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ].divide(SizedBox(
                                                              height: 5.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (!_model.statePayment)
                                              Expanded(
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    final paymentResponse =
                                                        await processStripePayment(
                                                      context,
                                                      amount: widget
                                                          .totalPayment!
                                                          .round(),
                                                      currency: 'BRL',
                                                      customerEmail:
                                                          currentUserEmail,
                                                      customerName:
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.name,
                                                              ''),
                                                      description:
                                                          'Pagamento no Cartão',
                                                      allowGooglePay: false,
                                                      allowApplePay: false,
                                                      themeStyle:
                                                          ThemeMode.light,
                                                    );
                                                    if (paymentResponse
                                                                .paymentId ==
                                                            null &&
                                                        paymentResponse
                                                                .errorMessage !=
                                                            null) {
                                                      showSnackbar(
                                                        context,
                                                        'Error: ${paymentResponse.errorMessage}',
                                                      );
                                                    }
                                                    _model.paymentId =
                                                        paymentResponse
                                                                .paymentId ??
                                                            '';

                                                    if (_model.paymentId !=
                                                        '') {
                                                      if (_model.paymentId !=
                                                          '0') {
                                                        var invoicingRecordReference =
                                                            InvoicingRecord
                                                                .collection
                                                                .doc();
                                                        await invoicingRecordReference
                                                            .set(
                                                                createInvoicingRecordData(
                                                          totalReceived: widget
                                                              .totalPayment,
                                                          time:
                                                              getCurrentTimestamp,
                                                          typePayment: 'Cartão',
                                                          idpayment:
                                                              _model.paymentId,
                                                          fkUser:
                                                              currentUserReference,
                                                          fkUserAdmin: widget
                                                              .refUserAdmin,
                                                          finished: true,
                                                        ));
                                                        _model.createdInvoicingWeb =
                                                            InvoicingRecord
                                                                .getDocumentFromData(
                                                                    createInvoicingRecordData(
                                                                      totalReceived:
                                                                          widget
                                                                              .totalPayment,
                                                                      time:
                                                                          getCurrentTimestamp,
                                                                      typePayment:
                                                                          'Cartão',
                                                                      idpayment:
                                                                          _model
                                                                              .paymentId,
                                                                      fkUser:
                                                                          currentUserReference,
                                                                      fkUserAdmin:
                                                                          widget
                                                                              .refUserAdmin,
                                                                      finished:
                                                                          true,
                                                                    ),
                                                                    invoicingRecordReference);

                                                        var ordersRecordReference =
                                                            OrdersRecord
                                                                .collection
                                                                .doc();
                                                        await ordersRecordReference
                                                            .set({
                                                          ...createOrdersRecordData(
                                                            status: 'aceito',
                                                            orderValue: widget
                                                                .totalPayment,
                                                            numOrder:
                                                                valueOrDefault<
                                                                    int>(
                                                              random_data
                                                                  .randomInteger(
                                                                      0, 100),
                                                              0,
                                                            ),
                                                            dateHourOrder:
                                                                getCurrentTimestamp,
                                                            fkUser:
                                                                currentUserReference,
                                                            typeDelivery:
                                                                valueOrDefault<
                                                                    String>(
                                                              _model
                                                                  .typeDeliveryValue1,
                                                              'Entrega',
                                                            ),
                                                            typePayment:
                                                                'cartão',
                                                            fkUserAdmin: widget
                                                                .refUserAdmin,
                                                            fkInvoincing: _model
                                                                .createdInvoicingWeb
                                                                ?.reference,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'shopCart': widget
                                                                  .listShopCart
                                                                  ?.map((e) => e
                                                                      .reference)
                                                                  .toList(),
                                                            },
                                                          ),
                                                        });
                                                        _model.createdOrderWeb =
                                                            OrdersRecord
                                                                .getDocumentFromData({
                                                          ...createOrdersRecordData(
                                                            status: 'aceito',
                                                            orderValue: widget
                                                                .totalPayment,
                                                            numOrder:
                                                                valueOrDefault<
                                                                    int>(
                                                              random_data
                                                                  .randomInteger(
                                                                      0, 100),
                                                              0,
                                                            ),
                                                            dateHourOrder:
                                                                getCurrentTimestamp,
                                                            fkUser:
                                                                currentUserReference,
                                                            typeDelivery:
                                                                valueOrDefault<
                                                                    String>(
                                                              _model
                                                                  .typeDeliveryValue1,
                                                              'Entrega',
                                                            ),
                                                            typePayment:
                                                                'cartão',
                                                            fkUserAdmin: widget
                                                                .refUserAdmin,
                                                            fkInvoincing: _model
                                                                .createdInvoicingWeb
                                                                ?.reference,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'shopCart': widget
                                                                  .listShopCart
                                                                  ?.map((e) => e
                                                                      .reference)
                                                                  .toList(),
                                                            },
                                                          ),
                                                        }, ordersRecordReference);
                                                        setState(() {
                                                          FFAppState()
                                                                  .contador =
                                                              widget
                                                                  .listShopCart!
                                                                  .length;
                                                        });
                                                        setState(() {
                                                          FFAppState()
                                                                  .contador =
                                                              FFAppState()
                                                                      .contador +
                                                                  -1;
                                                        });
                                                        while (FFAppState()
                                                                .contador >=
                                                            0) {
                                                          _model.currentShopCartWeb =
                                                              await ShopCartRecord.getDocumentOnce(widget
                                                                  .listShopCart![
                                                                      FFAppState()
                                                                          .contador]
                                                                  .reference);

                                                          await _model
                                                              .currentShopCartWeb!
                                                              .reference
                                                              .update(
                                                                  createShopCartRecordData(
                                                            finished: true,
                                                          ));
                                                          setState(() {
                                                            _model.removeFromListShopAll(
                                                                widget.listShopCart![
                                                                    FFAppState()
                                                                        .contador]);
                                                          });
                                                          setState(() {
                                                            FFAppState()
                                                                    .contador =
                                                                FFAppState()
                                                                        .contador +
                                                                    -1;
                                                          });
                                                        }

                                                        context.goNamed(
                                                          'pageClientPaymentFinished',
                                                          queryParameters: {
                                                            'refInvoicing':
                                                                serializeParam(
                                                              _model
                                                                  .createdInvoicingWeb
                                                                  ?.reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'refOrder':
                                                                serializeParam(
                                                              _model
                                                                  .createdOrderWeb
                                                                  ?.reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      } else {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    ModalPaymentRecuseWidget(),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }
                                                    } else {
                                                      context.pushNamed(
                                                        'pageClientPaymentPage',
                                                        queryParameters: {
                                                          'totalPayment':
                                                              serializeParam(
                                                            widget.totalPayment,
                                                            ParamType.double,
                                                          ),
                                                          'listShopCart':
                                                              serializeParam(
                                                            widget.listShopCart,
                                                            ParamType.Document,
                                                            true,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'listShopCart': widget
                                                              .listShopCart,
                                                        },
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: 'Pagar com cartão',
                                                  options: FFButtonOptions(
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            if (_model.statePayment)
                                              Expanded(
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    var invoicingRecordReference =
                                                        InvoicingRecord
                                                            .collection
                                                            .doc();
                                                    await invoicingRecordReference
                                                        .set(
                                                            createInvoicingRecordData(
                                                      order: _model
                                                          .createdOrdercashMobile
                                                          ?.reference,
                                                      totalReceived:
                                                          widget.totalPayment,
                                                      time: getCurrentTimestamp,
                                                      typePayment: 'dinheiro',
                                                      idpayment: '0',
                                                      fkUser:
                                                          currentUserReference,
                                                      fkUserAdmin:
                                                          widget.refUserAdmin,
                                                      finished: false,
                                                    ));
                                                    _model.createdInvoicingcashWeb =
                                                        InvoicingRecord
                                                            .getDocumentFromData(
                                                                createInvoicingRecordData(
                                                                  order: _model
                                                                      .createdOrdercashMobile
                                                                      ?.reference,
                                                                  totalReceived:
                                                                      widget
                                                                          .totalPayment,
                                                                  time:
                                                                      getCurrentTimestamp,
                                                                  typePayment:
                                                                      'dinheiro',
                                                                  idpayment:
                                                                      '0',
                                                                  fkUser:
                                                                      currentUserReference,
                                                                  fkUserAdmin:
                                                                      widget
                                                                          .refUserAdmin,
                                                                  finished:
                                                                      false,
                                                                ),
                                                                invoicingRecordReference);

                                                    var ordersRecordReference =
                                                        OrdersRecord.collection
                                                            .doc();
                                                    await ordersRecordReference
                                                        .set({
                                                      ...createOrdersRecordData(
                                                        status: 'aceito',
                                                        orderValue:
                                                            widget.totalPayment,
                                                        numOrder:
                                                            valueOrDefault<int>(
                                                          random_data
                                                              .randomInteger(
                                                                  0, 100),
                                                          0,
                                                        ),
                                                        fkUser:
                                                            currentUserReference,
                                                        typeDelivery: _model
                                                            .typeDeliveryValue3,
                                                        typePayment: 'dinheiro',
                                                        fkUserAdmin:
                                                            widget.refUserAdmin,
                                                        dateHourOrder:
                                                            getCurrentTimestamp,
                                                        fkInvoincing: _model
                                                            .createdInvoicingcashWeb
                                                            ?.reference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'shopCart': widget
                                                              .listShopCart
                                                              ?.map((e) =>
                                                                  e.reference)
                                                              .toList(),
                                                        },
                                                      ),
                                                    });
                                                    _model.createdOrdercashWeb =
                                                        OrdersRecord
                                                            .getDocumentFromData({
                                                      ...createOrdersRecordData(
                                                        status: 'aceito',
                                                        orderValue:
                                                            widget.totalPayment,
                                                        numOrder:
                                                            valueOrDefault<int>(
                                                          random_data
                                                              .randomInteger(
                                                                  0, 100),
                                                          0,
                                                        ),
                                                        fkUser:
                                                            currentUserReference,
                                                        typeDelivery: _model
                                                            .typeDeliveryValue3,
                                                        typePayment: 'dinheiro',
                                                        fkUserAdmin:
                                                            widget.refUserAdmin,
                                                        dateHourOrder:
                                                            getCurrentTimestamp,
                                                        fkInvoincing: _model
                                                            .createdInvoicingcashWeb
                                                            ?.reference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'shopCart': widget
                                                              .listShopCart
                                                              ?.map((e) =>
                                                                  e.reference)
                                                              .toList(),
                                                        },
                                                      ),
                                                    }, ordersRecordReference);
                                                    setState(() {
                                                      FFAppState().contador =
                                                          widget.listShopCart!
                                                              .length;
                                                    });
                                                    setState(() {
                                                      FFAppState().contador =
                                                          FFAppState()
                                                                  .contador +
                                                              -1;
                                                    });
                                                    while (
                                                        FFAppState().contador >=
                                                            0) {
                                                      _model.currentShopCartcashWeb =
                                                          await ShopCartRecord
                                                              .getDocumentOnce(
                                                                  widget
                                                                      .listShopCart![
                                                                          valueOrDefault<
                                                                              int>(
                                                        FFAppState().contador,
                                                        0,
                                                      )]
                                                                      .reference);

                                                      await widget
                                                          .listShopCart![
                                                              FFAppState()
                                                                  .contador]
                                                          .reference
                                                          .update(
                                                              createShopCartRecordData(
                                                        finished: true,
                                                      ));
                                                      setState(() {
                                                        _model.removeFromListShopAll(
                                                            widget.listShopCart![
                                                                FFAppState()
                                                                    .contador]);
                                                      });
                                                      setState(() {
                                                        FFAppState().contador =
                                                            FFAppState()
                                                                    .contador +
                                                                -1;
                                                      });
                                                    }
                                                    if (Navigator.of(context)
                                                        .canPop()) {
                                                      context.pop();
                                                    }
                                                    context.pushNamed(
                                                      'pageClientPaymentFinished',
                                                      queryParameters: {
                                                        'refInvoicing':
                                                            serializeParam(
                                                          _model
                                                              .createdInvoicingcashWeb
                                                              ?.reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'refOrder':
                                                            serializeParam(
                                                          _model
                                                              .createdOrdercashWeb
                                                              ?.reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'listShop':
                                                            serializeParam(
                                                          widget.listShopCart,
                                                          ParamType.Document,
                                                          true,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'listShop':
                                                            widget.listShopCart,
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );

                                                    setState(() {});
                                                  },
                                                  text: 'Pagar com dinheiro',
                                                  options: FFButtonOptions(
                                                    height: 50.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              tablet: false,
                              desktop: false,
                            ))
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 5.0, 10.0, 5.0),
                                  child: Container(
                                    width: 474.0,
                                    height: 509.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tabletLandscape: false,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .typeDeliveryValueController3 ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options: [
                                                        'Delivery',
                                                        'Retirada'
                                                      ],
                                                      onChanged: (val) =>
                                                          setState(() => _model
                                                                  .typeDeliveryValue3 =
                                                              val),
                                                      width: 300.0,
                                                      height: 50.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      hintText:
                                                          'Tipo de entrega',
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Color(0x85B5B5B5),
                                                      borderWidth: 0.0,
                                                      borderRadius: 10.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  16.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            _model.statePayment =
                                                                false;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 289.0,
                                                          height: 53.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x85B5B5B5),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .payment_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .orangeCamaron2,
                                                                    size: 20.0,
                                                                  ),
                                                                  Text(
                                                                    'Pagar com cartão ',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            _model.statePayment =
                                                                true;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 289.0,
                                                          height: 53.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x85B5B5B5),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .monetization_on_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .orangeCamaron2,
                                                                    size: 20.0,
                                                                  ),
                                                                  Text(
                                                                    'Pagar com dinheiro',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          if (responsiveVisibility(
                                            context: context,
                                            tablet: false,
                                            desktop: false,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: Wrap(
                                                spacing: 0.0,
                                                runSpacing: 0.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .typeDeliveryValueController4 ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options: [
                                                        'Delivery',
                                                        'Retirada'
                                                      ],
                                                      onChanged: (val) =>
                                                          setState(() => _model
                                                                  .typeDeliveryValue4 =
                                                              val),
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      hintText:
                                                          'Tipo de entrega',
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Color(0x85B5B5B5),
                                                      borderWidth: 0.0,
                                                      borderRadius: 10.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  16.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            _model.statePayment =
                                                                false;
                                                          });
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x85B5B5B5),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        1.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .payment_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .orangeCamaron2,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    Text(
                                                                      'Pagar com cartão ',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                10.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            _model.statePayment =
                                                                true;
                                                          });
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x85B5B5B5),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .monetization_on_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .orangeCamaron2,
                                                                    size: 20.0,
                                                                  ),
                                                                  Text(
                                                                    'Pagar com dinheiro',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0x88E52500),
                                                          width: 0.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tabletLandscape:
                                                                  false,
                                                            ))
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Entrega Padrão',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .help_rounded,
                                                                      color: Color(
                                                                          0x69AFAFAF),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tabletLandscape:
                                                                  false,
                                                            ))
                                                              Text(
                                                                'Hoje, 40 - 50 min',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                              ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tabletLandscape:
                                                                  false,
                                                            ))
                                                              Text(
                                                                'Taxa de entrega',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .orangeCamaron,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              tablet: false,
                                                              desktop: false,
                                                            ))
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.00,
                                                                        0.00),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Total a pagar: ${valueOrDefault<String>(
                                                                      formatNumber(
                                                                        functions
                                                                            .convertNumberPayment(widget.totalPayment!),
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            'R\$ ###.##',
                                                                        locale:
                                                                            'BR',
                                                                      ),
                                                                      '0',
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xBAE52500),
                                                                          fontSize:
                                                                              18.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ].divide(SizedBox(
                                                              height: 5.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (!_model.statePayment)
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      final paymentResponse =
                                                          await processStripePayment(
                                                        context,
                                                        amount: widget
                                                            .totalPayment!
                                                            .round(),
                                                        currency: 'BRL',
                                                        customerEmail:
                                                            currentUserEmail,
                                                        customerName:
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.name,
                                                                ''),
                                                        description:
                                                            'Pagamento no Cartão',
                                                        allowGooglePay: false,
                                                        allowApplePay: false,
                                                        themeStyle:
                                                            ThemeMode.light,
                                                      );
                                                      if (paymentResponse
                                                                  .paymentId ==
                                                              null &&
                                                          paymentResponse
                                                                  .errorMessage !=
                                                              null) {
                                                        showSnackbar(
                                                          context,
                                                          'Error: ${paymentResponse.errorMessage}',
                                                        );
                                                      }
                                                      _model.paymentIdMob =
                                                          paymentResponse
                                                                  .paymentId ??
                                                              '';

                                                      if (_model.paymentId ==
                                                          '') {
                                                        if (_model
                                                                .paymentIdMob !=
                                                            '0') {
                                                          var ordersRecordReference =
                                                              OrdersRecord
                                                                  .collection
                                                                  .doc();
                                                          await ordersRecordReference
                                                              .set({
                                                            ...createOrdersRecordData(
                                                              status: 'aceito',
                                                              orderValue: widget
                                                                  .totalPayment,
                                                              numOrder:
                                                                  valueOrDefault<
                                                                      int>(
                                                                random_data
                                                                    .randomInteger(
                                                                        0, 100),
                                                                0,
                                                              ),
                                                              dateHourOrder:
                                                                  getCurrentTimestamp,
                                                              fkUser:
                                                                  currentUserReference,
                                                              typeDelivery: _model
                                                                  .typeDeliveryValue3,
                                                              typePayment:
                                                                  'cartão',
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'shopCart': widget
                                                                    .listShopCart
                                                                    ?.map((e) =>
                                                                        e.reference)
                                                                    .toList(),
                                                              },
                                                            ),
                                                          });
                                                          _model.createdOrderMobile =
                                                              OrdersRecord
                                                                  .getDocumentFromData({
                                                            ...createOrdersRecordData(
                                                              status: 'aceito',
                                                              orderValue: widget
                                                                  .totalPayment,
                                                              numOrder:
                                                                  valueOrDefault<
                                                                      int>(
                                                                random_data
                                                                    .randomInteger(
                                                                        0, 100),
                                                                0,
                                                              ),
                                                              dateHourOrder:
                                                                  getCurrentTimestamp,
                                                              fkUser:
                                                                  currentUserReference,
                                                              typeDelivery: _model
                                                                  .typeDeliveryValue3,
                                                              typePayment:
                                                                  'cartão',
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'shopCart': widget
                                                                    .listShopCart
                                                                    ?.map((e) =>
                                                                        e.reference)
                                                                    .toList(),
                                                              },
                                                            ),
                                                          }, ordersRecordReference);

                                                          var invoicingRecordReference =
                                                              InvoicingRecord
                                                                  .collection
                                                                  .doc();
                                                          await invoicingRecordReference
                                                              .set(
                                                                  createInvoicingRecordData(
                                                            order: _model
                                                                .createdOrdercashMobile
                                                                ?.reference,
                                                            totalReceived: widget
                                                                .totalPayment,
                                                            time:
                                                                getCurrentTimestamp,
                                                            typePayment:
                                                                'Cartão',
                                                            idpayment: _model
                                                                .paymentId,
                                                          ));
                                                          _model.createdInvoicingMobile =
                                                              InvoicingRecord
                                                                  .getDocumentFromData(
                                                                      createInvoicingRecordData(
                                                                        order: _model
                                                                            .createdOrdercashMobile
                                                                            ?.reference,
                                                                        totalReceived:
                                                                            widget.totalPayment,
                                                                        time:
                                                                            getCurrentTimestamp,
                                                                        typePayment:
                                                                            'Cartão',
                                                                        idpayment:
                                                                            _model.paymentId,
                                                                      ),
                                                                      invoicingRecordReference);
                                                          setState(() {
                                                            FFAppState()
                                                                    .contador =
                                                                valueOrDefault<
                                                                    int>(
                                                              widget
                                                                  .listShopCart
                                                                  ?.length,
                                                              0,
                                                            );
                                                          });
                                                          setState(() {
                                                            FFAppState()
                                                                    .contador =
                                                                FFAppState()
                                                                        .contador +
                                                                    -1;
                                                          });
                                                          while (FFAppState()
                                                                  .contador >=
                                                              0) {
                                                            _model.currentShopCartMobile =
                                                                await ShopCartRecord.getDocumentOnce(widget
                                                                    .listShopCart![
                                                                        FFAppState()
                                                                            .contador]
                                                                    .reference);

                                                            await _model
                                                                .currentShopCartcashMob!
                                                                .reference
                                                                .update(
                                                                    createShopCartRecordData(
                                                              finished: true,
                                                            ));
                                                            setState(() {
                                                              _model.removeFromListShopAll(widget
                                                                      .listShopCart![
                                                                  FFAppState()
                                                                      .contador]);
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                      .contador =
                                                                  FFAppState()
                                                                          .contador +
                                                                      -1;
                                                            });
                                                          }

                                                          context.goNamed(
                                                            'pageClientPaymentFinished',
                                                            queryParameters: {
                                                              'refInvoicing':
                                                                  serializeParam(
                                                                _model
                                                                    .createdInvoicingMobile
                                                                    ?.reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                              'refOrder':
                                                                  serializeParam(
                                                                _model
                                                                    .createdOrderMobile
                                                                    ?.reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        0),
                                                              ),
                                                            },
                                                          );
                                                        } else {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      ModalPaymentRecuseWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        }
                                                      } else {
                                                        if (Navigator.of(
                                                                context)
                                                            .canPop()) {
                                                          context.pop();
                                                        }
                                                        context.pushNamed(
                                                          'pageClientPaymentPage',
                                                          queryParameters: {
                                                            'totalPayment':
                                                                serializeParam(
                                                              widget
                                                                  .totalPayment,
                                                              ParamType.double,
                                                            ),
                                                            'listShopCart':
                                                                serializeParam(
                                                              widget
                                                                  .listShopCart,
                                                              ParamType
                                                                  .Document,
                                                              true,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'listShopCart': widget
                                                                .listShopCart,
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      }

                                                      setState(() {});
                                                    },
                                                    text: 'Pagar com cartão',
                                                    options: FFButtonOptions(
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              if (_model.statePayment)
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var ordersRecordReference =
                                                          OrdersRecord
                                                              .collection
                                                              .doc();
                                                      await ordersRecordReference
                                                          .set({
                                                        ...createOrdersRecordData(
                                                          status: 'aceito',
                                                          orderValue: widget
                                                              .totalPayment,
                                                          numOrder:
                                                              valueOrDefault<
                                                                  int>(
                                                            random_data
                                                                .randomInteger(
                                                                    0, 100),
                                                            0,
                                                          ),
                                                          dateHourOrder:
                                                              getCurrentTimestamp,
                                                          fkUser:
                                                              currentUserReference,
                                                          typeDelivery: _model
                                                              .typeDeliveryValue3,
                                                          typePayment: 'cartão',
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'shopCart': widget
                                                                .listShopCart
                                                                ?.map((e) =>
                                                                    e.reference)
                                                                .toList(),
                                                          },
                                                        ),
                                                      });
                                                      _model.createdOrdercashMobile =
                                                          OrdersRecord
                                                              .getDocumentFromData({
                                                        ...createOrdersRecordData(
                                                          status: 'aceito',
                                                          orderValue: widget
                                                              .totalPayment,
                                                          numOrder:
                                                              valueOrDefault<
                                                                  int>(
                                                            random_data
                                                                .randomInteger(
                                                                    0, 100),
                                                            0,
                                                          ),
                                                          dateHourOrder:
                                                              getCurrentTimestamp,
                                                          fkUser:
                                                              currentUserReference,
                                                          typeDelivery: _model
                                                              .typeDeliveryValue3,
                                                          typePayment: 'cartão',
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'shopCart': widget
                                                                .listShopCart
                                                                ?.map((e) =>
                                                                    e.reference)
                                                                .toList(),
                                                          },
                                                        ),
                                                      }, ordersRecordReference);

                                                      var invoicingRecordReference =
                                                          InvoicingRecord
                                                              .collection
                                                              .doc();
                                                      await invoicingRecordReference
                                                          .set(
                                                              createInvoicingRecordData(
                                                        order: _model
                                                            .createdOrdercashMobile
                                                            ?.reference,
                                                        totalReceived:
                                                            widget.totalPayment,
                                                        time:
                                                            getCurrentTimestamp,
                                                        typePayment: 'Cartão',
                                                      ));
                                                      _model.createdInvoicingcashMobile =
                                                          InvoicingRecord
                                                              .getDocumentFromData(
                                                                  createInvoicingRecordData(
                                                                    order: _model
                                                                        .createdOrdercashMobile
                                                                        ?.reference,
                                                                    totalReceived:
                                                                        widget
                                                                            .totalPayment,
                                                                    time:
                                                                        getCurrentTimestamp,
                                                                    typePayment:
                                                                        'Cartão',
                                                                  ),
                                                                  invoicingRecordReference);
                                                      setState(() {
                                                        FFAppState().contador =
                                                            widget.listShopCart!
                                                                .length;
                                                      });
                                                      setState(() {
                                                        FFAppState().contador =
                                                            FFAppState()
                                                                    .contador +
                                                                -1;
                                                      });
                                                      while (FFAppState()
                                                              .contador >=
                                                          0) {
                                                        _model.currentShopCartcashMob =
                                                            await ShopCartRecord
                                                                .getDocumentOnce(
                                                                    widget
                                                                        .listShopCart![
                                                                            valueOrDefault<int>(
                                                          FFAppState().contador,
                                                          0,
                                                        )]
                                                                        .reference);

                                                        await widget
                                                            .listShopCart![
                                                                FFAppState()
                                                                    .contador]
                                                            .reference
                                                            .update(
                                                                createShopCartRecordData(
                                                          finished: true,
                                                        ));
                                                        setState(() {
                                                          _model.removeFromListShopAll(
                                                              widget.listShopCart![
                                                                  FFAppState()
                                                                      .contador]);
                                                        });
                                                        setState(() {
                                                          FFAppState()
                                                                  .contador =
                                                              FFAppState()
                                                                      .contador +
                                                                  -1;
                                                        });
                                                      }

                                                      context.goNamed(
                                                        'pageClientPaymentFinished',
                                                        queryParameters: {
                                                          'refInvoicing':
                                                              serializeParam(
                                                            _model
                                                                .createdInvoicingcashMobile
                                                                ?.reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'refOrder':
                                                              serializeParam(
                                                            _model
                                                                .createdOrdercashMobile
                                                                ?.reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );

                                                      setState(() {});
                                                    },
                                                    text: 'Pagar com dinheiro',
                                                    options: FFButtonOptions(
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 6.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tabletLandscape: false,
                            ))
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 2.0,
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, -1.00),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Pedido de:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 14.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 80.0,
                                                      height: 24.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .darkCamaron,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xE7E6E6E6),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'A finalizar',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                fontSize: 10.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      14.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons.person,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 22.0,
                                                              ),
                                                              AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        Text(
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.name,
                                                                      ''),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  14.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.home,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (Navigator.of(
                                                                      context)
                                                                  .canPop()) {
                                                                context.pop();
                                                              }
                                                              context.pushNamed(
                                                                'pageClientHome',
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            0),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: Text(
                                                              'Voltar a tela inicial',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .orangeCamaron2,
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                  ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (_model.statePayment)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        14.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .local_atm_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 30.0,
                                                                ),
                                                                Text(
                                                                  'Dinheiro',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFF2A2A2A),
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 10.0)),
                                                            ),
                                                          ),
                                                        if (!_model
                                                            .statePayment)
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons.payment,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Cartão',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 20.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 2.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xB3EDEDED),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 20.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Detalhes do pedido',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF797979),
                                                              ),
                                                        ),
                                                        Builder(
                                                          builder: (context) {
                                                            final listShopCartRef =
                                                                widget.listShopCart
                                                                        ?.toList() ??
                                                                    [];
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: List.generate(
                                                                  listShopCartRef
                                                                      .length,
                                                                  (listShopCartRefIndex) {
                                                                final listShopCartRefItem =
                                                                    listShopCartRef[
                                                                        listShopCartRefIndex];
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listShopCartRefItem
                                                                            .name,
                                                                        '0',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        '${valueOrDefault<String>(
                                                                          listShopCartRefItem
                                                                              .qtd
                                                                              .toString(),
                                                                          '0',
                                                                        )}x',
                                                                        '0',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 20.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 2.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xB3EDEDED),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 20.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Text(
                                                      'Total ${valueOrDefault<String>(
                                                        formatNumber(
                                                          functions
                                                              .convertNumberPayment(
                                                                  widget
                                                                      .totalPayment!),
                                                          formatType:
                                                              FormatType.custom,
                                                          format: 'R\$ ###.##',
                                                          locale: 'BR',
                                                        ),
                                                        '0',
                                                      )}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 20.0,
                                                              ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 20.0)),
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 5.0)),
            ),
          ),
        ),
      ),
    );
  }
}
