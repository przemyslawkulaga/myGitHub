//
//  LoginView.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 16/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    var viewModel: LoginViewModel

    init(viewModel: LoginViewModel) {
      self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let fetcher = DataFetcher()
        let viewModel = LoginViewModel(dataFetcher: fetcher)
        return LoginView(viewModel: viewModel)
    }
}
