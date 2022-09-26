//
//  ApiKeys.swift
//  BestNews
//
//  Created by Assil Heddar on 20/09/2022.
//

import Foundation

func valueForAPIKey(named keyname: String) -> String {
    guard let filePath = Bundle.main.path(forResource: "APIKeys", ofType: "plist") else {
        fatalError("Fatal Error : ApiKeys.plist missing.")
    }
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let apiKey = (plist?.object(forKey: keyname)) as? String,
        !apiKey.isEmpty else {
            fatalError("Missing Api Key for \(String(describing: plist))")
    }
    return apiKey
}
