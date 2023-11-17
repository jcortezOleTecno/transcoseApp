import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/widgets_utils/circular_progress_colors.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/theme/color.dart';

class WebViewGlobal extends StatefulWidget {
  const WebViewGlobal({Key? key,
    required this.url,
    this.local = true,
    this.backActive = false
  }) : super(key: key);

  final String url;
  final bool local;
  final bool backActive;

  @override
  State<WebViewGlobal> createState() => _WebViewGlobalState();
}

class _WebViewGlobalState extends State<WebViewGlobal> {

  InAppWebViewController? _webViewController;
  String url = "";
  double progress = 0;
  bool loadInitial = false;
  
  @override
  void initState() {
    super.initState();
    url = widget.url;
    if(widget.local){
      url = '$url?app_bar=1';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exit,
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
        widget.backActive ?
        MyBodyBack(
          spacerTop: 45,
          child: childW(),
        ) :
        MyBody(
          spacerTop: 45,
          child: childW(),
        ),
      ),
    );
  }

  Widget childW(){
    return SafeArea(
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: (progress < 1.0 && !loadInitial) ? 0 : 1,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse(url),),// .https("${BASE_API_URL.replaceAll('https://', '')}\/politicas-de-privacidad")),
                  initialOptions: InAppWebViewGroupOptions(
                      android: AndroidInAppWebViewOptions(

                      )
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
