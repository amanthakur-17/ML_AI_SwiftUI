//
//  ContentView.swift
//  ML_AI_SwiftUI
//
//  Created by Aman on 29/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Natural Language") {
                    NaturalLanguageView()
                }
                
                NavigationLink("Text In Image Recognizer") {
                    MainView()
                }
                //
                //                       NavigationLink("Feature 3") {
                //                           Feature3View()
                //                       }
                //
                //                       NavigationLink("Feature 4") {
                //                           Feature4View()
                //                       }
            }
            .navigationTitle("Main Menu")    }
    }
}

#Preview {
    ContentView()
}
