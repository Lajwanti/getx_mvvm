import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';
import 'package:getx_mvvm/res/components/general_exception.dart';
import 'package:getx_mvvm/res/components/internet_exception.dart';
import 'package:getx_mvvm/res/routes/route_name.dart';
import 'package:getx_mvvm/viewModel/controller/LoginPreference/user_perference_view.dart';
import 'package:getx_mvvm/viewModel/controller/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  HomeViewModel homeViewModel = Get.put(HomeViewModel());
  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.userListModel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home View"),
        centerTitle: true,
        backgroundColor: AppColors.baseLightPinkColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            userPreference.removeUser().then((value) => {
              Get.toNamed(RouteName.loginView),
            });
          }, icon: Icon(Icons.logout))
        ],
      ),

      body: Obx((){
        switch(homeViewModel.rxRequestStatus.value){
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:

            if(homeViewModel.error.value == "No internet"){
              return InternetException(onPress: (){
                homeViewModel.reFreshApi();
              });

            }else{
              return GeneralExceptonWidget(onPress: (){
                homeViewModel.reFreshApi();

              });
             // return  Center(child: Text(homeViewModel.error.toString()));
            }

            case Status.COMPLETED:
            return ListView.builder(
                itemCount: homeViewModel.userList.value.data!.length,
                itemBuilder: (context, index) {
             return Card(
               child: ListTile(
                 trailing: Text(homeViewModel.userList.value.data![index].id.toString()),
                 leading: CircleAvatar(
                   backgroundImage: NetworkImage(homeViewModel.userList.value.data![index].avatar.toString()),
                 ),
                 title: Text(homeViewModel.userList.value.data![index].firstName.toString()
                     + homeViewModel.userList.value.data![index].lastName.toString()),
                 subtitle: Text(homeViewModel.userList.value.data![index].email.toString()),


               ),
             );
            });




        }
        return SizedBox();
      }),
    );
  }
}
