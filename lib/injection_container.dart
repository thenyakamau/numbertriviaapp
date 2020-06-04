import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/NetworkInfo.dart';
import 'core/utils/InputConverter.dart';
import 'features/data/datasources/NumberTriviaLocalDataBase.dart';
import 'features/data/datasources/NumberTriviaRemoteDataBase.dart';
import 'features/data/repositories/NetworkTriviaRepositoryImpl.dart';
import 'features/domain/repositories/NumberTriviaRepository.dart';
import 'features/domain/usecases/GetConcreteNumberTrivia.dart';
import 'features/domain/usecases/GetRandomNumberTrivia.dart';
import 'features/presentation/bloc/numbertrivia_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initNumberTrivia();
}

Future<void> _initNumberTrivia() async {
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

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );
  //!External
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  sl.registerLazySingleton(() => prefs);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
