//
//  RankingsView.swift
//  EP3_PRACTICE
//
//  Created by Guillermo on 9/12/23.
//

import SwiftUI
import CoreData

struct RankingsView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "score", ascending: true)]) var result: FetchedResults<Results>
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(result) {result in
                    HStack {
                        Text(result.name!)
                        Spacer()
                        Text(String(result.score))
                    }
                }
            }
        }
    }
}

struct RankingsView_Previews: PreviewProvider {
    static var previews: some View {
        RankingsView()
    }
}
