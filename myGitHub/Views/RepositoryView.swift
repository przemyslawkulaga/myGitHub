//
//  RepositoryView.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 18/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import SwiftUI

struct RepoTestData {
    let id = UUID()
    let name: String
}

struct RepositoryView: View {
    @State var searchingPhrase = ""
    
    var testList = [
        RepoTestData(name: "Repo number 1"),
        RepoTestData(name: "Repo number 2"),
        RepoTestData(name: "Repo number 3"),
        RepoTestData(name: "Repo number 4")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchingPhrase)
                List {
                    ForEach(testList, id: \.id) { item in
                        RepoRow(nameValue: item.name)
                    }
                }
            }
            .navigationBarTitle("Repos")
        }
        
    }
}

struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryView()
    }
}

struct RepoRow: View {
    var nameValue: String?
    
    var body: some View {
        VStack {
            Text(nameValue ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Enter phrase...", text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(4)
                .padding(.horizontal, 8)
            Button(action: {
                ///SEARCH ACTION
            }) {
                Text("Search")
                    .foregroundColor(.black)
            }.padding(.trailing)
        }
    }
}
