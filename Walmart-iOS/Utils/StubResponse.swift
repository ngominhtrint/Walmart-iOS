//
//  StubResponse.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/13/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import Foundation

class StubResponse {
    
    static func fromJSONFile(_ fileName: String) -> Data {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            fatalError("Invalid path for json file")
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            fatalError("Invalid data from json file")
        }
        return data
    }
}
