//
//  BreedListViewModel.swift
//  assignment-2-befe19
//
//  Created by Buğrahan Efe on 14.11.2023.
//

import Foundation
import SwiftUI

class BreedListViewModel: ObservableObject {

    @Published var isLoading = true
    @Published var dogBreedList: [String] = []
    @Published var dogBreedImageURL: URL?
    private var dataSource = DogBreedDataSource()

    init() {
        dataSource.delegate = self
    }

    func loadDogBreedList() {
        dataSource.loadDogBreedList()
    }

    func loadDogBreedImage(breedName: String) {
        dataSource.loadDogBreedImage(breed: breedName)
    }

}

extension BreedListViewModel: DogBreedDataSourceDelegate {

    func dogBreedListLoaded(dogBreedList: listObject) {
        isLoading = false
        self.dogBreedList = dogBreedList.message
    }

    func dogBreedImageLoaded(dogBreedImage: imageObject) {
        DispatchQueue.main.async {
            self.dogBreedImageURL = URL(string: dogBreedImage.message)
            //print("\(dogBreedImage.message) is the URL of the dog breed in delegate")
        }
    }
}
