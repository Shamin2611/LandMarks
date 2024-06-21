//
//  LandMarkService.swift
//  LandMarks
//
//  Created by Mostafa Shamin on 21/6/24.
//

//import Foundation
//
//protocol LandmarkService {
//    func loadLandmarks() -> [Landmark]
//}
//
//class JSONLandmarkService: LandmarkService {
//    func loadLandmarks() -> [Landmark] {
//        guard let url = Bundle.main.url(forResource: "landmarkData", withExtension: "json") else {
//            fatalError("Failed to locate landmarks.json in bundle.")
//        }
//        
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = JSONDecoder()
//            let landmarks = try decoder.decode([Landmark].self, from: data)
//            return landmarks
//        } catch {
//            fatalError("Failed to load landmarks.json from bundle: \(error.localizedDescription)")
//        }
//    }
//}

import Foundation

protocol LandmarkService {
    func loadLandmarks() -> [Landmark]
    func setURL(_ url: URL)
}

class JSONLandmarkService: LandmarkService {
    
    private var url: URL?
    
    func setURL(_ url: URL) {
        self.url = url
    }
    
    func loadLandmarks() -> [Landmark] {
        guard let url = self.url ?? Bundle.main.url(forResource: "landmarkData", withExtension: "json") else {
            fatalError("Failed to locate landmarks.json in bundle.")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let landmarks = try decoder.decode([Landmark].self, from: data)
            return landmarks
        } catch {
            fatalError("Failed to load landmarks.json from bundle: \(error.localizedDescription)")
        }
    }
}
