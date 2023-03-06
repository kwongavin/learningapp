//
//  ContentView.swift
//  (Gavin) Learning App
//
//  Created by Gavin Kwon on 3/5/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContenModel
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
