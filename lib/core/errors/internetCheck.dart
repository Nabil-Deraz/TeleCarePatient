import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<void> checkInternet();
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker? connectionChecker;

  NetworkInfoImpl({this.connectionChecker});

  @override
  Future<bool> get isConnected => connectionChecker!.hasConnection;

  @override
  Future<void> checkInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == false) {
      // showToast(
      //     text:
      //         "No Internet Connection Please activate the internet and Try Again!",
      //     state: ToastStates.error);
    }
  }
}
