import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/Utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/Utils/utils.dart';
import 'package:flutter_mvvm_architecture/View_Model/homeview_model.dart';
import 'package:flutter_mvvm_architecture/View_Model/userview_model.dart';
import 'package:flutter_mvvm_architecture/data/response/status.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchMovieApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              userPreferences.removeUser();
              Navigator.pushNamed(context, RoutesName.login);
            },
            child: Text('logout', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 20),
        ],
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, child) {
            switch (value.movieList.status) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.movieList.message.toString()));
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.movieList.data?.movies?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          value.movieList.data!.movies![index].title.toString(),
                        ),
                        subtitle: Text(
                          value.movieList.data!.movies![index].year.toString(),
                        ),
                        leading: Image.network(
                          value.movieList.data!.movies![index].posterurl
                              .toString(),
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.error),
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              Utils.averageRating(
                                value.movieList.data!.movies![index].ratings!,
                              ).toStringAsFixed(1),
                            ),
                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        ),
                      ),
                    );
                  },
                );
              default:
                return Text('Default');
            }
          },
        ),
      ),
    );
  }
}
