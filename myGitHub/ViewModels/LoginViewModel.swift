//
//  LoginViewModel.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 18/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import Foundation
import OAuthSwift
import Combine
import KeychainAccess

class LoginViewModel: ObservableObject {
    @Published var isLoged = false
    var cancellationToken: AnyCancellable?
    
    func loginUser() {
        cancellationToken = GitHubAPI.shared.authenticate()
            .sink() { result in
                self.isLoged = result
        }
    }
}
