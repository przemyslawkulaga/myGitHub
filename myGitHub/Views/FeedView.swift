//
//  FeedView.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 18/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import SwiftUI

struct testData {
    let id = UUID()
    let name: String
    let type: String
}

struct FeedView: View {
    var testList = [
        testData(name: "Hi!", type: "Comment"),
        testData(name: "Hello!", type: "Comment"),
        testData(name: "Hola!", type: "Comment"),
        testData(name: "I like this!", type: "Like"),
        testData(name: "Check my profile!", type: "Comment"),
        testData(name: "Not that good!", type: "Dislike"),
        testData(name: "Great code!", type: "Comment"),
        testData(name: "Do it better next time!", type: "Comment")
    ]
    
    var body: some View {
        List {
            ForEach(testList, id: \.id) { item in
                VStack {
                    Text(item.type)
                        .foregroundColor(.gray)
                        .font(.system(size: 8))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(item.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
