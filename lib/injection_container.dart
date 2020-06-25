import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/NetworkInfo.dart';
import 'core/utils/InputConverter.dart';
import 'database/NumberTriviaDatabase.dart';
import 'features/data/datasources/BlogPostApiService.dart';
import 'features/data/datasources/BlogPostLocalDataSource.dart';
import 'features/data/datasources/BlogPostRemoteDataSource.dart';
import 'features/data/datasources/NumberTriviaLocalDataBase.dart';
import 'features/data/datasources/NumberTriviaRemoteDataBase.dart';
import 'features/data/repositories/BlogPostsRepositoryImpl.dart';
import 'features/data/repositories/NetworkTriviaRepositoryImpl.dart';
import 'features/domain/repositories/BlogPostRepository.dart';
import 'features/domain/repositories/NumberTriviaRepository.dart';
import 'features/domain/usecases/GetBlogAllPosts.dart';
import 'features/domain/usecases/GetConcreteNumberTrivia.dart';
import 'features/domain/usecases/GetRandomNumberTrivia.dart';
import 'features/presentation/bloc/blogPostApiBloc/blogpostapibloc_bloc.dart';
import 'features/presentation/bloc/bottomNavigation/bottomnavigation_bloc.dart';
import 'features/presentation/bloc/numbertrivia_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _initNumberTrivia();
  _initializeBottomNavBar();
  _initializeBlogPosts();

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => BlogPostApiService.create());
  //!External
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  sl.registerLazySingleton(() => prefs);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => NumberTriviaDataBase().blogPostsDao);
}

void _initNumberTrivia() {
  //! Features - Number Trivia
  //instanciates new bloc instance on page load
  sl.registerFactory(
    () => NumbertriviaBloc(
      concreteNumberTrivia: sl(),
      randomNumberTrivia: sl(),
      inputConverter: sl(),
    ),
  );

  //useCases
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  //Repository
  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTrivialLocalDataSourceImpl(sharedPreferences: sl()),
  );
}

void _initializeBottomNavBar() {
  sl.registerFactory(() => BottomnavigationBloc());
}

void _initializeBlogPosts() {
  sl.registerFactory(() => BlogpostapiblocBloc(getAllBlogPosts: sl()));
  sl.registerLazySingleton(() => GetAllBlogPosts(repository: sl()));
  sl.registerLazySingleton<BlogPostRepository>(
    () => BlogPostRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<BlogPostRemoteDataSource>(
    () => BlogPostRemoteDataSourceImpl(blogPostApiService: sl()),
  );
  sl.registerLazySingleton<BlogPostLocalDataSource>(
    () => BlogPostLocalDataSorceImpl(postsDao: sl()),
  );
}
