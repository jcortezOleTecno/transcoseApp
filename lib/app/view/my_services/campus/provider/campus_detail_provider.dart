import 'package:flutter/material.dart';
import 'package:vemare/app/data/campus_repository.dart';
import 'package:vemare/app/domain/model/campus_model.dart';

class CampusDetailProvider with ChangeNotifier{

  CampusDetailProvider(this._campusRepository,{required Map<String,dynamic> data}){
    initialData(data: data);
  }

  final CampusRepository _campusRepository;

  bool _loadData = true;
  bool get loadData => _loadData;
  set loadData(bool value){ _loadData = value; notifyListeners();}

  bool _loadDataTest = true;
  bool get loadDataTest => _loadDataTest;
  set loadDataTest(bool value){ _loadDataTest = value; notifyListeners();}

  bool _loadSendTest = false;
  bool get loadSendTest => _loadSendTest;
  set loadSendTest(bool value){ _loadSendTest = value; notifyListeners();}

  int _pageSelect = 0;
  int get pageSelect => _pageSelect;
  set pageSelect (int value){ _pageSelect = value;  notifyListeners(); }

  TopicsModel? _topicSelect;
  TopicsModel? get topicSelect => _topicSelect;
  set topicSelect (TopicsModel? value){ _topicSelect = value;  notifyListeners(); }

  late CampusModel campus;
  List<TopicsModel> topics = [];
  List<QuestionTest> test = [];

  TestResult? testResult;

  Future initialData({required Map<String,dynamic> data}) async{
    campus = data['campusModel'];
    await getCampusDetails(id: campus.id.toString());
    loadData = false;
    notifyListeners();
  }

  Future getCampusDetails({required String id}) async {
    topics = await _campusRepository.getCampusDetails(id: id);
    notifyListeners();
  }

  // Future getTopicDetails({required String id}) async {
  //   topics = await _campusRepository.getCampusDetails(id: id);
  //   notifyListeners();
  // }

  Future getTest() async {
    loadDataTest = true;
    test = await _campusRepository.getTest(id: topicSelect!.id.toString());
    loadDataTest = false;
    notifyListeners();
  }

  Future getTestResult() async {
    loadDataTest = true;
    testResult = await _campusRepository.getTestResult(id: topicSelect!.id.toString());
    loadDataTest = false;
    notifyListeners();
  }

  Future saveTest({required Map<String,dynamic> body}) async{
    loadSendTest = true;
    await _campusRepository.posSendTet(body: body);
    loadSendTest = false;
  }

  Future completedTest({required Map<String,dynamic> body}) async{
    loadSendTest = true;
    await _campusRepository.posCompletedTet(body: body);
    loadSendTest = false;
  }

}