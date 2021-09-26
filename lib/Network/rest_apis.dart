import 'package:news_flutter/Network/woo_commerce_api.dart';
import 'package:news_flutter/Utils/constant.dart';

import 'NetworkUtils.dart';

Future login(request) async {
  return handleResponse(await postRequest('jwt-auth/v1/token', request, requireToken: false));
}

Future createUser(request) async {
  return handleResponse(await postRequest('iqonic-api/api/v1/user/register', request, requireToken: false));
}

Future updateUser(id, request) async {
  return handleResponse(await WooCommerceAPI().postAsync('wc/v3/customers/$id', request));
}

Future getDashboardApi() async {
  return handleResponse(await getRequest('iqonic-api/api/v1/blog/get-dashboard'));
}

Future saveProfileImage(request) async {
  return handleResponse(await postRequest('iqonic-api/api/v1/user/save-profile-image', request,requireToken: true));
}

Future getCategories() async {
  return handleResponse(await getRequest('wp/v2/$categories'));
}

Future getBlogList(Map request) async {
  return handleResponse(await postRequest('iqonic-api/api/v1/blog/get-blog-by-filter', request));
}

Future getSearchBlogList(Map request) async {
  return handleResponse(await postRequest('iqonic-api/api/v1/blog/get-blog-by-filter', request),);
}

Future getPostDetail(int id) async {
  return handleResponse(await getRequest('posts/$id'));
}

Future getCommentList(int id) async {
  return handleResponse(await getRequest('wp/v2/comments/?post=$id'));
}

Future postComment(request) async {
  return handleResponse(await postRequest('iqonic-api/api/v1/blog/post-comment', request,requireToken: true));
}

Future forgotPassword(request) async {
  return handleResponse(await postRequest('iqonic-api/api/v1/user/forget-password', request));
}

Future changePassword(request) async {
  return handleResponse(await postRequest('iqonic-api/api/v1/user/change-password', request, requireToken: true));
}
