//
//  LandMarkListViewModel.swift
//  LandMarks
//
//  Created by Mostafa Shamin on 21/6/24.
//

//import Foundation
//
//class LandmarkListViewModel {
//    
//    let landmarkService: LandmarkService
//    var landmarks: [Landmark] = []
//    
//    init(landmarkService: LandmarkService = JSONLandmarkService()) {
//        self.landmarkService = landmarkService
//    }
//    
//    func loadLandmarks(completion: @escaping () -> Void) {
//        landmarks = landmarkService.loadLandmarks()
//        completion()
//    }
//    
//    func numberOfLandmarks() -> Int {
//        return landmarks.count
//    }
//    
//    func landmark(at index: Int) -> Landmark {
//        return landmarks[index]
//    }
//}

import Foundation

class LandmarkListViewModel {
    
    let landmarkService: LandmarkService
    var landmarks: [Landmark] = []
    
    init(landmarkService: LandmarkService = JSONLandmarkService()) {
        self.landmarkService = landmarkService
    }
    
    func loadLandmarks(completion: @escaping () -> Void) {
        landmarks = landmarkService.loadLandmarks()
        completion()
    }

    func setURL(_ url: URL) {
        (landmarkService as? JSONLandmarkService)?.setURL(url)
    }
    
    func numberOfLandmarks() -> Int {
        return landmarks.count
    }
    
    func landmark(at index: Int) -> Landmark {
        return landmarks[index]
    }
}

