import Flutter
import UIKit

class AuroraVisualEffectView: NSObject, FlutterPlatformView {
  private let blurView: UIVisualEffectView

  init(frame: CGRect, args: Any?) {
    let params = args as? [String: Any]
    let style = params?["style"] as? String ?? "systemMaterial"
    let effect = UIBlurEffect(style: AuroraBlurStyle.from(style))

    blurView = UIVisualEffectView(effect: effect)
    blurView.frame = frame
    blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    super.init()
  }

  func view() -> UIView {
    return blurView
  }
}

enum AuroraBlurStyle {
  static func from(_ string: String) -> UIBlurEffect.Style {
    switch string {
    case "systemUltraThinMaterial":
      return .systemUltraThinMaterial
    case "systemThinMaterial":
      return .systemThinMaterial
    case "systemMaterial":
      return .systemMaterial
    case "systemThickMaterial":
      return .systemThickMaterial
    case "systemChromeMaterial":
      return .systemChromeMaterial
    case "systemUltraThinMaterialDark":
      return .systemUltraThinMaterialDark
    case "systemThinMaterialDark":
      return .systemThinMaterialDark
    case "systemMaterialDark":
      return .systemMaterialDark
    case "systemThickMaterialDark":
      return .systemThickMaterialDark
    case "systemChromeMaterialDark":
      return .systemChromeMaterialDark
    case "systemUltraThinMaterialLight":
      return .systemUltraThinMaterialLight
    case "systemThinMaterialLight":
      return .systemThinMaterialLight
    case "systemMaterialLight":
      return .systemMaterialLight
    case "systemThickMaterialLight":
      return .systemThickMaterialLight
    case "systemChromeMaterialLight":
      return .systemChromeMaterialLight
    default:
      return .systemMaterial
    }
  }
}
