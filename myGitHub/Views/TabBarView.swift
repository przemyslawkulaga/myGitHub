//
//  TabBarView.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 18/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var viewModel: TabBarViewModel
    
    init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            if !viewModel.loggedOut {
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
                LogOutButton(viewModel: viewModel)
            } else {
                LoginView(viewModel: LoginViewModel())
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewModel: TabBarViewModel())
    }
}

struct LogOutButton: View {
    @ObservedObject var viewModel: TabBarViewModel
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.showAlert = true
                }) {
                    Image(systemName: "escape")
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            Circle()
                                .foregroundColor(.black)
                                .shadow(radius: 2)
                    )
                }
                .padding()
                .padding(.bottom, 48)
                .alert(isPresented: $showAlert) { () -> Alert in
                    Alert(title: Text("Are you sure to log out?"),
                          primaryButton: .default(Text("Okay"), action: { self.viewModel.logOut() }),
                          secondaryButton: .default(Text("Dismiss"))
                    )
                }
            }
        }
    }
}
