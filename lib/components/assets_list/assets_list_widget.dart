import '/backend/api_requests/api_calls.dart';
import '/empty_widget/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'assets_list_model.dart';
export 'assets_list_model.dart';

class AssetsListWidget extends StatefulWidget {
  const AssetsListWidget({
    Key? key,
    bool? expansible,
  })  : this.expansible = expansible ?? false,
        super(key: key);

  final bool expansible;

  @override
  _AssetsListWidgetState createState() => _AssetsListWidgetState();
}

class _AssetsListWidgetState extends State<AssetsListWidget> {
  late AssetsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssetsListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: MediaQuery.sizeOf(context).height * 0.87,
      decoration: BoxDecoration(),
      child: RefreshIndicator(
        color: FlutterFlowTheme.of(context).primary,
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        onRefresh: () async {
          setState(() => _model.listViewPagingController?.refresh());
          await _model.waitForOnePageForListView(minWait: 4000);
        },
        child: PagedListView<ApiPagingParams, dynamic>(
          pagingController: _model.setListViewController(
            (nextPageMarker) => ChainBaseGroup.getERCTokenBalancesCall.call(
              chainId: FFAppState().networks.chainId,
              address: FFAppState().xploreAddress,
              page: nextPageMarker.nextPageNumber + 1,
            ),
          ),
          padding: EdgeInsets.zero,
          reverse: false,
          scrollDirection: Axis.vertical,
          builderDelegate: PagedChildBuilderDelegate<dynamic>(
            // Customize what your widget looks like when it's loading the first page.
            firstPageProgressIndicatorBuilder: (_) => Center(
              child: SizedBox(
                width: 35.0,
                height: 35.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 35.0,
                ),
              ),
            ),
            // Customize what your widget looks like when it's loading another page.
            newPageProgressIndicatorBuilder: (_) => Center(
              child: SizedBox(
                width: 35.0,
                height: 35.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 35.0,
                ),
              ),
            ),
            noItemsFoundIndicatorBuilder: (_) => Center(
              child: EmptyListWidget(
                emptyText: 'Crypto',
              ),
            ),
            itemBuilder: (context, _, assetsIndex) {
              final assetsItem =
                  _model.listViewPagingController!.itemList![assetsIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.5, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 64.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 32.0,
                          height: 32.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl:
                                '${functions.translateIPFSUri(getJsonField(
                              assetsItem,
                              r'''$.logos[0].uri''',
                            ).toString())}',
                            fit: BoxFit.cover,
                            errorWidget: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/error_image.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  getJsonField(
                                    assetsItem,
                                    r'''$.name''',
                                  ).toString().maybeHandleOverflow(
                                        maxChars: 25,
                                        replacement: '…',
                                      ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
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
                                      maxChars: 35,
                                      replacement: '…',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          '\$${(num? usdPrice) {
                            return usdPrice?.toStringAsFixed(2) ?? "0.00";
                          }(getJsonField(
                            assetsItem,
                            r'''$.current_usd_price''',
                          ))}',
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                      ],
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
