import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/event_detail_page.dart';

class EventDetailVideosPage extends StatefulWidget {
  const EventDetailVideosPage({super.key});

  @override
  State<EventDetailVideosPage> createState() => _EventDetailVideosPageState();
}

class _EventDetailVideosPageState extends State<EventDetailVideosPage> {

  late PaginationLogic paginationLogic;

  @override
  Widget build(BuildContext context) {
    paginationLogic = Provider.of<PaginationLogic>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          controller: paginationLogic.controllerVideo,
          itemCount: paginationLogic.itemsVideo.length,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (_, index){
            Widget item = paginationLogic.itemsVideo[index];
            return item;
          }
      ),
    );
  }
}