import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/widgets_utils/web_view_global.dart';
import 'package:vemare/app/providers/footer_provider.dart';
import 'package:vemare/app/view/claims/claims_page.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/work_with_us/work_with_us_home.dart';
import 'package:vemare/main.dart';

import 'package:clean_calendar/clean_calendar.dart';

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

    FooterProvider footerProvider = Provider.of<FooterProvider>(context);

    String urlFacebook = '';
    String urLinstagram = '';
    String urlYoutube = '';
    String urlLinkedin = '';

    String urlLocation = '';
    String urlTelephone = '';
    String urlEmail = '';

    if(footerProvider.dataFooter.isNotEmpty && footerProvider.dataFooter.containsKey('redes')){
      urlFacebook = footerProvider.dataFooter['redes']['facebook'] ?? 'https://www.facebook.com/transcose';
      urLinstagram = footerProvider.dataFooter['redes']['instagram'] ?? 'https://www.instagram.com/adtranscose';
      urlYoutube = footerProvider.dataFooter['redes']['youtube'] ?? 'https://www.youtube.com/channel/UCO9t81VyZqRfY4oSIGkD9aQ';
      urlLinkedin = footerProvider.dataFooter['redes']['linkedin'] ?? 'https://www.linkedin.com/company/especialistas-diesel-iberia-edi';
    }

    if(footerProvider.dataFooter.isNotEmpty && footerProvider.dataFooter.containsKey('info')){
      urlLocation = footerProvider.dataFooter['info']['location'] ?? 'C/ Diesel, 32. 28906 - Getafe - Madrid';
      urlTelephone = footerProvider.dataFooter['info']['telephone'] ?? '91 649 60 20';
      urlEmail = footerProvider.dataFooter['info']['email'] ?? 'marketing@transcose.com';
    }

    Map<int,String> urlMap = {
      1 : urlFacebook,
      2 : urLinstagram,
      3 : urlYoutube,
      5 : urlLinkedin,
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
                for(int x = 0; x < urlMap.length; x++) Expanded(
                  child: GestureDetector(
                    onTap: (){
                      if(x == 0){
                        launchUrlString(urlMap[urlMap.keys.elementAt(x)]!);
                      }else{
                        Navigator.push(context, MaterialPageRoute(builder:
                            (BuildContext context) => WebViewGlobal(url: urlMap[urlMap.keys.elementAt(x)]!,local: false,)));
                      }
                    },
                    child: Image.asset(
                      'assets/icons/rs_${urlMap.keys.elementAt(x)}.png',
                      width: 10,height: 30,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: (){
              if(!LocalDataRepository().isLogged){
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginPage.route, (route) => false);
              }else{
                Navigator.pushNamed(context, WorkWithUsHome.route,
                    arguments: homeStateGlobal.workWithUs);
              }
            },
            child: const Column(
              children: [
                Text(
                  'Trabaja con nosotros',
                  style: AppTextStyle.nunitoSansFooter,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Saber más →',
                  style: AppTextStyle.nunitoSansFooter,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          if(isClaims)...[
            const SizedBox(height: 20),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, ClaimsPage.route);
              },
              child: const Column(
                children: [
                  Text('Canal de denuncias',style: AppTextStyle.nunitoSansFooter,textAlign: TextAlign.center,),
                  SizedBox(height: 20),
                  Text('Ir al canal →',style: AppTextStyle.nunitoSansFooter,textAlign: TextAlign.center,),
                ],
              ),
            ),
          ],
          const SizedBox(height: 20),
          const Text(
            'Contacto',
            style: AppTextStyle.nunitoSansFooter22,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/icons/Location.png',
            width: 30,height: 30,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Text(
            urlLocation,
            style: AppTextStyle.nunitoSansFooter,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: (){
              launchUrlString('tel:$urlTelephone');
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/Phone.png',
                  width: 30,height: 30,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                Text(
                  urlTelephone,
                  style: AppTextStyle.nunitoSansFooter,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              String url = "mailto:$urlEmail?subject=Contacto con Transcose";
              launchUrlString(url, mode: LaunchMode.externalApplication);
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/Mail.png',
                  width: 30,height: 30,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                Text(
                  urlEmail,
                  style: AppTextStyle.nunitoSansFooter,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
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


  Widget footerCalendar(){
    return SizedBox(
      width: double.infinity,
      child: CleanCalendar(
        weekdaysSymbol: const Weekdays(sunday: "l", monday: "m", tuesday: "m", wednesday: "j", thursday: "v", friday: "s", saturday: "d"),
        monthsSymbol: const Months(january: "Enero", february: "Febrero", march: "Marzo", april: "Abril", may: "Mayo", june: "Junio", july: "Julio", august: "Agosto", september: "Septiembre", october: "Octubre", november: "Noviembre", december: "Diciembre"),
        datesForStreaks: [
          DateTime(2024, 1, 23),
          DateTime(2024, 1, 24),
        ],
        selectedDates: [
          DateTime(2024, 1, 23),
          DateTime(2024, 1, 24),
        ],

      ),
    );
  }
}
