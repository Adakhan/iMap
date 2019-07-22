//
//  ServerManager.swift
//  Map
//
//  Created by Adakhanau on 22/07/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import Foundation

class ServerManager {
    
    static let shared = ServerManager()
    
    private let link = "https://bishkekcourses.firebaseio.com/courses.json"
    
    func loadPlaces( completion: @escaping (Places)->() ) {
        guard let url = URL(string: link) else { return }
        
    }
}
