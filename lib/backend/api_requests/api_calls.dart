import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class StatesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'states',
      apiUrl: 'https://servicodados.ibge.gov.br/api/v1/localidades/distritos',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StripeRefusedCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
   "amount": "6220",
   "payment_intent": "pi_3OHwhMAnZIwkGSkU0SHuvqDg",
   "reason": "teste"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Stripe Refused',
      apiUrl: 'https://api.stripe.com/v1/refunds',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk_test_51OGTjPAnZIwkGSkUDMC7ltsx09qJvI4lNkactvdRXFGVxMnBoyUmm89bhugxC8IoA8SjSnhAIOtxDAbm75GGZGY300dJ0AiOJF',
        'Content-Type': 'application/x-www-form-urlencoded',
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
