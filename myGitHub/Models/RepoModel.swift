//
//  RepoModel.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 19/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import Foundation

struct RepoModel: Codable, Identifiable {
    var id = UUID()
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
