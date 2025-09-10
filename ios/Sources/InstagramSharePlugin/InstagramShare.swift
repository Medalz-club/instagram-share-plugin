import Foundation
import Capacitor
import UIKit

@objc public class InstagramShare: NSObject {
    @objc func shareToInstagramStories(_ call: CAPPluginCall) {
        let appId = call.getString("appId") ?? ""
        let bgPath = call.getString("backgroundImagePath")
        let stickerPath = call.getString("stickerImagePath")

        let urlScheme = URL(string: "instagram-stories://share?source_application=\(appId)")!

        if UIApplication.shared.canOpenURL(urlScheme) {
            var items: [[String: Any]] = []

            if let bgPath = bgPath, let imageData = try? Data(contentsOf: URL(fileURLWithPath: bgPath)) {
                items.append(["com.instagram.sharedSticker.backgroundImage": imageData])
            }

            if let stickerPath = stickerPath, let stickerData = try? Data(contentsOf: URL(fileURLWithPath: stickerPath)) {
                items.append(["com.instagram.sharedSticker.stickerImage": stickerData])
            }

            let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(300)]
            UIPasteboard.general.setItems(items, options: pasteboardOptions)

            UIApplication.shared.open(urlScheme, options: [:], completionHandler: nil)
            call.resolve()
        } else {
            call.reject("Instagram not installed")
        }
    }
}
