//
//  SampleAppForXCUITestApp.swift
//  SampleAppForXCUITest
//
//  Created by IL on 04.07.2022.
//

import SwiftUI

@main
struct SampleAppForXCUITestApp: App {
    
    @State var deeplinkTarget: DeeplinkManager.DeeplinkTarget?
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch self.deeplinkTarget {
                case .home:
                    ContentView()
                case .secret(let queryInfo):
                    SecretView(value: queryInfo)
                case .none:
                    ContentView()
                }
            }
            .onOpenURL { url in
                let deeplinkManager = DeeplinkManager()
                let deeplink = deeplinkManager.manage(url: url)
                self.deeplinkTarget = deeplink
            }
        }
    }
}
