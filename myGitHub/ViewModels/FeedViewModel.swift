//
//  FeedViewModel.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 19/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import Foundation
import Combine

class FeedViewModel: ObservableObject {
    @Published var feeds: [FeedModel] = []
    var cancellationToken: AnyCancellable?
    
    init() {
        //getFeeds()
    }
    
    func getFeeds() {
        cancellationToken = GitHubAPI.shared.requestFeeds()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.feeds = $0
            })
    }
}
