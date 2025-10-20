import 'package:ap2/models/movie.dart';
import 'package:ap2/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  MovieService service = MovieService();
  late final Future<List<Movie>> moviesList;


  @override
  void initState() {
    super.initState();
    moviesList = service.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      Scaffold(
        appBar: AppBar(
          title: Text("Filmes de Halloween"),
          backgroundColor: Colors.orange[600],
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        body:
        FutureBuilder<List<Movie>>(future: moviesList, initialData: [],
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(snapshot.data![index].title, style: TextStyle(color: Colors.lime),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data![index].year, style: TextStyle(color: Colors.lime)),
                              Text(snapshot.data![index].genre, style: TextStyle(color: Colors.lime))
                            ],
                          ),
                          leading: Image.network(snapshot.data![index].img)
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: snapshot.data!.length
                );
              }

              if(snapshot.hasError) {
                return Text("Erro");
              }

              return const Center(child: CircularProgressIndicator());
            }
        ),
        backgroundColor: Colors.purple[800]
      ),

    );
  }
}



