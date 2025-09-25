import 'package:flutter/material.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class ProgressTracker extends StatelessWidget {
  final int currentStep; // 0, 1, or 2
  final List<String> labels; // e.g., ['Solicitada', 'En gestión', 'Finalizada']

  const ProgressTracker({
    Key? key,
    required this.currentStep,
    required this.labels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20,),
              _buildStep(0, labels[0], context),
              _buildLine(1, context),
              _buildStep(1, labels[1], context),
              _buildLine(2, context),
              _buildStep(2, labels[2], context),
              SizedBox(width: 20,),
            ],
          ),
        ),
        SizedBox(height: 8,),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10,),
              _buildStepText(0, labels[0], context),
              Expanded(child: Container(),),
              _buildStepText(1, labels[1], context),
              Expanded(child: Container(),),
              _buildStepText(2, labels[2], context),
              SizedBox(width: 10,),
            ],
          ),
        ),

      ],
    );
  }

  // Método para construir cada círculo y su texto
  Widget _buildStep(int step, String label, BuildContext context) {
    // Si el paso actual es menor o igual al paso que se está construyendo, está "activo"
    //bool isActive = step <= currentStep;

    // Color del texto: azul oscuro si está activo, gris oscuro si no
    //Color textColor = isActive ? AppColor.black : Colors.grey.shade400;
    // Color del círculo: azul si está activo, gris claro si no lo está
    Color circleColor = Colors.transparent;
    Color borderColor = AppColor.primary;

    Icon? icon;
    if(step < currentStep){
      icon = Icon(Icons.check,size: 18,color: Colors.white,);
      circleColor = AppColor.primary;
    }
    if(step == currentStep){
      icon = Icon(Icons.circle,size: 15,color: AppColor.primary,);
    }
    if(step > currentStep){
      borderColor = Colors.grey.shade400;
    }

    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor,
            border: Border.all(
              color: borderColor,
              width: 2.0,
            ),
          ),
          child: icon ?? Container(),
        ),
      ],
    );
  }

  // Método para construir la línea que conecta los círculos
  Widget _buildLine(int step, BuildContext context) {
    // La línea está activa si su paso (ej. 1 o 2) es menor o igual al paso actual
    bool isActive = step <= currentStep;

    return Expanded(
      child: Container(
        height: 3,
        color: isActive ? AppColor.primary : Colors.grey.shade400,
      ),
    );
  }

  Widget _buildStepText(int step, String label, BuildContext context) {

    bool isActive = step <= currentStep;
    Color textColor = isActive ? AppColor.black : Colors.grey.shade400;

    return Text(
      label,
      style: AppTextStyle.h2Style.copyWith(fontWeight: FontWeight.bold,fontSize: 17,color: textColor),
    );
  }
}