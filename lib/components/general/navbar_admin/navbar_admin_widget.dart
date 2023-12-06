import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_admin_model.dart';
export 'navbar_admin_model.dart';

class NavbarAdminWidget extends StatefulWidget {
  const NavbarAdminWidget({Key? key}) : super(key: key);

  @override
  _NavbarAdminWidgetState createState() => _NavbarAdminWidgetState();
}

class _NavbarAdminWidgetState extends State<NavbarAdminWidget> {
  late NavbarAdminModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarAdminModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.btnHome = true;
        _model.btnOrders = false;
        _model.btnClients = false;
        _model.btnInvoincing = false;
        _model.btnProducts = false;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, -1.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 12.0, 10.0, 12.0),
        child: Container(
          width: double.infinity,
          height: 80.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).darkCamaron,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 1.0),
                  child: Image.asset(
                    'assets/images/camaron.JPG',
                    width: 124.0,
                    height: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                if (isWeb &&
                    responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 8.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().btnNavHome = true;
                                  FFAppState().btnNavOrders = false;
                                  FFAppState().btnNavClients = false;
                                  FFAppState().btnNavInvoinving = false;
                                  FFAppState().btnNavProducts = false;
                                });

                                context.goNamed(
                                  'pageAdminHome',
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
                                width: 120.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1F1F1F),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.home_rounded,
                                        color: valueOrDefault<Color>(
                                          FFAppState().btnNavHome
                                              ? FlutterFlowTheme.of(context)
                                                  .orangeCamaron2
                                              : FlutterFlowTheme.of(context)
                                                  .whiteCamaron,
                                          FlutterFlowTheme.of(context)
                                              .orangeCamaron2,
                                        ),
                                        size: 28.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Início',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: valueOrDefault<Color>(
                                                  FFAppState().btnNavHome
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .orangeCamaron2
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .whiteCamaron,
                                                  FlutterFlowTheme.of(context)
                                                      .orangeCamaron2,
                                                ),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().btnNavOrders = true;
                                  FFAppState().btnNavHome = false;
                                  FFAppState().btnNavClients = false;
                                  FFAppState().btnNavInvoinving = false;
                                  FFAppState().btnNavProducts = false;
                                });

                                context.goNamed(
                                  'pageAdminOrders',
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
                                width: 120.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1F1F1F),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.food_bank_outlined,
                                        color: valueOrDefault<Color>(
                                          FFAppState().btnNavOrders
                                              ? FlutterFlowTheme.of(context)
                                                  .orangeCamaron2
                                              : FlutterFlowTheme.of(context)
                                                  .whiteCamaron,
                                          FlutterFlowTheme.of(context)
                                              .whiteCamaron,
                                        ),
                                        size: 28.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Pedidos',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: valueOrDefault<Color>(
                                                  FFAppState().btnNavOrders
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .orangeCamaron2
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .whiteCamaron,
                                                  FlutterFlowTheme.of(context)
                                                      .whiteCamaron,
                                                ),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().btnNavClients = true;
                                  FFAppState().btnNavOrders = false;
                                  FFAppState().btnNavInvoinving = false;
                                  FFAppState().btnNavHome = false;
                                  FFAppState().btnNavProducts = false;
                                });

                                context.goNamed(
                                  'pageAdminClientWeb',
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
                                width: 120.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1F1F1F),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.people_outlined,
                                        color: valueOrDefault<Color>(
                                          FFAppState().btnNavClients
                                              ? FlutterFlowTheme.of(context)
                                                  .orangeCamaron2
                                              : FlutterFlowTheme.of(context)
                                                  .whiteCamaron,
                                          FlutterFlowTheme.of(context)
                                              .whiteCamaron,
                                        ),
                                        size: 28.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Clientes',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: valueOrDefault<Color>(
                                                  FFAppState().btnNavClients
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .orangeCamaron2
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .whiteCamaron,
                                                  FlutterFlowTheme.of(context)
                                                      .whiteCamaron,
                                                ),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 18.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().btnNavInvoinving = true;
                                  FFAppState().btnNavClients = false;
                                  FFAppState().btnNavOrders = false;
                                  FFAppState().btnNavHome = false;
                                  FFAppState().btnNavProducts = false;
                                });
                                _model.updatePage(() {
                                  FFAppState().statePayment = 'dinheiro';
                                  FFAppState().stateOrder = 'finalizado';
                                });

                                context.goNamed(
                                  'pageAdminInvoincing',
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
                                width: 155.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1F1F1F),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_chart_rounded,
                                        color: valueOrDefault<Color>(
                                          FFAppState().btnNavInvoinving
                                              ? FlutterFlowTheme.of(context)
                                                  .orangeCamaron2
                                              : FlutterFlowTheme.of(context)
                                                  .whiteCamaron,
                                          FlutterFlowTheme.of(context)
                                              .whiteCamaron,
                                        ),
                                        size: 28.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Faturamento',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: valueOrDefault<Color>(
                                                  FFAppState().btnNavInvoinving
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .orangeCamaron2
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .whiteCamaron,
                                                  FlutterFlowTheme.of(context)
                                                      .whiteCamaron,
                                                ),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 18.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().btnNavProducts = true;
                                  FFAppState().btnNavHome = false;
                                  FFAppState().btnNavOrders = false;
                                  FFAppState().btnNavClients = false;
                                  FFAppState().btnNavInvoinving = false;
                                });

                                context.goNamed(
                                  'pageAdminProduct',
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
                                width: 155.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1F1F1F),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.card_travel_sharp,
                                        color: valueOrDefault<Color>(
                                          FFAppState().btnNavProducts
                                              ? FlutterFlowTheme.of(context)
                                                  .orangeCamaron2
                                              : FlutterFlowTheme.of(context)
                                                  .whiteCamaron,
                                          FlutterFlowTheme.of(context)
                                              .whiteCamaron,
                                        ),
                                        size: 28.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Produtos',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: valueOrDefault<Color>(
                                                  FFAppState().btnNavProducts
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .orangeCamaron2
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .whiteCamaron,
                                                  FlutterFlowTheme.of(context)
                                                      .whiteCamaron,
                                                ),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            desktop: false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F4F8),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Icon(
                                  Icons.search_rounded,
                                  color: Color(0xFF57636C),
                                  size: 24.0,
                                ),
                              ),
                            ),
                          Container(
                            width: 44.0,
                            height: 44.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFE0E3E7),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  2.0, 2.0, 2.0, 2.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => ClipRRect(
                                  borderRadius: BorderRadius.circular(60.0),
                                  child: Image.network(
                                    currentUserPhoto,
                                    width: 80.0,
                                    height: 80.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  hoverColor: FlutterFlowTheme.of(context)
                                      .orangeCamaron2,
                                  hoverIconColor:
                                      FlutterFlowTheme.of(context).whiteCamaron,
                                  icon: Icon(
                                    Icons.input,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    context.goNamedAuth(
                                        'pageLogin', context.mounted);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  tablet: false,
                  desktop: false,
                ))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 8.0, 0.0),
                            child: Container(
                              width: 120.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF181818),
                                borderRadius: BorderRadius.circular(12.0),
                                shape: BoxShape.rectangle,
                              ),
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Visibility(
                                visible: responsiveVisibility(
                                  context: context,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          Scaffold.of(context).openDrawer();
                                        },
                                        child: Icon(
                                          Icons.menu_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .orangeCamaron2,
                                          size: 28.0,
                                        ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
