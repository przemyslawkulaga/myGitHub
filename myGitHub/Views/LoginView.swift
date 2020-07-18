//
//  LoginView.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 16/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var login: String = ""
    @State private var password: String = ""
    var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            LogoView()
            LoginTextField(loginValue: $login)
            PasswordTextField(passValue: $password)
            LoginButton()
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
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
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
