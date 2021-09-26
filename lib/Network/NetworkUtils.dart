import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Utils/Strings.dart';
import 'package:news_flutter/Utils/constant.dart';

bool isSuccessful(int code) {
  return code >= 200 && code <= 206;
}

getRequest(String endPoint, {bool requireToken}) async {
  if (await isNetworkAvailable()) {
    Response response = await get('$BaseUrl$endPoint');
    print('$BaseUrl$endPoint');
    print('${response.statusCode} ${jsonDecode(response.body)}');
    return response;
  } else {
    throw noInternetMsg;
  }
}

postRequest(String endPoint, Map request, {bool requireToken = false}) async {
  if (await isNetworkAvailable()) {
    print('URL: $BaseUrl$endPoint');
    print('Request: $request');

    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.cacheControlHeader: 'no-cache',
      HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
    };

    if (requireToken) {
      var header = {"token": "${await getString(TOKEN)}", "id": "${await getInt(USER_ID)}"};
      headers.addAll(header);
    }

    print(headers);
    Response response = await post('$BaseUrl$endPoint', body: jsonEncode(request), headers: headers);
    print('Response: ${response.statusCode} ${response.body}');
    return response;
  } else {
    throw noInternetMsg;
  }
}

Future handleResponse(Response response) async {
  if (!await isNetworkAvailable()) {
    throw noInternetMsg;
  }
  if (isSuccessful(response.statusCode)) {
    return jsonDecode(response.body);
  } else {
    throw errorMsg;
  }
}

Future<bool> isJsonValid(json) async {
  try {
    var f = jsonDecode(json) as Map<String, dynamic>;
    return true;
  } catch (e) {
    print(e.toString());
  }
  return false;
}
