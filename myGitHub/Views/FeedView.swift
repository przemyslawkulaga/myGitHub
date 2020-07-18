//
//  FeedView.swift
//  myGitHub
//
//  Created by Przemysław Kułaga on 18/07/2020.
//  Copyright © 2020 Przemysław Kułaga. All rights reserved.
//

import SwiftUI

struct TestData {
    let id = UUID()
    let name: String
    let type: String
}

struct GridTestData {
    let id = UUID()
    let leftTestData: TestData?
    let rightTestData: TestData?
}

struct FeedView: View {
    @State var gridSelected = false
    
    var testList = [
        TestData(name: "Hi!", type: "Comment"),
        TestData(name: "Hello!", type: "Comment"),
        TestData(name: "Hola!", type: "Comment"),
        TestData(name: "I like this!", type: "Like"),
        TestData(name: "Check my profile!", type: "Comment"),
        TestData(name: "Not that good!", type: "Dislike"),
        TestData(name: "Great code!", type: "Comment"),
        TestData(name: "Do it better next time!", type: "Comment")
    ]
    
    var gridTestList = [
        GridTestData(leftTestData: TestData(name: "Hi!", type: "Comment"), rightTestData: TestData(name: "Hello!", type: "Comment")),
        GridTestData(leftTestData: TestData(name: "Hola!", type: "Comment"), rightTestData: TestData(name: "I like this!", type: "Like")),
        GridTestData(leftTestData: TestData(name: "Check my profile!", type: "Comment"), rightTestData: TestData(name: "Not that good!", type: "Dislike")),
        GridTestData(leftTestData: TestData(name: "Great code!", type: "Comment"), rightTestData: nil)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                if gridSelected {
                    GridView(gridTestList: gridTestList)
                } else {
                    ListView(testList: testList)
                }
            }
            .navigationBarTitle("Feed")
            .navigationBarItems(trailing:
                Button(action: {
                    self.gridSelected = !self.gridSelected
                }, label: {
                    gridSelected ? Image(systemName: "list.dash") : Image(systemName: "square.grid.2x2")
                })
            )
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

struct FeedRow: View {
    var nameValue: String?
    var typeValue: String?
    
    var body: some View {
        VStack {
            Text(typeValue ?? "")
                .foregroundColor(.gray)
                .font(.system(size: 8))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(nameValue ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct ListView: View {
    var testList: [TestData]
    
    var body: some View {
        List {
            ForEach(testList, id: \.id) { item in
                FeedRow(nameValue: item.name, typeValue: item.type)
            }
        }
    }
}

struct GridView: View {
    var gridTestList: [GridTestData]
    
    var body: some View {
        List {
            ForEach(gridTestList, id: \.id) { item in
                HStack {
                    FeedRow(nameValue: item.leftTestData?.name, typeValue: item.leftTestData?.type)
                    FeedRow(nameValue: item.rightTestData?.name, typeValue: item.rightTestData?.type)
                }
            }
        }
    }
}
