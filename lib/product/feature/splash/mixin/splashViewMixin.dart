import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info/package_info.dart';
import 'package:earthquake_listing/utility/enum/splashScreenEnum.dart';
import '../../../../utility/enum/firebaseCollectionEnum.dart';
import '../../../../utility/enum/platformEnum.dart';
import '../model/versionModel.dart';

Future<String> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  return packageInfo.version;
}


class VersionManager {

  final String deviceVersion;
  final String databaseVersion;

  VersionManager({required this.deviceVersion, required this.databaseVersion});

  int isNeedForUpdate() {
    final deviceVersionSplitted = deviceVersion.split('.').join();
    final databaseVersionSplitted = databaseVersion.split('.').join();

    final deviceNumber = int.tryParse(deviceVersionSplitted);
    final databaseNumber = int.tryParse(databaseVersionSplitted);

    if (deviceNumber == null || databaseNumber == null) {
      throw Exception('Version Error');
    }

    if(databaseNumber == 000){
      return splashScreenEnum.keeping.screenCode;
    }else if(databaseNumber == 001){
      return splashScreenEnum.specialTheme.screenCode;
    }else if(databaseNumber > deviceNumber){
      return splashScreenEnum.forceUpdate.screenCode;
    }else if (databaseNumber <= deviceNumber){
      return splashScreenEnum.home.screenCode;
    };


    throw Exception("Version error. DB Version: $databaseVersion , Device Version: $deviceVersion");
  }
}

mixin splashLogic {



  var isRequiredForceUpdate;


  Future<int> checkAppVersion() async {
    try {

      final databaseVersion = await getVersionFromDatabase();
      final clientVersion = await getAppVersion();

      if (databaseVersion == null || databaseVersion.isEmpty) {
        isRequiredForceUpdate == splashScreenEnum.forceUpdate.screenCode;
      }


/*
      if (checkisNeedForceUpdate.isNeedForUpdate() == ) {
        isRequiredForceUpdate = true;
      } else {
        isRequiredForceUpdate = false;
      }

 */


      isRequiredForceUpdate = VersionManager(
          deviceVersion: clientVersion,
          databaseVersion: databaseVersion!).isNeedForUpdate();


      return isRequiredForceUpdate;
    } catch (e) {
      print(e.toString());
      return splashScreenEnum.forceUpdate.screenCode;
    }
  }

  Future<String?> getVersionFromDatabase() async {
    if (kIsWeb) return null;

    final response = await FirebaseCollections.version.reference.withConverter<versionModel>(
        fromFirestore: (snapshot, _) => versionModel().fromFirebase(snapshot),
        toFirestore: (model, _) => model.toJson())
        .doc(PlatformEnum.versionName)
        .get();


    return response
        .data()
        ?.number;
  }

  Future<String?> getCode() async {

    final response = await FirebaseCollections.version.reference.withConverter<splashCodeModel>(
        fromFirestore: (snapshot , _) => splashCodeModel().fromFirebase(snapshot),
        toFirestore: (snapshot, _) => snapshot.toJson())
        .doc("passcode")
        .get();

    return response.data()!.code;
  }
}