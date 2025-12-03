import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkService {
  // Singleton Instance
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;
  NetworkService._internal();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _connectivitySubscription;

  /// Stream to listen live connectivity status
  Stream<bool> get onConnectivityChanged async* {
    yield await isConnected();
    yield* InternetConnectionChecker().onStatusChange.map(
      (status) => status == InternetConnectionStatus.connected,
    );
  }

  /// Check whether actual internet is available
  Future<bool> isConnected() async {
    bool networkAvailable = await connectivityAvailable();
    if (!networkAvailable) return false;

    return await InternetConnectionChecker().hasConnection;
  }

  /// Check whether device has Wi-Fi/Mobile network signal
  Future<bool> connectivityAvailable() async {
    var result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi ||
        result == ConnectivityResult.ethernet;
  }

  /// Optional: Listen to changes and trigger callback
  void startListener(Function(bool) onStatusChange) {
    _connectivitySubscription = onConnectivityChanged.listen(onStatusChange);
  }

  /// Dispose stream
  void dispose() {
    _connectivitySubscription.cancel();
  }
}
