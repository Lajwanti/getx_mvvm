import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/Home/UserListModel.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';

class HomeViewModel extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;


  void setrxrequestStatus(Status _value) => rxRequestStatus.value = _value;
   void setuserList(UserListModel _value) => userList.value = _value;
 void setError(String _value) => error.value = _value;

  void userListModel(){
    _api.userListApi().then((value){
      setrxrequestStatus(Status.COMPLETED);
      setuserList(value);


    }).onError((error, stackTrace){
      // print(error);
      // print(stackTrace);
      setError(error.toString());
      setrxrequestStatus(Status.ERROR);



    });
  }

  void reFreshApi(){
    setrxrequestStatus(Status.LOADING);
    _api.userListApi().then((value){
      setrxrequestStatus(Status.COMPLETED);
      setuserList(value);


    }).onError((error, stackTrace){
      // print(error);
      // print(stackTrace);
      setError(error.toString());
      setrxrequestStatus(Status.ERROR);



    });
  }

}
