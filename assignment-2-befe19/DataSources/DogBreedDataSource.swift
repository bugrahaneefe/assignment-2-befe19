//
//  DogBreedDataSource.swift
//  assignment-2-befe19
//
//  Created by Buğrahan Efe on 14.11.2023.
//

import Foundation
import SwiftUI

struct DogBreedDataSource {

    private let baseURL = "https://dog.ceo/api"
    var delegate: DogBreedDataSourceDelegate?

    func loadDogBreedList() {
        // MARK: Get Shared URL Session
        let session = URLSession.shared

        // MARK: Create URL
        if let url = URL(string: "\(baseURL)/breeds/list") {

            // MARK: Create URLRequest
            var request = URLRequest(url: url)

            // MARK: Set the http Verb
            request.httpMethod = "GET"

            // MARK: Set header for json
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            // MARK: Create data task
            let dataTask = session.dataTask(with: request) { data, response, error in
                guard let data else { return }
                //print(String(decoding: data, as: UTF8.self))
                let decoder = JSONDecoder()
                do {
                    let dogBreedList = try decoder.decode(listObject.self, from: data)
                    DispatchQueue.main.async {
                        delegate?.dogBreedListLoaded(dogBreedList: dogBreedList)
                    }
                    //print(dogBreedList.message)
                } catch {
                    print(error)
                }
            }

            // MARK: Resume data task
            dataTask.resume()
        }
    }

    func loadDogBreedImage(breed: String) {
        //print("\(breed) tapped in data source")
        // MARK: Get Shared URL Session
        let session = URLSession.shared

        // MARK: Create URL
        if let url = URL(string: "\(baseURL)/breed/\(breed)/images/random") {

            // MARK: Create URLRequest
            var request = URLRequest(url: url)

            // MARK: Set the http Verb
            request.httpMethod = "GET"

            // MARK: Set header for json
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            // MARK: Create data task
            let dataTask = session.dataTask(with: request) { data, response, error in
                guard let data else { return }
                let decoder = JSONDecoder()
                do {
                    let dogBreedImage = try decoder.decode(imageObject.self, from: data)
                    DispatchQueue.main.async {
                        delegate?.dogBreedImageLoaded(dogBreedImage: dogBreedImage)
                    }
                    //print(dogBreedImage.message)
                } catch {
                    print(error)
                }
            }

            // MARK: Resume data task
            dataTask.resume()
        }
    }
}
