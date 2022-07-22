//
//  DeeplinkManager.swift
//  SampleAppForXCUITest
//
//  Created by Ihor Livinskyi on 22.07.2022.
//

import Foundation

class DeeplinkManager {
    
    enum DeeplinkTarget: Equatable {
        case home
        case secret(reference: String)
    }
    
    class DeepLinkConstants {
        static let scheme = "xctsecret"
        static let host = "com.ilivinskyi.sampleapp.SampleAppForXCUITest"
        static let detailsPath = "/secret"
        static let query = "value"
    }
    
    func manage(url: URL) -> DeeplinkTarget {
        guard url.scheme == DeepLinkConstants.scheme,
              url.host == DeepLinkConstants.host,
              url.path == DeepLinkConstants.detailsPath,
              let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems
        else { return .home }
        
        let query = queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
        
        guard let value = query[DeepLinkConstants.query] else { return .home }
        
        return .secret(reference: value)
    }
}
