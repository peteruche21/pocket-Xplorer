import '/backend/api_requests/api_calls.dart';
import '/empty_widget/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'history_list_model.dart';
export 'history_list_model.dart';

class HistoryListWidget extends StatefulWidget {
  const HistoryListWidget({Key? key}) : super(key: key);

  @override
  _HistoryListWidgetState createState() => _HistoryListWidgetState();
}

class _HistoryListWidgetState extends State<HistoryListWidget> {
  late HistoryListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryListModel());
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
        child: PagedListView<ApiPagingParams, dynamic>.separated(
          pagingController: _model.setListViewController(
            (nextPageMarker) =>
                ChainBaseGroup.getTransactionsByAccountCall.call(
              chainId: FFAppState().networks.chainId,
              address: FFAppState().xploreAddress,
              page: nextPageMarker.nextPageNumber + 1,
            ),
          ),
          padding: EdgeInsets.fromLTRB(
            0,
            12.0,
            0,
            12.0,
          ),
          reverse: false,
          scrollDirection: Axis.vertical,
          separatorBuilder: (_, __) => SizedBox(height: 1.0),
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
                emptyText: 'Activity',
              ),
            ),
            itemBuilder: (context, _, activityIndex) {
              final activityItem =
                  _model.listViewPagingController!.itemList![activityIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.0,
                        color: FlutterFlowTheme.of(context).primary,
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Icon(
                              Icons.attach_money_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
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
                                Text(
                                  (String from, String address) {
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
                                      ? 'Out'
                                      : 'In',
                                  textAlign: TextAlign.end,
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
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          color: Color(0xA3C0C0C8),
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                  ),
                                ),
                              ],
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${functions.fromBigInt(getJsonField(
                                        activityItem,
                                        r'''$.value''',
                                      ).toString(), 18)} ${FFAppState().networks.nativeToken}',
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
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
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : FlutterFlowTheme.of(context)
                                                .accent2,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    dateTimeFormat(
                                      'yMMMd',
                                      DateTime.fromMillisecondsSinceEpoch(
                                          DateTime.parse(getJsonField(
                                        activityItem,
                                        r'''$.block_timestamp''',
                                      ).toString())
                                              .millisecondsSinceEpoch),
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
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
          ),
        ),
      ),
    );
  }
}
