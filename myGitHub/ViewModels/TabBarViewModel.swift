//
//  TabBarViewModel.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 19/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import Foundation
import KeychainAccess

class TabBarViewModel: ObservableObject {
    @Published var loggedOut = false
    
    func logOut() {
        let keychain = Keychain(service: "com.peka.myGitHub")
        keychain["token"] = nil
        loggedOut = true
    }
}
