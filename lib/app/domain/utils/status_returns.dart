import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/color.dart';

Map<String,String> statusTraduccion = {
  'Pendiente' : 'Solicitada',
  'Solicitada' : 'Solicitada',
  'En Gestión' : 'En gestión',
  'Abonada Parcial' : 'Abonada Parcial',
  'Abonada' : 'Abonada',
  'Reembolsada' : 'Abonada',
  'Anulada' : 'Cancelada',
  'Cancelada' : 'Cancelada',
};
Map<String,Color> statusColorBg = {
  'Pendiente' : AppColor.statusReturn1,
  'Solicitada' : AppColor.statusReturn1,
  'En Gestión' : AppColor.statusReturn2,
  'Abonada Parcial' : AppColor.statusReturn3,
  'Abonada' : AppColor.statusReturn3,
  'Anulada' : AppColor.statusReturn4,
  'Cancelada' : AppColor.statusReturn4,
  'Reembolsada' : AppColor.statusReturn3,
};
Map<String,Color> statusColorText = {
  'Pendiente' : AppColor.statusReturnText1,
  'Solicitada' : AppColor.statusReturnText1,
  'En Gestión' : AppColor.statusReturnText2,
  'Abonada Parcial' : AppColor.statusReturnText3,
  'Abonada' : AppColor.statusReturnText3,
  'Anulada' : AppColor.statusReturnText4,
  'Cancelada' : AppColor.statusReturnText4,
  'Reembolsada' : AppColor.statusReturnText3,
};

Map<String,int> statusTypeLine = {
  'Pendiente' : 0,
  'En Gestión' : 1,
  'Abonada' : 3,
  'Anulada' : 3,
  'Solicitada' : 0,
  'Reembolsada' : 3,
  'Cancelada' : 3,
  'Abonada Parcial' : 3,
};