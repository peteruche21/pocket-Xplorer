import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Chain Base Group Code

class ChainBaseGroup {
  static String baseUrl = 'https://api.chainbase.online/v1';
  static Map<String, String> headers = {
    'accept': 'application/json',
    'x-api-key': '2XGB8lcFSea5vlmFijhRe1KAyUY',
  };
  static GetNativeTokenBalanceCall getNativeTokenBalanceCall =
      GetNativeTokenBalanceCall();
  static GetERCTokenBalancesCall getERCTokenBalancesCall =
      GetERCTokenBalancesCall();
  static GetNFTsOwnedByAddressCall getNFTsOwnedByAddressCall =
      GetNFTsOwnedByAddressCall();
  static GetFloorPriceByCollectionCall getFloorPriceByCollectionCall =
      GetFloorPriceByCollectionCall();
  static GetTokenTransfersByContractCall getTokenTransfersByContractCall =
      GetTokenTransfersByContractCall();
  static GetTokenPriceCall getTokenPriceCall = GetTokenPriceCall();
  static GetENSDomainsCall getENSDomainsCall = GetENSDomainsCall();
  static GetTransactionsByAccountCall getTransactionsByAccountCall =
      GetTransactionsByAccountCall();
  static RegisterWebHookCall registerWebHookCall = RegisterWebHookCall();
  static DeleteWebHookCall deleteWebHookCall = DeleteWebHookCall();
}

class GetNativeTokenBalanceCall {
  Future<ApiCallResponse> call({
    int? chainId,
    String? address = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get native token balance',
      apiUrl: '${ChainBaseGroup.baseUrl}/account/balance',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'x-api-key': '2XGB8lcFSea5vlmFijhRe1KAyUY',
      },
      params: {
        'chain_id': chainId,
        'address': address,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic balance(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class GetERCTokenBalancesCall {
  Future<ApiCallResponse> call({
    int? chainId,
    String? address = '',
    int? limit = 20,
    int? page,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get ERC token balances',
      apiUrl: '${ChainBaseGroup.baseUrl}/account/tokens',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'x-api-key': '2XGB8lcFSea5vlmFijhRe1KAyUY',
      },
      params: {
        'chain_id': chainId,
        'address': address,
        'limit': limit,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic items(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$.count''',
      );
  dynamic nextPage(dynamic response) => getJsonField(
        response,
        r'''$.next_page''',
      );
  dynamic statusCode(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
}

class GetNFTsOwnedByAddressCall {
  Future<ApiCallResponse> call({
    int? chainId,
    String? address = '',
    int? page,
    int? limit = 20,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get NFTs owned by address',
      apiUrl: '${ChainBaseGroup.baseUrl}/account/nfts',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'x-api-key': '2XGB8lcFSea5vlmFijhRe1KAyUY',
      },
      params: {
        'chain_id': chainId,
        'address': address,
        'page': page,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic items(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic nextPage(dynamic response) => getJsonField(
        response,
        r'''$.next_page''',
      );
  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$.count''',
      );
  dynamic statusCode(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
}

class GetFloorPriceByCollectionCall {
  Future<ApiCallResponse> call({
    int? chainId,
    String? contractAddress = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get floor price by collection',
      apiUrl: '${ChainBaseGroup.baseUrl}/nft/floor_price',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'x-api-key': '2XGB8lcFSea5vlmFijhRe1KAyUY',
      },
      params: {
        'chain_id': chainId,
        'contract_address': contractAddress,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data.name''',
      );
  dynamic symbol(dynamic response) => getJsonField(
        response,
        r'''$.data.symbol''',
      );
  dynamic floorPrice(dynamic response) => getJsonField(
        response,
        r'''$.data.floor_price''',
      );
  dynamic floorPriceSymbol(dynamic response) => getJsonField(
        response,
        r'''$.data.floor_price_symbol''',
      );
}

class GetTokenTransfersByContractCall {
  Future<ApiCallResponse> call({
    int? chainId,
    String? contractAddress = '',
    String? address = '',
    int? page,
    int? limit,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get token transfers by contract',
      apiUrl: '${ChainBaseGroup.baseUrl}/token/transfers',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'x-api-key': '2XGB8lcFSea5vlmFijhRe1KAyUY',
      },
      params: {
        'chain_id': chainId,
        'contract_address': contractAddress,
        'address': address,
        'page': page,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic transfers(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$.count''',
      );
  dynamic nextPage(dynamic response) => getJsonField(
        response,
        r'''$.next_page''',
      );
}

class GetTokenPriceCall {
  Future<ApiCallResponse> call({
    int? chainId,
    String? contractAddress = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get token price',
      apiUrl: '${ChainBaseGroup.baseUrl}/token/price',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'x-api-key': '2XGB8lcFSea5vlmFijhRe1KAyUY',
      },
      params: {
        'chain_id': chainId,
        'contract_address': contractAddress,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.data.price''',
      );
  dynamic symbol(dynamic response) => getJsonField(
        response,
        r'''$.data.symbol''',
      );
  dynamic decimals(dynamic response) => getJsonField(
        response,
        r'''$.data.decimals''',
      );
  dynamic updatedAt(dynamic response) => getJsonField(
        response,
        r'''$.data.updated_at''',
      );
}

class GetENSDomainsCall {
  Future<ApiCallResponse> call({
    String? address = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get ENS domains',
      apiUrl: '${ChainBaseGroup.baseUrl}/ens/reverse',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'x-api-key': '2XGB8lcFSea5vlmFijhRe1KAyUY',
      },
      params: {
        'chain_id': "1",
        'address': address,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
      );
}

class GetTransactionsByAccountCall {
  Future<ApiCallResponse> call({
    int? chainId,
    String? address = '',
    int? page,
    int? limit = 20,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get transactions by account',
      apiUrl: '${ChainBaseGroup.baseUrl}/account/txs',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'x-api-key': '2XGB8lcFSea5vlmFijhRe1KAyUY',
      },
      params: {
        'chain_id': chainId,
        'address': address,
        'page': page,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic items(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic nextPage(dynamic response) => getJsonField(
        response,
        r'''$.next_page''',
      );
  dynamic count(dynamic response) => getJsonField(
        response,
        r'''$.count''',
      );
  dynamic statusCode(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
}

class RegisterWebHookCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? topic = '',
    String? xploreAddress = '',
    String? webhookName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "additional_headers": [
    {
      "name": "user-id",
      "value": "$userId"
    }
  ],
  "webhook_name": "$webhookName",
  "webhook_url": "https://sendnotification-e26hvuklwa-uc.a.run.app",
  "data_source": "$topic",
  "filters": [
    {
      "values": [
        "$xploreAddress"
      ],
      "field": "walletAddress"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register WebHook',
      apiUrl: '${ChainBaseGroup.baseUrl}/webhooks',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'x-api-key': '2XGB8lcFSea5vlmFijhRe1KAyUY',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteWebHookCall {
  Future<ApiCallResponse> call({
    String? webhookId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete WebHook',
      apiUrl: '${ChainBaseGroup.baseUrl}/webhooks/$webhookId',
      callType: ApiCallType.DELETE,
      headers: {
        'accept': 'application/json',
        'x-api-key': '2XGB8lcFSea5vlmFijhRe1KAyUY',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Chain Base Group Code

class GetHistoricalPortfolioRecordCall {
  static Future<ApiCallResponse> call({
    String? network = '',
    String? address = '',
    int? days = 30,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Historical Portfolio Record',
      apiUrl:
          'https://api.covalenthq.com/v1/$network/address/$address/portfolio_v2/',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Basic Y3F0X3JReGhQVGtLbVBZTVl0WVRZQjlmQ0ZUZ3JyWTc6',
      },
      params: {
        'days': days,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic portfolio(dynamic response) => getJsonField(
        response,
        r'''$.data.items''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
