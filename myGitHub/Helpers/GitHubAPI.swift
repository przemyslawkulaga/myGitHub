//
//  GitHubAPI.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 19/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import Foundation
import Combine
import KeychainAccess
import OAuthSwift

final class GitHubAPI {
    static let shared = GitHubAPI()
    
    let apiClient = APIClient()
    var oauthswift: OAuth2Swift?
    
    func requestFeeds() -> AnyPublisher<[FeedModel], Error> {
        guard
            let token = Keychain(service: "com.peka.myGitHub")["token"],
            let url = URL(string: "https://api.github.com/")
            else { fatalError("Couldn't create Token/URL") }
        
        var request = URLRequest(url: url)
        request.addValue("token \(token)", forHTTPHeaderField: "Authorization")
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    func requestRepos() -> AnyPublisher<[RepoModel], Error> {
        guard
            let token = Keychain(service: "com.peka.myGitHub")["token"],
            let url = URL(string: "https://api.github.com/user/repos")
            else { fatalError("Couldn't create Token/URL") }
        
        var request = URLRequest(url: url)
        request.addValue("token \(token)", forHTTPHeaderField: "Authorization")
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    public  func authenticate() -> Future <Bool, Never> {
        oauthswift = OAuth2Swift(
            consumerKey: "c38d6c466fbe2945e335",
            consumerSecret: "eece2f801c8dcdebb9862f5178a21ba6ff57ce89",
            authorizeUrl: "https://github.com/login/oauth/authorize",
            accessTokenUrl: "https://github.com/login/oauth/access_token",
            responseType: "token"
        )
        
        return Future() { promise in
            _ = self.oauthswift?.authorize(
                withCallbackURL: "myGitHub://login",
                scope: "", state: "MYGITHUB") { result in
                    switch result {
                    case .success(let (credential, _, _)):
                        let keychain = Keychain(service: "com.peka.myGitHub")
                        keychain["token"] = credential.oauthToken
                        promise(Result.success(true))
                    case .failure(let error):
                        print(error.localizedDescription)
                        promise(Result.success(false))
                    }
            }
        }
    }
}
