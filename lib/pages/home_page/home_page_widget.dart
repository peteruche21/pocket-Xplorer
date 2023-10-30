import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/collectible/collectible_widget.dart';
import '/components/porfolio_history/porfolio_history_widget.dart';
import '/components/switch_network/switch_network_widget.dart';
import '/empty_widget/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: false,
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.2,
                  height: MediaQuery.sizeOf(context).width * 1.2,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://effigy.im/a/${FFAppState().xploreAddress}.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: FutureBuilder<ApiCallResponse>(
                future: _model.getENSDomainCache(
                  requestFn: () => ChainBaseGroup.getENSDomainsCall.call(
                    address: FFAppState().xploreAddress,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 5.0,
                        height: 5.0,
                        child: SpinKitPulse(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 5.0,
                        ),
                      ),
                    );
                  }
                  final textGetENSDomainsResponse = snapshot.data!;
                  return Text(
                    ChainBaseGroup.getENSDomainsCall.name(
                              textGetENSDomainsResponse.jsonBody,
                            ) !=
                            null
                        ? ChainBaseGroup.getENSDomainsCall
                            .name(
                              textGetENSDomainsResponse.jsonBody,
                            )
                            .toString()
                        : '${functions.formatAddress(FFAppState().xploreAddress, 6)}',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                  );
                },
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 12.0, 5.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).secondary,
                    borderRadius: 17.0,
                    buttonSize: 36.0,
                    icon: Icon(
                      Icons.notification_add_rounded,
                      color: FFAppState().watching
                          ? FlutterFlowTheme.of(context).accent2
                          : FlutterFlowTheme.of(context).alternate,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      if (FFAppState().watching) {
                        _model.webhookId = await queryWebhooksRecordOnce(
                          parent: currentUserReference,
                          queryBuilder: (webhooksRecord) => webhooksRecord
                              .where(
                                'topic',
                                isEqualTo: FFAppState().networks.webhookTopic,
                              )
                              .where(
                                'address',
                                isEqualTo: FFAppState().xploreAddress,
                              ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        _model.apiResult =
                            await ChainBaseGroup.deleteWebHookCall.call(
                          webhookId: _model.webhookId?.webHookId,
                        );
                        if ((_model.apiResult?.succeeded ?? true)) {
                          await _model.webhookId!.reference.delete();
                          setState(() {
                            FFAppState().watching = false;
                          });
                        }
                      } else {
                        _model.apiResultsFalse =
                            await ChainBaseGroup.registerWebHookCall.call(
                          userId: FFAppState().userId,
                          topic: FFAppState().networks.webhookTopic,
                          xploreAddress: FFAppState().xploreAddress,
                          webhookName:
                              '${FFAppState().userId}-${FFAppState().networks.chainId.toString()}${FFAppState().xploreAddress}',
                        );
                        if ((_model.apiResultsFalse?.succeeded ?? true)) {
                          await WebhooksRecord.createDoc(currentUserReference!)
                              .set(createWebhooksRecordData(
                            webHookId: getJsonField(
                              (_model.apiResultsFalse?.jsonBody ?? ''),
                              r'''$.data.webhook_id''',
                            ).toString(),
                            topic: FFAppState().networks.webhookTopic,
                            address: FFAppState().xploreAddress,
                          ));
                          setState(() {
                            FFAppState().watching = true;
                          });
                        }
                      }

                      setState(() {});
                    },
                  ),
                ),
                Builder(
                  builder: (context) => Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 5.0),
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).secondary,
                      borderRadius: 17.0,
                      buttonSize: 36.0,
                      icon: Icon(
                        Icons.settings_rounded,
                        color: FlutterFlowTheme.of(context).alternate,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        showAlignedDialog(
                          context: context,
                          isGlobal: false,
                          avoidOverflow: true,
                          targetAnchor: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          followerAnchor: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          builder: (dialogContext) {
                            return Material(
                              color: Colors.transparent,
                              child: GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: SwitchNetworkWidget(
                                  actions: () async {
                                    _model.webhookDataItem =
                                        await queryWebhooksRecordOnce(
                                      parent: currentUserReference,
                                      queryBuilder: (webhooksRecord) =>
                                          webhooksRecord
                                              .where(
                                                'address',
                                                isEqualTo:
                                                    FFAppState().xploreAddress,
                                              )
                                              .where(
                                                'topic',
                                                isEqualTo: FFAppState()
                                                    .networks
                                                    .webhookTopic,
                                              ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    setState(() {
                                      FFAppState().watching =
                                          _model.webhookDataItem?.address ==
                                              FFAppState().xploreAddress;
                                    });
                                    // refreshPortfolio
                                    setState(() {
                                      _model
                                          .clearGetPortfolioHistoryCacheCache();
                                      _model.apiRequestCompleted1 = false;
                                    });
                                    // refreshBalance
                                    setState(() =>
                                        _model.apiRequestCompleter5 = null);
                                    await _model.waitForApiRequestCompleted5(
                                        minWait: 3000);
                                    // refreshAssets
                                    setState(() {
                                      _model.clearGetTokenCacheCache();
                                      _model.apiRequestCompleted4 = false;
                                    });
                                    await _model.waitForApiRequestCompleted4(
                                        minWait: 3000);
                                    // refreshActivity
                                    setState(() {
                                      _model.clearGetTransactionCacheCache();
                                      _model.apiRequestCompleted3 = false;
                                    });
                                    await _model.waitForApiRequestCompleted3(
                                        minWait: 3000);
                                    // refreshNfts
                                    setState(() => _model
                                        .collectibleListViewPagingController
                                        ?.refresh());
                                  },
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));

                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: RefreshIndicator(
                    color: FlutterFlowTheme.of(context).primary,
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                    onRefresh: () async {
                      // refreshPortfolio
                      setState(() {
                        _model.clearGetPortfolioHistoryCacheCache();
                        _model.apiRequestCompleted1 = false;
                      });
                      // refreshBalance
                      setState(() => _model.apiRequestCompleter5 = null);
                      await _model.waitForApiRequestCompleted5(minWait: 3000);
                      // refreshAssets
                      setState(() {
                        _model.clearGetTokenCacheCache();
                        _model.apiRequestCompleted4 = false;
                      });
                      await _model.waitForApiRequestCompleted4(minWait: 3000);
                      // refreshHistory
                      setState(() {
                        _model.clearGetTransactionCacheCache();
                        _model.apiRequestCompleted3 = false;
                      });
                      await _model.waitForApiRequestCompleted3(minWait: 3000);
                      // clearCollectionsCache
                      _model.clearGetNFTsCacheCache();
                      // refreshNfts
                      setState(() => _model.collectibleListViewPagingController
                          ?.refresh());
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 300.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).primary,
                                    FlutterFlowTheme.of(context).primary,
                                    FlutterFlowTheme.of(context).secondary
                                  ],
                                  stops: [0.0, 0.45, 1.0],
                                  begin: AlignmentDirectional(0.0, -1.0),
                                  end: AlignmentDirectional(0, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 6.0, 0.0, 0.0),
                                    child: Container(
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Account Balance',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 2.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: (_model
                                                                .apiRequestCompleter5 ??=
                                                            Completer<
                                                                ApiCallResponse>()
                                                              ..complete(
                                                                  ChainBaseGroup
                                                                      .getNativeTokenBalanceCall
                                                                      .call(
                                                                chainId:
                                                                    FFAppState()
                                                                        .networks
                                                                        .chainId,
                                                                address:
                                                                    FFAppState()
                                                                        .xploreAddress,
                                                              )))
                                                        .future,
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 15.0,
                                                            height: 15.0,
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 15.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final textGetNativeTokenBalanceResponse =
                                                          snapshot.data!;
                                                      return Text(
                                                        '${functions.fromBigInt(ChainBaseGroup.getNativeTokenBalanceCall.balance(
                                                              textGetNativeTokenBalanceResponse
                                                                  .jsonBody,
                                                            ).toString(), 18)}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      30.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .displaySmallFamily),
                                                                ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 2.0),
                                                  child: Text(
                                                    FFAppState()
                                                        .networks
                                                        .nativeToken,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 18.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmallFamily),
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  FutureBuilder<ApiCallResponse>(
                                    future: _model
                                        .getPortfolioHistoryCache(
                                      requestFn: () =>
                                          GetHistoricalPortfolioRecordCall.call(
                                        network:
                                            FFAppState().networks.networkName,
                                        address: FFAppState().xploreAddress,
                                      ),
                                    )
                                        .then((result) {
                                      _model.apiRequestCompleted1 = true;
                                      return result;
                                    }),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitPulse(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 0.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final porfolioHistoryGetHistoricalPortfolioRecordResponse =
                                          snapshot.data!;
                                      return wrapWithModel(
                                        model: _model.porfolioHistoryModel,
                                        updateCallback: () => setState(() {}),
                                        child: PorfolioHistoryWidget(
                                          portfolioHistoryStruct:
                                              functions.parsePortfolioData(
                                                  GetHistoricalPortfolioRecordCall
                                                          .portfolio(
                                            porfolioHistoryGetHistoricalPortfolioRecordResponse
                                                .jsonBody,
                                          )!
                                                      .toList()),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation']!),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Crypto',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.navigate_next_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('AssetsPage');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: _model
                                      .getTokenCache(
                                    requestFn: () => ChainBaseGroup
                                        .getERCTokenBalancesCall
                                        .call(
                                      chainId: FFAppState().networks.chainId,
                                      address: FFAppState().xploreAddress,
                                      limit: 5,
                                      page: 1,
                                    ),
                                  )
                                      .then((result) {
                                    _model.apiRequestCompleted4 = true;
                                    return result;
                                  }),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 35.0,
                                          height: 35.0,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 35.0,
                                          ),
                                        ),
                                      );
                                    }
                                    final cryptoListViewGetERCTokenBalancesResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final assets = (ChainBaseGroup
                                                    .getERCTokenBalancesCall
                                                    .items(
                                                      cryptoListViewGetERCTokenBalancesResponse
                                                          .jsonBody,
                                                    )
                                                    ?.where((e) => e != null)
                                                    .toList()
                                                    ?.toList() ??
                                                [])
                                            .take(5)
                                            .toList();
                                        if (assets.isEmpty) {
                                          return EmptyListWidget(
                                            emptyText: 'Crypto',
                                          );
                                        }
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: assets.length,
                                          itemBuilder: (context, assetsIndex) {
                                            final assetsItem =
                                                assets[assetsIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.5, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 64.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 8.0, 12.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 32.0,
                                                        height: 32.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl:
                                                              '${functions.translateIPFSUri(getJsonField(
                                                            assetsItem,
                                                            r'''$.logos[0].uri''',
                                                          ).toString())}',
                                                          fit: BoxFit.cover,
                                                          errorWidget: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.jpg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
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
                                                              AutoSizeText(
                                                                getJsonField(
                                                                  assetsItem,
                                                                  r'''$.name''',
                                                                )
                                                                    .toString()
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          25,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '${functions.fromBigInt(getJsonField(
                                                                            assetsItem,
                                                                            r'''$.balance''',
                                                                          ).toString(), getJsonField(
                                                                            assetsItem,
                                                                            r'''$.decimals''',
                                                                          ))} ${getJsonField(
                                                                    assetsItem,
                                                                    r'''$.symbol''',
                                                                  ).toString()}'
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        35,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '\$${(double? usdPrice) {
                                                          return usdPrice
                                                                  ?.toStringAsFixed(
                                                                      2) ??
                                                              "0.00";
                                                        }(getJsonField(
                                                          assetsItem,
                                                          r'''$.current_usd_price''',
                                                        ))}',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation1']!),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 12.0),
                                  child: Text(
                                    'Collectibles',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 200.0,
                                decoration: BoxDecoration(),
                                child: PagedListView<ApiPagingParams,
                                    dynamic>.separated(
                                  pagingController:
                                      _model.setCollectibleListViewController(
                                    (nextPageMarker) => ChainBaseGroup
                                        .getNFTsOwnedByAddressCall
                                        .call(
                                      chainId: FFAppState().networks.chainId,
                                      address: FFAppState().xploreAddress,
                                      page: nextPageMarker.nextPageNumber + 1,
                                    ),
                                  ),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  reverse: false,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(width: 15.0),
                                  builderDelegate:
                                      PagedChildBuilderDelegate<dynamic>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 35.0,
                                        height: 35.0,
                                        child: SpinKitPulse(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 35.0,
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 35.0,
                                        height: 35.0,
                                        child: SpinKitPulse(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 35.0,
                                        ),
                                      ),
                                    ),
                                    noItemsFoundIndicatorBuilder: (_) => Center(
                                      child: EmptyListWidget(
                                        emptyText: 'Collectibles',
                                      ),
                                    ),
                                    itemBuilder:
                                        (context, _, collectiblesIndex) {
                                      final collectiblesItem = _model
                                          .collectibleListViewPagingController!
                                          .itemList![collectiblesIndex];
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: CollectibleWidget(
                                                      imageUri:
                                                          '${functions.translateIPFSUri(getJsonField(
                                                        collectiblesItem,
                                                        r'''$.image_uri''',
                                                      ).toString())}',
                                                      name: getJsonField(
                                                        collectiblesItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      address: getJsonField(
                                                        collectiblesItem,
                                                        r'''$.contract_address''',
                                                      ).toString(),
                                                      metadataName:
                                                          getJsonField(
                                                        collectiblesItem,
                                                        r'''$.metadata.name''',
                                                      ).toString(),
                                                      ercType: getJsonField(
                                                        collectiblesItem,
                                                        r'''$.erc_type''',
                                                      ).toString(),
                                                      metadataDescription:
                                                          getJsonField(
                                                        collectiblesItem,
                                                        r'''$.metadata.description''',
                                                      ).toString(),
                                                      metadataAttributes:
                                                          getJsonField(
                                                        collectiblesItem,
                                                        r'''$.traits''',
                                                        true,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Container(
                                            width: 150.0,
                                            height: 150.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, -1.00),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 5.0, 5.0, 5.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        '${functions.translateIPFSUri(getJsonField(
                                                      collectiblesItem,
                                                      r'''$.image_uri''',
                                                    ).toString())}',
                                                    width: 150.0,
                                                    height: 150.0,
                                                    fit: BoxFit.cover,
                                                    errorWidget: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.jpg',
                                                      width: 150.0,
                                                      height: 150.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation2']!),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Activity',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.navigate_next_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed('HistoryPage');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse>(
                                  future: _model
                                      .getTransactionCache(
                                    requestFn: () => ChainBaseGroup
                                        .getTransactionsByAccountCall
                                        .call(
                                      chainId: FFAppState().networks.chainId,
                                      address: FFAppState().xploreAddress,
                                      page: 1,
                                      limit: 5,
                                    ),
                                  )
                                      .then((result) {
                                    _model.apiRequestCompleted3 = true;
                                    return result;
                                  }),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 35.0,
                                          height: 35.0,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 35.0,
                                          ),
                                        ),
                                      );
                                    }
                                    final historyListViewGetTransactionsByAccountResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final activity = (ChainBaseGroup
                                                    .getTransactionsByAccountCall
                                                    .items(
                                                      historyListViewGetTransactionsByAccountResponse
                                                          .jsonBody,
                                                    )
                                                    ?.where((e) => e != null)
                                                    .toList()
                                                    ?.toList() ??
                                                [])
                                            .take(5)
                                            .toList();
                                        if (activity.isEmpty) {
                                          return EmptyListWidget(
                                            emptyText: 'Activity',
                                          );
                                        }
                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            12.0,
                                            0,
                                            12.0,
                                          ),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: activity.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 1.0),
                                          itemBuilder:
                                              (context, activityIndex) {
                                            final activityItem =
                                                activity[activityIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 4.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 0.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      offset: Offset(0.0, 1.0),
                                                    )
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 32.0,
                                                        height: 32.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Icon(
                                                            Icons
                                                                .attach_money_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
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
                                                              Text(
                                                                (String from,
                                                                            String
                                                                                address) {
                                                                  return from.toLowerCase() ==
                                                                          address
                                                                              .toLowerCase()
                                                                      ? true
                                                                      : false;
                                                                }(
                                                                        getJsonField(
                                                                          activityItem,
                                                                          r'''$.from_address''',
                                                                        )
                                                                            .toString(),
                                                                        FFAppState()
                                                                            .xploreAddress)
                                                                    ? 'Out'
                                                                    : 'In',
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '${functions.formatAddress((String from, String to, String address) {
                                                                        return address.toLowerCase() ==
                                                                                from.toLowerCase()
                                                                            ? to
                                                                            : from;
                                                                      }(getJsonField(
                                                                            activityItem,
                                                                            r'''$.from_address''',
                                                                          ).toString(), getJsonField(
                                                                            activityItem,
                                                                            r'''$.to_address''',
                                                                          ).toString(), FFAppState().xploreAddress), 6)}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        color: Color(
                                                                            0xA3C0C0C8),
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                '${functions.fromBigInt(getJsonField(
                                                                      activityItem,
                                                                      r'''$.value''',
                                                                    ).toString(), 18)} ${FFAppState().networks.nativeToken}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      color: (String from, String address) {
                                                                        return from.toLowerCase() ==
                                                                                address.toLowerCase()
                                                                            ? true
                                                                            : false;
                                                                      }(
                                                                              getJsonField(
                                                                                activityItem,
                                                                                r'''$.from_address''',
                                                                              ).toString(),
                                                                              FFAppState().xploreAddress)
                                                                          ? FlutterFlowTheme.of(context).primaryText
                                                                          : FlutterFlowTheme.of(context).accent2,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                    'yMMMd',
                                                                    DateTime.fromMillisecondsSinceEpoch(
                                                                        DateTime.parse(getJsonField(
                                                                      activityItem,
                                                                      r'''$.block_timestamp''',
                                                                    ).toString())
                                                                            .millisecondsSinceEpoch),
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation3']!),
                          ),
                        ]
                            .divide(SizedBox(height: 16.0))
                            .around(SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
