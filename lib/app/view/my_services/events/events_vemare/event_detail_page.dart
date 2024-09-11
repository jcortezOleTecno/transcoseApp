import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/domain/model/events_vemare.dart';
import 'package:vemare/app/domain/model/galery.dart';
import 'package:vemare/app/domain/utils/download_and_save_file.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/domain/widgets_utils/circular_progress_colors.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/my_video_player/my_video_player.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/widgets/event_detail_images_page.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/widgets/event_detail_videos_page.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage(this.event, {super.key});
  static const route = '/event_detail_page';

  final EventsHeld event;

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {

  late PaginationLogic logic;

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    logic.removeOnListener();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (context1) => PaginationLogic(
            contextController: context,
            galleryAux: widget.event.gallery ?? [],
            videosAux: widget.event.videos ?? []
        ),
        child: Consumer<PaginationLogic>(
            builder: (context2, provider, child){
              logic = provider;
              return Scaffold(
                body: MyBody(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MyBackButton(
                          edgeInsets: EdgeInsets.symmetric(horizontal: 0,vertical: 6),
                        ),
                        Text(widget.event.title ?? '', style: AppTextStyle.h2Style),
                        spacerS,
                        if(logic.pageSelect == 0)...[
                          MyIconButton(
                            onPressed: (){
                              logic.downloadImages();
                            },
                            text: logic.imageCheck.isEmpty ? 'Descargar todas las fotos' : 'Descargar ${logic.imageCheck.length} imágenes',
                            icon: logic.loadDownLoadImage ?
                            circularProgressColors() :
                            Image.asset(
                              'assets/icons/Download.png',
                              scale: 1.5,
                            ),
                            variant: MyButtonVariant.outlinedBold,
                          ),
                          spacerS,
                        ],
                        buttonsHeader(),
                        if(logic.pageSelect == 0)...[
                          const Expanded(
                            child: EventDetailImagesPage(),
                          ),
                        ],
                        if(logic.pageSelect == 1)...[
                          const Expanded(
                            child: EventDetailVideosPage(),
                          ),
                        ],
                        if (logic.loadingImage || logic.loadingVideo)...[
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Center(
                              child: circularProgressColors(),
                            ),
                          ),
                        ],
                        spacerS,
                      ],
                    ),
                  ),
                ),
              );
            }
        )
    );
  }

  Widget buttonsHeader(){
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded( child: cardButtons(type: 0),),
          Expanded( child: cardButtons(type: 1),),
        ],
      ),
    );
  }

  Widget cardButtons({required int type}){
    String title = type == 0 ? 'Imágenes' : 'Videos';
    bool select = logic.pageSelect == type;

    return InkWell(
      onTap: (){
        logic.pageSelect = type;
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: select ? AppColor.blue100 : Colors.transparent,
              child: Center(
                child: Text(title,style: AppTextStyle.h12StyleNeu40W700.copyWith(
                    fontSize: 20, color: AppColor.primary, fontWeight: select ? FontWeight.bold : FontWeight.normal
                ),),
              ),
            ),
            if(select)...[
              Container(
                width: double.infinity,height: 2,
                color: AppColor.primary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(
      this.galery, {
        required this.contextPage,
        Key? key,
      }) : super(key: key);

  final Gallery galery;
  final BuildContext contextPage;

  @override
  Widget build(BuildContext context) {

    PaginationLogic paginationLogic = Provider.of<PaginationLogic>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 220,
      width: double.infinity,
      child: Stack(fit: StackFit.expand, children: [
        InkWell(
          onTap: (){
            galleryImages(paginationLogic: paginationLogic);
          },
          child: MyNetworkImage(
            image: galery.imagen,
            fit: BoxFit.cover,
            height: 220,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  DownloadButton(galery: galery),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: paginationLogic.imageCheck.contains(galery.id),
              activeColor: AppColor.primary,
              checkColor: AppColor.white,
              hoverColor: AppColor.white,
              focusColor: AppColor.white,
              fillColor: MaterialStateProperty.resolveWith((states) {
                // If the button is pressed, return green, otherwise blue
                if (states.contains(MaterialState.selected)) {
                  return AppColor.primary;
                }
                return AppColor.white;
              }),
              onChanged: (value){
                if(value ?? false){
                  paginationLogic.addImageCheck(idImg: galery.id);
                }else{
                  paginationLogic.removeImageCheck(idImg: galery.id);
                }
              },
            ),
          ),
        )
      ]),
    );
  }

  Future galleryImages({required PaginationLogic paginationLogic}) async{

    int indexInitial = 0;
    for (int x = 0; x < paginationLogic.gallery.length; x++) {
      if(paginationLogic.gallery[x].id == galery.id){
        indexInitial = x;
      }
    }

    showDialog<void>(
        barrierDismissible: false,
        context: contextPage,
        builder: (BuildContext context){
          return StatefulBuilder(
              builder: (context, StateSetter setState){
                return Dialog(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  child: Container(
                    width: double.infinity,
                    color: Colors.transparent,
                    //height: MediaQuery.of(context).size.height * 0.5,
                    // margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColor.white, width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                            child: Stack(
                              children: [
                                MyNetworkImage(
                                  image: paginationLogic.gallery[indexInitial].imagen,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 220,
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: DownloadButton(galery: galery),
                                ),
                                Positioned(
                                  top: 5,right: 10,
                                  child: IconButton(
                                    icon: const Icon(Icons.cancel,size: 30,color: AppColor.white),
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  if(indexInitial != 0){
                                    indexInitial = indexInitial - 1;
                                    setState((){});
                                  }
                                },
                                child: ClipOval(
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    color: AppColor.blue100,
                                    child: const Center(
                                      child: Icon(Icons.arrow_back,size: 25,color: AppColor.primary),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              InkWell(
                                onTap: (){
                                  if((indexInitial + 1) < paginationLogic.gallery.length){
                                    indexInitial = indexInitial + 1;
                                    setState((){});
                                  }
                                },
                                child: ClipOval(
                                  child: Container(
                                    color: AppColor.blue100,
                                    padding: const EdgeInsets.all(10.0),
                                    child: const Center(
                                      child: Icon(Icons.arrow_forward,size: 25,color: AppColor.primary),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          );
        }
    );
  }
}

class DownloadButton extends StatefulWidget {
  const DownloadButton({
    Key? key,
    required this.galery,
  }) : super(key: key);

  final Gallery galery;

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  FormStatus status = FormStatus.editing;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      color: AppColor.blue100,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () async {
          if (status == FormStatus.loading) return;
          setState(() {
            status = FormStatus.loading;
          });
          // var temp = Uri.parse(widget.galery.imagen);
          // String name = temp.pathSegments.last;
          // print(name);

          await downloadAndSaveFile(widget.galery.imagen).then((v) {
            if (v ?? false) {
              setState(() {
                status = FormStatus.done;
              });
            } else {
              setState(() {
                status = FormStatus.error;
              });
            }
          });
        },
        child: SizedBox(
          width: 40,
          height: 40,
          child: _icon(),
        ),
      ),
    );
  }

  Widget _icon() {
    switch (status) {
      case FormStatus.editing:
        return Image.asset(
          'assets/icons/Download.png',
          color: AppColor.primaryBlue,
          scale: 2,
        );
      case FormStatus.loading:
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(
              color: AppColor.primaryBlue, strokeWidth: 2.5),
        );
      case FormStatus.error:
        return const Icon(Icons.error_outline_sharp);
      case FormStatus.done:
        return const Icon(Icons.check);

      default:
        return Container();
    }
  }
}

class PaginationLogic extends ChangeNotifier {

  PaginationLogic({required List<Gallery> galleryAux, required List<Video> videosAux, required BuildContext contextController}){
    gallery = galleryAux;
    videos = videosAux;

    totalItemsImage = gallery.length;
    totalItemsVideo = videos.length;

    controllerImage.addListener(_onListenerImage);
    controllerVideo.addListener(_onListenerVideo);

    contextPage = contextController;
    _eventsRepository = getIt.get<EventsRepository>();

    loadDataImage();
    loadDataVideo();
  }

  late EventsRepository _eventsRepository;
  late BuildContext contextPage;

  final controllerImage = ScrollController();
  final controllerVideo = ScrollController();

  bool _loadingImage = false;
  bool get loadingImage => _loadingImage;
  set loadingImage (bool value){ _loadingImage = value;  notifyListeners(); }
  bool _loadingVideo = false;
  bool get loadingVideo => _loadingVideo;
  set loadingVideo (bool value){ _loadingVideo = value;  notifyListeners(); }
  bool _loadDownLoadImage = false;
  bool get loadDownLoadImage => _loadDownLoadImage;
  set loadDownLoadImage (bool value){ _loadDownLoadImage = value;  notifyListeners(); }

  int _pageSelect = 0;
  int get pageSelect => _pageSelect;
  set pageSelect (int value){ _pageSelect = value;  notifyListeners(); }

  List<int> imageCheck = [];

  List<Widget> itemsImage = [];
  List<Widget> itemsVideo = [];
  List<Gallery> gallery = [];
  List<Video> videos = [];

  int totalItemsImage = 0;
  int limitImage = 5;
  int posInitImage = 0;
  int posItemsImage = 0;

  int totalItemsVideo = 0;
  int limitVideo = 5;
  int posInitVideo = 0;
  int posItemsVideo = 0;

  void _onListenerImage() {
    if ((controllerImage.offset >= controllerImage.position.maxScrollExtent) && !loadingImage) {
      loadDataImage();
    }
  }
  void _onListenerVideo() {
    if ((controllerVideo.offset >= controllerVideo.position.maxScrollExtent) && !loadingVideo) {
      loadDataVideo();
    }
  }

  void removeOnListener() {
    controllerImage.removeListener(_onListenerImage);
    controllerVideo.removeListener(_onListenerVideo);
  }

  void loadDataImage() async {
    loadingImage = true;
    if(posInitImage < totalItemsImage){
      for(int x = posInitImage; x < limitImage; x++){
        if(posInitImage < gallery.length){
          itemsImage.add(_Item(gallery[posItemsImage],contextPage: contextPage,));
          posInitImage = posInitImage + 1;
          if(posInitImage == gallery.length){
            posItemsImage = 0;
          }else{
            posItemsImage = posItemsImage + 1;
          }
        }
      }
      posInitImage = limitImage;
      limitImage = limitImage + 10;
    }
    loadingImage = false;
    notifyListeners();
  }

  void loadDataVideo() async {
    loadingVideo = true;
    if(posInitVideo < totalItemsVideo){
      for(int x = posInitVideo; x < limitVideo; x++){
        if(posInitVideo < videos.length){
          itemsVideo.add(Padding(padding: const EdgeInsets.only(bottom: 15),
            child: MyVideoPlayer(video: videos[posItemsVideo].link!),
          ));
          posInitVideo = posInitVideo + 1;
          if(posInitVideo == videos.length){
            posItemsVideo = 0;
          }else{
            posItemsVideo = posItemsVideo + 1;
          }
        }
      }
      posInitVideo = limitVideo;
      limitVideo = limitVideo + 10;
    }
    loadingVideo = false;
    notifyListeners();
  }

  void addImageCheck({required int idImg}){
    imageCheck.add(idImg);
    notifyListeners();
  }

  void removeImageCheck({required int idImg}){
    imageCheck.remove(idImg);
    notifyListeners();
  }

  Future downloadImages() async{
    if(!loadDownLoadImage){
      loadDownLoadImage = true;
      try{
        String data = '[]';
        if(imageCheck.isNotEmpty){
          data = '[';
          for (int x = 0; x < imageCheck.length; x++) {
            if(x == 0){
              data = '[${imageCheck[x]}';
            }else{
              data = '$data,${imageCheck[x]}';
            }
          }
          data = '$data]';
        }

        Uint8List zip = await _eventsRepository.postDownLoadImages(data: data);
        bool? res = await downloadAndSaveFileFromZip(zip);
        if(res != null && res){
          String title = imageCheck.length > 1 ? 'Imagenes agregadas' : 'Imagen agregada';
          ScaffoldMessenger.of(contextPage).showSnackBar(
              SnackBar(
                  backgroundColor: AppColor.primary,
                  content: Text('$title a la galería',style: AppTextStyle.h3Style.copyWith(
                      color: AppColor.white,fontWeight: FontWeight.bold
                  ),textAlign: TextAlign.center,)
              )
          );
          imageCheck = [];
        }
      }catch(e){
        log('Error ${e.toString()}');
      }
      loadDownLoadImage = false;
    }
  }
}