import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/users/clients/components/modal_shop_cart_clear/modal_shop_cart_clear_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_product_details_model.dart';
export 'modal_product_details_model.dart';

class ModalProductDetailsWidget extends StatefulWidget {
  const ModalProductDetailsWidget({
    Key? key,
    required this.refProduct,
  }) : super(key: key);

  final DocumentReference? refProduct;

  @override
  _ModalProductDetailsWidgetState createState() =>
      _ModalProductDetailsWidgetState();
}

class _ModalProductDetailsWidgetState extends State<ModalProductDetailsWidget> {
  late ModalProductDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalProductDetailsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().stateMob = false;
      });
      _model.collectionShop = await queryShopCartRecordOnce(
        queryBuilder: (shopCartRecord) => shopCartRecord
            .where(
              'finished',
              isEqualTo: false,
            )
            .where(
              'fk_user',
              isEqualTo: currentUserReference,
            ),
      );
      _model.productRead =
          await ProductsRecord.getDocumentOnce(widget.refProduct!);
      setState(() {
        _model.total = valueOrDefault<double>(
          functions.subTotalProduct(
              _model.contadorQtdValue!.toDouble(), _model.productRead!.value),
          0.0,
        );
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
      alignment: AlignmentDirectional(
          0.00,
          valueOrDefault<double>(
            isWeb == true ? 0.0 : 1.0,
            0.0,
          )),
      child: Container(
        width: 689.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).whiteCamaron,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: Colors.white,
                      hoverColor: FlutterFlowTheme.of(context).orangeCamaron2,
                      hoverIconColor: FlutterFlowTheme.of(context).whiteCamaron,
                      icon: Icon(
                        Icons.close_rounded,
                        color: Color(0xFF5E5B5B),
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 185.0,
                          height: 185.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                _model.productRead?.phtoUrl,
                                'carregando',
                              ),
                              width: double.infinity,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              _model.productRead?.name,
                              'Carregando',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              formatNumber(
                                functions.convertNumberPayment(_model.total!),
                                formatType: FormatType.custom,
                                format: 'R\$ ###.##',
                                locale: 'BR',
                              ),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 20.0,
                thickness: 2.0,
                indent: 16.0,
                endIndent: 16.0,
                color: FlutterFlowTheme.of(context).lineColor,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Informações',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Poppins',
                            fontSize: 30.0,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          valueOrDefault<String>(
                            _model.productRead?.description,
                            'Carregando',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ),
                  ],
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
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Container(
                          width: 160.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(25.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).lineColor,
                              width: 1.0,
                            ),
                          ),
                          child: FlutterFlowCountController(
                            decrementIconBuilder: (enabled) => Icon(
                              Icons.remove_rounded,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).darkCamaron
                                  : FlutterFlowTheme.of(context).darkCamaron,
                              size: 20.0,
                            ),
                            incrementIconBuilder: (enabled) => Icon(
                              Icons.add_rounded,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).orangeCamaron2
                                  : FlutterFlowTheme.of(context).darkCamaron,
                              size: 20.0,
                            ),
                            countBuilder: (count) => Text(
                              count.toString(),
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                            count: _model.countControllerValue ??= 1,
                            updateCount: (count) async {
                              setState(
                                  () => _model.countControllerValue = count);
                              setState(() {
                                _model.total = valueOrDefault<double>(
                                  functions.subTotalProduct(
                                      _model.countControllerValue!.toDouble(),
                                      _model.productRead!.value),
                                  0.0,
                                );
                              });
                            },
                            stepSize: 1,
                            minimum: 1,
                            maximum: 10,
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          if (_model.collectionShop?.length != 0) {
                            if (_model.productRead?.fkUserAdmin ==
                                _model.collectionShop?.first?.fkUserAdmin) {
                              await ShopCartRecord.collection
                                  .doc()
                                  .set(createShopCartRecordData(
                                    fkProduct: widget.refProduct,
                                    fkUser: currentUserReference,
                                    qtd: valueOrDefault<int>(
                                      _model.contadorQtdValue,
                                      0,
                                    ),
                                    name: _model.productRead?.name,
                                    finished: false,
                                    subTotal: _model.total,
                                    status: 'em andamento',
                                    created: getCurrentTimestamp,
                                    image: _model.productRead?.phtoUrl,
                                    fkUserAdmin:
                                        _model.productRead?.fkUserAdmin,
                                  ));
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

                              return;
                            } else {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ModalShopCartClearWidget(),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              return;
                            }
                          } else {
                            await ShopCartRecord.collection
                                .doc()
                                .set(createShopCartRecordData(
                                  fkProduct: widget.refProduct,
                                  fkUser: currentUserReference,
                                  qtd: valueOrDefault<int>(
                                    _model.contadorQtdValue,
                                    0,
                                  ),
                                  name: _model.productRead?.name,
                                  finished: false,
                                  subTotal: _model.total,
                                  status: 'em andamento',
                                  created: getCurrentTimestamp,
                                  image: _model.productRead?.phtoUrl,
                                  fkUserAdmin: _model.productRead?.fkUserAdmin,
                                ));
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

                            return;
                          }
                        },
                        text: 'Adicionar',
                        options: FFButtonOptions(
                          width: 150.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).orangeCamaron2,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Container(
                          width: 150.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(0.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).lineColor,
                              width: 1.0,
                            ),
                          ),
                          child: FlutterFlowCountController(
                            decrementIconBuilder: (enabled) => Icon(
                              Icons.remove_rounded,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).darkCamaron
                                  : FlutterFlowTheme.of(context).darkCamaron,
                              size: 20.0,
                            ),
                            incrementIconBuilder: (enabled) => Icon(
                              Icons.add_rounded,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).orangeCamaron2
                                  : FlutterFlowTheme.of(context).darkCamaron,
                              size: 20.0,
                            ),
                            countBuilder: (count) => Text(
                              count.toString(),
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                            count: _model.contadorQtdValue ??= 1,
                            updateCount: (count) async {
                              setState(() => _model.contadorQtdValue = count);
                              setState(() {
                                _model.total = valueOrDefault<double>(
                                  functions.subTotalProduct(
                                      _model.contadorQtdValue!.toDouble(),
                                      _model.productRead!.value),
                                  0.0,
                                );
                              });
                            },
                            stepSize: 1,
                            minimum: 1,
                            maximum: 10,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.collectionShop?.length != 0) {
                              if (_model.productRead?.fkUserAdmin ==
                                  _model.collectionShop?.first?.fkUserAdmin) {
                                await ShopCartRecord.collection
                                    .doc()
                                    .set(createShopCartRecordData(
                                      fkProduct: widget.refProduct,
                                      fkUser: currentUserReference,
                                      qtd: valueOrDefault<int>(
                                        _model.contadorQtdValue,
                                        0,
                                      ),
                                      name: _model.productRead?.name,
                                      finished: false,
                                      subTotal: _model.total,
                                      status: 'em andamento',
                                      created: getCurrentTimestamp,
                                      image: _model.productRead?.phtoUrl,
                                      fkUserAdmin:
                                          _model.productRead?.fkUserAdmin,
                                    ));
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

                                return;
                              } else {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: ModalShopCartClearWidget(),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                return;
                              }
                            } else {
                              await ShopCartRecord.collection
                                  .doc()
                                  .set(createShopCartRecordData(
                                    fkProduct: widget.refProduct,
                                    fkUser: currentUserReference,
                                    qtd: valueOrDefault<int>(
                                      _model.contadorQtdValue,
                                      0,
                                    ),
                                    name: _model.productRead?.name,
                                    finished: false,
                                    subTotal: _model.total,
                                    status: 'em andamento',
                                    created: getCurrentTimestamp,
                                    image: _model.productRead?.phtoUrl,
                                    fkUserAdmin:
                                        _model.productRead?.fkUserAdmin,
                                  ));
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

                              return;
                            }
                          },
                          text: 'Adicionar',
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).orangeCamaron2,
                            textStyle: FlutterFlowTheme.of(context)
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
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 10.0)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
