import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/view/my_services/events/events_vemare/event_detail_page.dart';

class EventDetailImagesPage extends StatefulWidget {
  const EventDetailImagesPage( {super.key});
  @override
  State<EventDetailImagesPage> createState() => _EventDetailImagesPageState();
}

class _EventDetailImagesPageState extends State<EventDetailImagesPage> {

  late PaginationLogic paginationLogic;

  @override
  Widget build(BuildContext context) {
    paginationLogic = Provider.of<PaginationLogic>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          controller: paginationLogic.controllerImage,
          itemCount: paginationLogic.itemsImage.length,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (_, index){
            Widget item = paginationLogic.itemsImage[index];
            return item;
          }
      ),
    );
  }
}