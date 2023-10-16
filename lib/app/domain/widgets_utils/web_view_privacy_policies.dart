import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/widgets_utils/circular_progress_colors.dart';
import 'package:vemare/app/view/theme/color.dart';

class WebViewPrivacyPolicies extends StatefulWidget {
  const WebViewPrivacyPolicies({Key? key}) : super(key: key);

  @override
  State<WebViewPrivacyPolicies> createState() => _WebViewPrivacyPoliciesState();
}

class _WebViewPrivacyPoliciesState extends State<WebViewPrivacyPolicies> {

  InAppWebViewController? _webViewController;
  String url = "";
  double progress = 0;
  bool loadInitial = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exit,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            child: Stack(
              children: <Widget>[
                Opacity(
                  opacity: (progress < 1.0 && !loadInitial) ? 0 : 1,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: InAppWebView(
                      initialUrlRequest: URLRequest(url: Uri.parse('$BASE_API_URL/politicas-de-privacidad')),// .https("${BASE_API_URL.replaceAll('https://', '')}\/politicas-de-privacidad")),
                      initialOptions: InAppWebViewGroupOptions(
                          android: AndroidInAppWebViewOptions()
                      ),
                      onWebViewCreated: (InAppWebViewController controller) {
                        _webViewController = controller;
                      },
                      onLoadStart: (InAppWebViewController controller, Uri? url) {
                        setState(() {
                          this.url = url!.path;
                        });
                      },
                      onLoadStop: (InAppWebViewController controller, Uri? url) async {
                        setState(() {
                          this.url = url!.path;
                        });
                      },
                      onProgressChanged: (InAppWebViewController controller, int progress) {
                        setState(() {
                          this.progress = progress / 100;
                          if(this.progress == 1){
                            loadInitial = true;
                          }
                        });
                      },

                    ),
                  ),
                ),
                if(progress < 1.0)...[
                  Center(
                    child: circularProgressColors(
                        colorCircular: loadInitial ?
                        AppColor.blue :
                        Colors.white,
                        widthContainer1: 30,
                        widthContainer2: 30
                    ),
                  )
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<bool> exit() async {
    // if (_webViewController != null) {
    //   if (await _webViewController!.canGoBack()) {
    //     WebHistory? webHistory = await _webViewController!.getCopyBackForwardList();
    //     if (webHistory != null && webHistory.currentIndex! <= 0) {
    //       return false;
    //     }
    //     _webViewController!.goBack();
    //     return false;
    //   }
    // }
    // return false;
    return true;
  }
}
