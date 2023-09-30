//
//  AnaliticsViewModel.swift
//  App121
//
//  Created by IGOR on 14/06/2023.
//

import SwiftUI
import Alamofire

final class AnalyticsViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var lessons: [AnalyticsItem] = []
    
    func getAnalytics() {
        
        isLoading = true
        
        self.fetchAnalytics { result in
            
            switch result {
                
            case .success(let success):
                
                self.lessons = success.rows
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchAnalytics(completion: @escaping (Result<AnalyticsModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "5079ee13-2fe0-4afd-a19f-dace7febd545",
        ]
        
        let request = AF.request("https://gasartyu.site/api/v2/video", method: .get, parameters: params)
        
        request.responseDecodable(of: AnalyticsModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
