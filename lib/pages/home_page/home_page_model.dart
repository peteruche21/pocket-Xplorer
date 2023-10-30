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
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'home_page_widget.dart' show HomePageWidget;
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

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  WebhooksRecord? webhookId;
  // Stores action output result for [Backend Call - API (Delete WebHook)] action in IconButton widget.
  ApiCallResponse? apiResult;
  // Stores action output result for [Backend Call - API (Register WebHook)] action in IconButton widget.
  ApiCallResponse? apiResultsFalse;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  WebhooksRecord? webhookDataItem;
  bool apiRequestCompleted1 = false;
  String? apiRequestLastUniqueKey1;
  Completer<ApiCallResponse>? apiRequestCompleter5;
  bool apiRequestCompleted4 = false;
  String? apiRequestLastUniqueKey4;
  bool apiRequestCompleted3 = false;
  String? apiRequestLastUniqueKey3;
  // Model for PorfolioHistory component.
  late PorfolioHistoryModel porfolioHistoryModel;
  // State field(s) for CollectibleListView widget.

  PagingController<ApiPagingParams, dynamic>?
      collectibleListViewPagingController;
  Function(ApiPagingParams nextPageMarker)? collectibleListViewApiCall;

  /// Query cache managers for this widget.

  final _getTokenCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getTokenCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getTokenCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetTokenCacheCache() => _getTokenCacheManager.clear();
  void clearGetTokenCacheCacheKey(String? uniqueKey) =>
      _getTokenCacheManager.clearRequest(uniqueKey);

  final _getTransactionCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getTransactionCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getTransactionCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetTransactionCacheCache() => _getTransactionCacheManager.clear();
  void clearGetTransactionCacheCacheKey(String? uniqueKey) =>
      _getTransactionCacheManager.clearRequest(uniqueKey);

  final _getPortfolioHistoryCacheManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getPortfolioHistoryCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getPortfolioHistoryCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetPortfolioHistoryCacheCache() =>
      _getPortfolioHistoryCacheManager.clear();
  void clearGetPortfolioHistoryCacheCacheKey(String? uniqueKey) =>
      _getPortfolioHistoryCacheManager.clearRequest(uniqueKey);

  final _getNFTsCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getNFTsCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getNFTsCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetNFTsCacheCache() => _getNFTsCacheManager.clear();
  void clearGetNFTsCacheCacheKey(String? uniqueKey) =>
      _getNFTsCacheManager.clearRequest(uniqueKey);

  final _getENSDomainCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getENSDomainCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getENSDomainCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetENSDomainCacheCache() => _getENSDomainCacheManager.clear();
  void clearGetENSDomainCacheCacheKey(String? uniqueKey) =>
      _getENSDomainCacheManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    porfolioHistoryModel = createModel(context, () => PorfolioHistoryModel());
  }

  void dispose() {
    unfocusNode.dispose();
    porfolioHistoryModel.dispose();
    collectibleListViewPagingController?.dispose();

    /// Dispose query cache managers for this widget.

    clearGetTokenCacheCache();

    clearGetTransactionCacheCache();

    clearGetPortfolioHistoryCacheCache();

    clearGetNFTsCacheCache();

    clearGetENSDomainCacheCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted1;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted5({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter5?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted4;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted3;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForOnePageForCollectibleListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (collectibleListViewPagingController?.nextPageKey?.nextPageNumber ??
                  0) >
              0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setCollectibleListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    collectibleListViewApiCall = apiCall;
    return collectibleListViewPagingController ??=
        _createCollectibleListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic>
      _createCollectibleListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(collectibleListViewGetNFTsOwnedByAddressPage);
  }

  void collectibleListViewGetNFTsOwnedByAddressPage(
          ApiPagingParams nextPageMarker) =>
      collectibleListViewApiCall!(nextPageMarker)
          .then((collectibleListViewGetNFTsOwnedByAddressResponse) {
        final pageItems = (ChainBaseGroup.getNFTsOwnedByAddressCall
                    .items(
                      collectibleListViewGetNFTsOwnedByAddressResponse.jsonBody,
                    )!
                    .where((e) => e != null)
                    .toList() ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        collectibleListViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse:
                      collectibleListViewGetNFTsOwnedByAddressResponse,
                )
              : null,
        );
      });
}
