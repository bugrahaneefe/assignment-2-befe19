//
//  BreedListView.swift
//  assignment-2-befe19
//
//  Created by Buğrahan Efe on 14.11.2023.
//

import SwiftUI

struct BreedListView: View {

    @StateObject private var viewModel = BreedListViewModel()
    @State private var isSheetPresented = false

    var body: some View {

        VStack {
            ActivityIndicator(
                isLoading: viewModel.isLoading,
            action: viewModel.loadDogBreedList)
        }
        .navigationTitle("Breeds List")
        if !viewModel.isLoading {
            List(viewModel.dogBreedList, id:\.self) { object in
                Text(object)
                    .onTapGesture {
                        viewModel
                            .loadDogBreedImage(
                                breedName: object)
                        isSheetPresented.toggle()
                    }
            }
            .sheet(isPresented: $isSheetPresented, content: {
                HStack(content: {
                    if let imageURL = viewModel.dogBreedImageURL {
                        AsyncImage(url: imageURL) { image in
                            image
                                .imageSheet()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 250, height: 250)
                    }
                })
                .ignoresSafeArea(.all)
                .background(Image("breedsBackground"))
                .presentationDetents([.medium])

            })
        }
    }
}

#Preview {
    BreedListView()
}
