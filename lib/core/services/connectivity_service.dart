import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectionService extends GetxController {
  final Connectivity _connectivity = Connectivity();
  var isConnected = false.obs; // Reactive variable for connectivity status

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    listenConnectivity();
  }

  void listenConnectivity() {
    try {
      _connectivity.onConnectivityChanged.listen((connectivityResult) async {
        for (var result in connectivityResult) {
          handleConnectivityResult(result);
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> initConnectivity() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      for (var result in connectivityResult) {
        handleConnectivityResult(result);
      }
      listenConnectivity();
    } catch (e) {
      rethrow;
    }
  }

  void handleConnectivityResult(ConnectivityResult result) {
    if (Platform.isAndroid) {
      readAndroidResult(result);
    } else if (Platform.isIOS) {
      readIOSResult(result);
    }
  }

  void readIOSResult(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi ||
        result == ConnectivityResult.ethernet ||
        result == ConnectivityResult.vpn) {
      isConnected.value = true;
    } else {
      isConnected.value = false;
    }
  }

  void readAndroidResult(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi ||
        result == ConnectivityResult.ethernet ||
        result == ConnectivityResult.vpn) {
      isConnected.value = true;
    } else {
      isConnected.value = false;
    }
  }
}
