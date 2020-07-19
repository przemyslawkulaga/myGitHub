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
    @ObservedObject var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if !viewModel.isLoged {
                LogoView()
                LoginTextField(loginValue: $login)
                PasswordTextField(passValue: $password)
                LoginButton(viewModel: viewModel)
            } else {
                TabBarView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LoginViewModel()
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
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        Button(action: {
            self.viewModel.loginUser()
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
        .shadow(radius: 2)
    }
}
