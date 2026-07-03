import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io';

class DeviceMetadataService {
  String appVersion = 'unknown';
  String buildNumber = 'unknown';
  String platform = 'unknown';
  String osVersion = 'unknown';
  String deviceModel = 'unknown';
  String locale = 'unknown';

  Future<void> initialize() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      appVersion = packageInfo.version;
      buildNumber = packageInfo.buildNumber;

      final deviceInfo = DeviceInfoPlugin();
      platform = Platform.operatingSystem;
      locale = Platform.localeName;

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        deviceModel = '${androidInfo.brand} ${androidInfo.model}';
        osVersion = androidInfo.version.release;
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceModel = iosInfo.utsname.machine;
        osVersion = iosInfo.systemVersion;
      }
    } catch (e) {
      // Fallbacks already set to 'unknown'
    }
  }
}
