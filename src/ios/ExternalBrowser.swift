import Foundation
import UIKit

@objc(ExternalBrowser)
class ExternalBrowser: CDVPlugin {

    @objc(open:)
    func open(command: CDVInvokedUrlCommand) {

        guard let urlString = command.argument(at: 0) as? String,
              let url = URL(string: urlString) else {

            let pluginResult = CDVPluginResult(
                status: CDVCommandStatus_ERROR,
                messageAs: "Invalid URL"
            )

            self.commandDelegate.send(
                pluginResult,
                callbackId: command.callbackId
            )

            return
        }

        DispatchQueue.main.async {

            UIApplication.shared.open(
                url,
                options: [:],
                completionHandler: { success in

                    let pluginResult = CDVPluginResult(
                        status: success ? CDVCommandStatus_OK : CDVCommandStatus_ERROR
                    )

                    self.commandDelegate.send(
                        pluginResult,
                        callbackId: command.callbackId
                    )
                }
            )
        }
    }
}