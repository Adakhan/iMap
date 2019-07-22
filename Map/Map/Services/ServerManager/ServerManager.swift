//
//  ServerManager.swift
//  Map
//
//  Created by Adakhanau on 22/07/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import Foundation
import Alamofire

class ServerManager {
    
    static let shared = ServerManager()
    
    private let link = "https://bishkekcourses.firebaseio.com/courses.json"
    
    func loadPlaces( completion: @escaping ([Courses])->() ) {
        
        guard let url = URL(string: link) else { return }
        
        Alamofire.request(url).validate().response { (response) in
            let data = response.data
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                let information = try decoder.decode([Courses].self, from: data!)
                DispatchQueue.main.async {
                    completion(information)
                }
            } catch let jsonErr {
                print("JSON error:", jsonErr)
            }
        }
        
    }
    
}
