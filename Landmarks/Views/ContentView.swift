//
//  ContentView.swift
//  Landmarks
//
//  Created by Kresna Satya on 05/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
