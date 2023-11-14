//
//  TextDS.swift
//  assignment-2-befe19
//
//  Created by Buğrahan Efe on 14.11.2023.
//

import SwiftUI

struct TextDS {
    @ViewBuilder
    static func buttonText(title: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.black)
                .padding(.horizontal, 30)
                .padding(.vertical, 6)
        }
        .padding(.vertical, 20)
        .background(Color("buttonColor"))
        .clipShape(.buttonBorder)
    }
}
