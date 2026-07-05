import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io';
import 'dart:ui';

class DeviceMetadataService {
  String appVersion = 'unknown';
  String buildNumber = 'unknown';
  String platform = 'unknown';
  String osVersion = 'unknown';
  String deviceModel = 'unknown';
  String locale = 'unknown';
  String manufacturer = 'unknown';
  String screenResolution = 'unknown';
  String deviceOrientation = 'unknown';

  Future<void> initialize() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      appVersion = packageInfo.version;
      buildNumber = packageInfo.buildNumber;

      final deviceInfo = DeviceInfoPlugin();
      platform = Platform.operatingSystem;
      locale = Platform.localeName;

      final view = PlatformDispatcher.instance.views.isNotEmpty 
          ? PlatformDispatcher.instance.views.first 
          : null;
      if (view != null) {
        screenResolution = '${view.physicalSize.width.toInt()}x${view.physicalSize.height.toInt()}';
        deviceOrientation = view.physicalSize.width > view.physicalSize.height 
            ? 'landscape' 
            : 'portrait';
      }

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        deviceModel = '${androidInfo.brand} ${androidInfo.model}';
        osVersion = androidInfo.version.release;
        manufacturer = androidInfo.manufacturer;
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceModel = iosInfo.utsname.machine;
        osVersion = iosInfo.systemVersion;
        manufacturer = 'Apple';
      }
    } catch (e) {
      // Fallbacks already set to 'unknown'
    }
  }
}
