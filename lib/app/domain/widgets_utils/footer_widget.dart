import 'package:flutter/material.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/widgets_utils/web_view_global.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          columnTop(context: context),
          columnBottom(context: context),
        ],
      ),
    );
  }

  Widget columnTop({required BuildContext context}){

    Map<int,String> urlMap = {
      1 : 'https://www.facebook.com/grupovemare',
      2 : 'https://www.instagram.com/grupovemare/',
      3 : 'https://www.youtube.com/@grupovemare7851',
      4 : 'https://www.linkedin.com/company/grupo-vemare',
      5 : 'https://www.facebook.com/grupovemare',
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: AppColor.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, HomePage.route, (route) => false),
            child: Image.asset(
              'assets/imgs/logo_foot.png',
              width: 120,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Redes Sociales',
            style: AppTextStyle.nunitoSansFooter,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                for(int x = 1; x < 6; x++) Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (BuildContext context) => WebViewGlobal(url: urlMap[x]!,local: false,)));
                    },
                    child: Image.asset(
                      'assets/icons/rs_$x.png',
                      width: 10,height: 30,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Trabaja con nosotros',
            style: AppTextStyle.nunitoSansFooter,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Saber más →',
            style: AppTextStyle.nunitoSansFooter,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Canal de denuncias',
            style: AppTextStyle.nunitoSansFooter,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Ir al canal →',
            style: AppTextStyle.nunitoSansFooter,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Contacto',
            style: AppTextStyle.nunitoSansFooter,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/icons/Location.png',
            width: 30,height: 30,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const Text(
            'C/ Diesel, 32. 28906 - Getafe - Madrid',
            style: AppTextStyle.nunitoSansFooter,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/icons/Phone.png',
            width: 30,height: 30,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const Text(
            '91 649 60 20',
            style: AppTextStyle.nunitoSansFooter,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/icons/Mail.png',
            width: 30,height: 30,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const Text(
            'vemare@grupovemare.com',
            style: AppTextStyle.nunitoSansFooter,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget columnBottom({required BuildContext context}){
    TextStyle style = AppTextStyle.nunitoSansFooter;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: AppColor.blue600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:
                  (BuildContext context) => WebViewGlobal(url: '$BASE_API_URL/politicas-de-privacidad')));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Política de Privacidad y terminos de uso',style: style,textAlign: TextAlign.center,),
            ),

          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:
                  (BuildContext context) => WebViewGlobal(url: '$BASE_API_URL/politicas-de-cookies')));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Política de cookies',style: style,textAlign: TextAlign.center,),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:
                  (BuildContext context) => WebViewGlobal(url: '$BASE_API_URL/aviso-legal')));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Aviso legal',style: style,textAlign: TextAlign.center,),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:
                  (BuildContext context) => WebViewGlobal(url: '$BASE_API_URL/condiciones-de-compra')));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Condiciones de compra',style: style,textAlign: TextAlign.center,),
            ),
          ),
        ],
      ),
    );
  }
}
