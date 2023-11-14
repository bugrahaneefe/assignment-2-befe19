//
//  Image.swift
//  assignment-2-befe19
//
//  Created by Buğrahan Efe on 14.11.2023.
//

import SwiftUI

extension Image {
    func imageSheet() -> some View {
        self
            .resizable()
            .clipShape(.buttonBorder)
   }
}

