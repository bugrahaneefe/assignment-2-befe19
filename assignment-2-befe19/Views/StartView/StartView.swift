//
//  ContentView.swift
//  assignment-2-befe19
//
//  Created by Buğrahan Efe on 14.11.2023.
//

import SwiftUI

struct StartView: View {

    @StateObject private var viewModel = StartViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                ImageDS.mainBackground(imageName: "breedsBackground")
                VStack(spacing: .zero) {
                    startButtonView
                }
                .navigationTitle(viewModel.navigationTitle)
                .navigationBarTitleDisplayMode(.large)
            }
        }
        .tint(.AppColor)
    }

    private var startButtonView: some View {
        NavigationLink(destination: BreedListView()) {
            TextDS.buttonText(title: "Start !")
        }
    }

}

#Preview {
    StartView()
}
