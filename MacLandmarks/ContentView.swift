//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Kresna Satya on 07/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 700)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
