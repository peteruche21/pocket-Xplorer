import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'switch_network_model.dart';
export 'switch_network_model.dart';

class SwitchNetworkWidget extends StatefulWidget {
  const SwitchNetworkWidget({
    Key? key,
    required this.actions,
  }) : super(key: key);

  final Future<dynamic> Function()? actions;

  @override
  _SwitchNetworkWidgetState createState() => _SwitchNetworkWidgetState();
}

class _SwitchNetworkWidgetState extends State<SwitchNetworkWidget> {
  late SwitchNetworkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchNetworkModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: 300.0,
        height: 520.0,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 8.0),
                    child: Text(
                      'Select Network',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.updatePage(() {
                              FFAppState().networks = NetworkInfoStruct(
                                chainId: 1,
                                networkName: 'eth-mainnet',
                                nativeToken: 'ETH',
                                explorer: 'https://etherscan.io',
                                webhookTopic: 'ethereum_erc20_transfer',
                              );
                            });
                            Navigator.pop(context);
                            await widget.actions?.call();
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.networkHovered1? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondary,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Image.asset(
                                        'assets/images/Ethereum.png',
                                        width: 32.0,
                                        height: 32.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Ethereum',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          setState(() => _model.networkHovered1 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.networkHovered1 = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.updatePage(() {
                              FFAppState().networks = NetworkInfoStruct(
                                chainId: 137,
                                networkName: 'matic-mainnet',
                                nativeToken: 'MATIC',
                                explorer: 'https://polygonscan.com',
                                webhookTopic: 'polygon_erc20_transfer',
                              );
                            });
                            Navigator.pop(context);
                            await widget.actions?.call();
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.networkHovered2? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondary,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Image.asset(
                                        'assets/images/Polygon.png',
                                        width: 32.0,
                                        height: 32.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Polygon',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          setState(() => _model.networkHovered2 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.networkHovered2 = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.updatePage(() {
                              FFAppState().networks = NetworkInfoStruct(
                                chainId: 42161,
                                networkName: 'arbitrum-mainnet',
                                nativeToken: 'ETH',
                                explorer: 'https://arbiscan.io',
                                webhookTopic: 'arbitrum_erc20_transfer',
                              );
                            });
                            Navigator.pop(context);
                            await widget.actions?.call();
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.networkHovered3? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondary,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Image.asset(
                                        'assets/images/Arbitrum.png',
                                        width: 32.0,
                                        height: 32.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Arbitrum',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          setState(() => _model.networkHovered3 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.networkHovered3 = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.updatePage(() {
                              FFAppState().networks = NetworkInfoStruct(
                                chainId: 10,
                                networkName: 'optimism-mainnet',
                                nativeToken: 'ETH',
                                explorer: 'https://optimistic.etherscan.io',
                                webhookTopic: 'optimism_erc20_transfer',
                              );
                            });
                            Navigator.pop(context);
                            await widget.actions?.call();
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.networkHovered4? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondary,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Image.asset(
                                        'assets/images/Optimism.png',
                                        width: 32.0,
                                        height: 32.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Optimism',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          setState(() => _model.networkHovered4 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.networkHovered4 = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.updatePage(() {
                              FFAppState().networks = NetworkInfoStruct(
                                chainId: 8453,
                                networkName: 'base-mainnet',
                                nativeToken: 'ETH',
                                explorer: 'https://basescan.org',
                                webhookTopic: 'base_erc20_transfer',
                              );
                            });
                            Navigator.pop(context);
                            await widget.actions?.call();
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.networkHovered5? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondary,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Image.asset(
                                        'assets/images/Base.png',
                                        width: 32.0,
                                        height: 32.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Base',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          setState(() => _model.networkHovered5 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.networkHovered5 = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.updatePage(() {
                              FFAppState().networks = NetworkInfoStruct(
                                chainId: 43114,
                                networkName: 'avalanche-mainnet',
                                nativeToken: 'AVAX',
                                explorer: 'https://snowtrace.io',
                                webhookTopic: 'avalanche_erc20_transfer',
                              );
                            });
                            Navigator.pop(context);
                            await widget.actions?.call();
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.networkHovered6? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondary,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Image.asset(
                                        'assets/images/Avalanche.png',
                                        width: 32.0,
                                        height: 32.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Avalanche',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          setState(() => _model.networkHovered6 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.networkHovered6 = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.updatePage(() {
                              FFAppState().networks = NetworkInfoStruct(
                                chainId: 56,
                                networkName: 'bsc-mainnet',
                                nativeToken: 'BSC',
                                explorer: 'https://bscscan.com',
                                webhookTopic: 'bsc_erc20_transfer',
                              );
                            });
                            Navigator.pop(context);
                            await widget.actions?.call();
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.networkHovered7? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondary,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Image.asset(
                                        'assets/images/BSC.png',
                                        width: 32.0,
                                        height: 32.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'BSC',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          setState(() => _model.networkHovered7 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.networkHovered7 = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.updatePage(() {
                              FFAppState().networks = NetworkInfoStruct(
                                chainId: 324,
                                networkName: 'zksync-mainnet',
                                nativeToken: 'ETH',
                                explorer: 'https://explorer.zksync.io',
                                webhookTopic: 'zksync_erc20_transfer',
                              );
                            });
                            Navigator.pop(context);
                            await widget.actions?.call();
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.networkHovered8? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).secondary,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Image.asset(
                                        'assets/images/zksync.png',
                                        width: 32.0,
                                        height: 32.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'zkSync',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          setState(() => _model.networkHovered8 = true);
                        }),
                        onExit: ((event) async {
                          setState(() => _model.networkHovered8 = false);
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
