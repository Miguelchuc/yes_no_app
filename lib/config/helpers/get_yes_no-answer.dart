import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  //instancia de la clase dio para manejar peticiones HTTP
  final _dio = Dio();

  Future<Message> getAnswer() async {
    //almacenar el resultado de la peticion
    final response = await _dio.get('https://yesno.wtf/api');

    //almacemar la respuesta de respuesta Json
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //retornar la instacia message
    return yesNoModel.toMessageEntity();
  }
}
