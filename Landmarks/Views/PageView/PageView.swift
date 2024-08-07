//
//  PageView.swift
//  Landmarks
//
//  Created by Kresna Satya on 07/08/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
                .aspectRatio(1.5, contentMode: .fit)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

#Preview {
    PageView(pages: ModelData().features.map({ FeatureCard(landmark: $0)
    }))
}
