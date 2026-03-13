import Foundation
import Capacitor
import UIKit

@objc public class InstagramShare: NSObject {
    @objc func shareToInstagramStories(_ call: CAPPluginCall) {
        let appId = call.getString("appId") ?? ""
        let bgPath = call.getString("backgroundImagePath")
        let stickerPath = call.getString("stickerImagePath")

        var items: [[String: Any]] = []

        if let bgPath = bgPath {
            let bgUrl = bgPath.hasPrefix("file://") ? URL(string: bgPath) : URL(fileURLWithPath: bgPath)
            if let bgUrl = bgUrl, let imageData = try? Data(contentsOf: bgUrl) {
                items.append(["com.instagram.sharedSticker.backgroundImage": imageData])
            }
        }

        if let stickerPath = stickerPath {
            let stickerUrl = stickerPath.hasPrefix("file://") ? URL(string: stickerPath) : URL(fileURLWithPath: stickerPath)
            if let stickerUrl = stickerUrl, let stickerData = try? Data(contentsOf: stickerUrl) {
                items.append(["com.instagram.sharedSticker.stickerImage": stickerData])
            }
        }

        DispatchQueue.main.async {
            let urlScheme = URL(string: "instagram-stories://share?source_application=\(appId)")!

            guard UIApplication.shared.canOpenURL(urlScheme) else {
                call.reject("Instagram not installed")
                return
            }

            if !items.isEmpty {
                let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(300)]
                UIPasteboard.general.setItems(items, options: pasteboardOptions)
            }

            UIApplication.shared.open(urlScheme, options: [:]) { _ in
                call.resolve()
            }
        }
    }
}
