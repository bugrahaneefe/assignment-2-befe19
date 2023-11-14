//
//  ImageDS.swift
//  assignment-2-befe19
//
//  Created by Buğrahan Efe on 14.11.2023.
//

import SwiftUI

struct ImageDS {
    @ViewBuilder
    static func mainBackground(imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(edges: .bottom)
    }
}
