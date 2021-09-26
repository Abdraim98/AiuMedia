import 'dart:async';
import 'dart:convert';
import "dart:core";
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:news_flutter/Utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WooCommerceAPI {
  String url;
  String consumerKey;
  String consumerSecret;
  bool isHttps;

  WooCommerceAPI() {
    this.url = BaseUrl;
    this.consumerKey = ConsumerKey;
    this.consumerSecret = ConsumerSecret;

    if (this.url.startsWith("https")) {
      this.isHttps = true;
    } else {
      this.isHttps = false;
    }
  }

  _getOAuthURL(String requestMethod, String endpoint) {
    var url = this.url + endpoint;
    var containsQueryParams = url.contains("?");

    // If website is HTTPS based, no need for OAuth, just return the URL with CS and CK as query params
    if (this.isHttps == true) {
      return url +
          (containsQueryParams == true
              ? "&consumer_key=" +
                  this.consumerKey +
                  "&consumer_secret=" +
                  this.consumerSecret
              : "?consumer_key=" +
                  this.consumerKey +
                  "&consumer_secret=" +
                  this.consumerSecret);
    }
  }

  Future<http.Response> getAsync(String endPoint,
      {requireToken = false}) async {
    var url = this._getOAuthURL("GET", endPoint);

    print(url);

    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.cacheControlHeader: 'no-cache',
    };

    if (requireToken) {
      SharedPreferences pref = await getSharedPref();
      var header = {
        "token": "${pref.getString(TOKEN)}",
        "id": "${pref.getInt(USER_ID)}"
      };
      headers.addAll(header);
    }
    final response = await http.get(url, headers: headers);
    print('${response.statusCode} $url');
    print(jsonDecode(response.body));
    return response;
  }

  Future<http.Response> postAsync(String endPoint, Map data,
      {requireToken = false}) async {
    var url = this._getOAuthURL("POST", endPoint);
    print(url);

    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.cacheControlHeader: 'no-cache',
    };
    if (requireToken) {
      SharedPreferences pref = await getSharedPref();
      var header = {
        "token": "${pref.getString(TOKEN)}",
        "id": "${pref.getInt(USER_ID)}"
      };
      headers.addAll(header);
    }

    print(jsonEncode(headers));
    print(jsonEncode(data));

    var client = new http.Client();
    var response =
        await client.post(url, body: jsonEncode(data), headers: headers);

    print(response.statusCode);
    print(jsonDecode(response.body));
    return response;
  }

  Future<http.Response> putAsync(String endPoint, Map data,
      {requireToken = false}) async {
    var url = this._getOAuthURL("POST", endPoint);
    print(url);

    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.cacheControlHeader: 'no-cache',
    };
    if (requireToken) {
      SharedPreferences pref = await getSharedPref();
      var header = {
        "token": "${pref.getString(TOKEN)}",
        "id": "${pref.getInt(USER_ID)}"
      };
      headers.addAll(header);
    }

    print(jsonEncode(headers));
    print(jsonEncode(data));

    var client = new http.Client();
    var response =
    await client.put(url, body: jsonEncode(data), headers: headers);

    print(response.statusCode);
    print(jsonDecode(response.body));
    return response;
  }

  Future<http.Response> deleteAsync(String endPoint) async {
    var url = this._getOAuthURL("DELETE", endPoint);
    print(url);
    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.cacheControlHeader: 'no-cache',
    };
    var client = new http.Client();

    final response = await client.delete(url, headers: headers);

    return response;
  }

}
