//
//  DogBreedDataSourceDelegate.swift
//  assignment-2-befe19
//
//  Created by Buğrahan Efe on 14.11.2023.
//

import Foundation

protocol DogBreedDataSourceDelegate {
    func dogBreedListLoaded(dogBreedList: listObject)
    func dogBreedImageLoaded(dogBreedImage: imageObject)
}
