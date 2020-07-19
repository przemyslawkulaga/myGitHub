//
//  RepositoryViewModel.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 19/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import Foundation
import Combine

class RepositoryViewModel: ObservableObject {
    
    @Published var repos: [RepoModel] = []
    var cancellationToken: AnyCancellable?
    
    init() {
        getRepos()
    }
    
    func getRepos() {
        cancellationToken = GitHubAPI.shared.requestRepos()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.repos = $0
            })
    }
}
