//
//  TabBarView.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 18/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            FeedView(viewModel: FeedViewModel())
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Feed")
            }
            
            RepositoryView(viewModel: RepositoryViewModel())
                .tabItem {
                    Image(systemName: "folder")
                    Text("Repository")
            }
        }.accentColor(.black)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
