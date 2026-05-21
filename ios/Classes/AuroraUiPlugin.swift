import Flutter
import UIKit

public class AuroraUiPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let factory = AuroraVisualEffectViewFactory(messenger: registrar.messenger())
    registrar.register(factory, withId: "aurora_ui/visual_effect_view")
  }
}
