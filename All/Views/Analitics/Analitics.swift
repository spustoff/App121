//
//  Analitics.swift
//  App121
//
//  Created by IGOR on 14/06/2023.
//

import SwiftUI

struct Analitics: View {
    
    @StateObject var viewModel = AnalyticsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Analytics")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .padding()
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.lessons.isEmpty {
                        
                        VStack {
                            
                            Image("empty")
                            
                            Text("Empty lessons")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                            
                            Text("No any lessons we have")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                                
                                ForEach(viewModel.lessons, id: \.self) { index in
                                    
                                    NavigationLink(destination: {
                                        
                                        AnalyticsDetail(analytic: index)
                                            .navigationBarBackButtonHidden()
                                        
                                    }, label: {
                                        
                                        VStack(alignment: .leading, spacing: 15) {
                                            
                                            EthernetPicture(urlString: index.image, width: .infinity, height: 130, cornerRadius: 15)
                                            
                                            VStack(alignment: .leading, content: {
                                                
                                                Text(index.title)
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .semibold))
                                                    .multilineTextAlignment(.leading)
                                                    .lineLimit(2)
                                                
                                                Text("Duration: \(index.duration) min.")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text("Category ID: \(index.categoryId)")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                            })
                                            .padding(4)
                                        }
                                        .padding(6)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                                    })
                                }
                            }
                            .padding()
                        }
                    }
                }
                
                Spacer()
            }
        }
        .onAppear {
            
            viewModel.getAnalytics()
        }
    }
}

struct Analitics_Previews: PreviewProvider {
    static var previews: some View {
        Analitics()
    }
}
