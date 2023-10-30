
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

String formatAddress(
  String? xploreAddress,
  int length,
) {
  if (xploreAddress == null) return "";

  final prefix = xploreAddress.substring(0, 2 + length);
  final suffix = xploreAddress.substring(xploreAddress.length - length);
  return '$prefix...$suffix';
}

List<dynamic> getValidList(List<dynamic>? data) {
  if (data is List && data.isNotEmpty) {
    return data.where((element) {
      if (element is Map && element.containsKey("image_uri")) {
        final imageUri = element["image_uri"];
        return imageUri != null && imageUri is String && imageUri.isNotEmpty;
      }
      return false;
    }).toList();
  }

  return data is List ? data : [];
}

String translateIPFSUri(String? originalUri) {
  if (originalUri == null || originalUri == "null" || originalUri == "")
    return "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg";
  if (originalUri.startsWith('ipfs://')) {
    final cid = originalUri.substring(7);
    final httpUri = 'https://ipfs.io/ipfs/$cid';
    return httpUri;
  } else {
    return originalUri;
  }
}

String fromBigInt(
  String? bn,
  int? decimals,
) {
  if (bn == null || bn == "null") return "0";
  BigInt value = BigInt.parse(bn);
  double actualValue = value / BigInt.from(10).pow(decimals ?? 18);
  return actualValue.toStringAsFixed(3);
}

PortfolioHistoryStruct parsePortfolioData(List<dynamic> data) {
  List<int> xCoordinates = List.generate(31, (index) => index, growable: false);
  List<double> yCoordinates = List.generate(31, (index) {
    double totalTokenQuote = 0.0;
    for (var token in data) {
      if (token['holdings'].length > index) {
        final quote = token['holdings'][30 - index]['close']['quote'] ?? 0;
        totalTokenQuote += quote;
      }
    }
    return totalTokenQuote;
  }, growable: false);

  double netWorth = yCoordinates[30];

  double previousDayNetWorth = yCoordinates[29];
  double percentageChange = 0.0;
  bool percentChangePositive = false;

  if (previousDayNetWorth != 0) {
    percentageChange =
        ((netWorth - previousDayNetWorth) / previousDayNetWorth) * 100;
    percentChangePositive = percentageChange > 0;
  }

  double usdChange = netWorth - previousDayNetWorth;

  return PortfolioHistoryStruct(
      xCordinates: xCoordinates,
      yCordinates: yCoordinates,
      netWorth: netWorth.toStringAsFixed(3),
      percentChange: percentageChange.toStringAsFixed(2),
      percentChangePositive: percentChangePositive,
      usdChange: usdChange.toStringAsFixed(2));
}

List<dynamic> listOrNull(List<dynamic>? list) {
  return list is List && list.isNotEmpty ? list : [];
}
