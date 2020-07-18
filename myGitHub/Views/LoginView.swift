//
//  LoginView.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 16/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var isLogged = false
    @State private var login = ""
    @State private var password = ""
    var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if !isLogged {
                LogoView()
                LoginTextField(loginValue: $login)
                PasswordTextField(passValue: $password)
                LoginButton(isLogged: $isLogged)
            } else {
                FeedView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let fetcher = DataFetcher()
        let viewModel = LoginViewModel(dataFetcher: fetcher)
        return LoginView(viewModel: viewModel)
    }
}

struct LogoView: View {
    var body: some View {
        VStack {
            Image(systemName: "eyeglasses")
                .resizable()
                .scaledToFit()
            (Text("my") + Text("GitHub").bold())
        }
        .padding(96)
    }
}

struct LoginTextField: View {
    @Binding var loginValue: String
    
    var body: some View {
        HStack {
            Image(systemName: "envelope")
            TextField("E-mail", text: $loginValue)
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 2))
        .padding()
    }
}

struct PasswordTextField: View {
    @Binding var passValue: String
    
    var body: some View {
        HStack {
            Image(systemName: "lock")
            SecureField("Password", text: $passValue)
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 2))
        .padding()
    }
}

struct LoginButton: View {
    @Binding var isLogged: Bool
    
    var body: some View {
        Button(action: {
            self.isLogged = true
        }) {
            Text("Log in")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundColor(.black)
            )
        }.padding()
    }
}
