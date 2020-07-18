//
//  LoginViewModel.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 18/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import Foundation

class LoginViewModel {
    private let dataFetcher: DataFetchable

    init(dataFetcher: DataFetchable) {
      self.dataFetcher = dataFetcher
    }
}
