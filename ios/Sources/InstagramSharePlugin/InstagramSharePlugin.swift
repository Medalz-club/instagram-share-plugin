import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(InstagramSharePlugin)
public class InstagramSharePlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "InstagramSharePlugin"
    public let jsName = "InstagramShare"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "shareToInstagramStories", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = InstagramShare()

    @objc func shareToInstagramStories(_ call: CAPPluginCall) {
        implementation.shareToInstagramStories(call)
    }
}
