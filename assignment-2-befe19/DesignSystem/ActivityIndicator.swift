//
//  ActivityIndicator.swift
//  assignment-2-befe19
//
//  Created by Buğrahan Efe on 14.11.2023.
//

import SwiftUI

struct ActivityIndicator: View {

    private let isLoading: Bool
    private let action: () -> Void

    init(isLoading: Bool, action: @escaping () -> Void) {
        self.isLoading = isLoading
        self.action = action
    }

    var body: some View {
        if isLoading {
            VStack(spacing: Spacing.spacing_1) {
                ProgressView()
                Text("Loading...")
            }
            .onAppear(perform: {
                action()
            })
        }
    }
}


#Preview {
    ActivityIndicator(isLoading: true, action: {})
}
