//
//  AnalyticsDetail.swift
//  App121
//
//  Created by Вячеслав on 6/15/23.
//

import SwiftUI
import AVKit

struct AnalyticsDetail: View {
    
    @Environment(\.presentationMode) var router
    
    let analytic: AnalyticsItem
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Analytics")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("yellow"))
                                .font(.system(size: 18, weight: .semibold))
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        VStack(spacing: 20) {
                            
                            HStack {
                                
                                Text("Duration: \(analytic.duration) minutes")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Spacer()
                                
                                Circle()
                                    .fill(.green)
                                    .frame(width: 10, height: 10)
                            }
                            
                            Text(analytic.title)
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            if let url = URL(string: analytic.video) {
                                
                                VideoPlayer(player: AVPlayer(url: url))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 250)
                                    .cornerRadius(20)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.1)))
                        .padding()
                        
                        HStack {
                            
                            Text("Comments")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                            
                            Text("0")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .padding()
                        
                        VStack {
                            
                            Text("Empty comments")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                            
                            Text("No any comments")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .padding(.vertical, 50)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct AnalyticsDetail_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsDetail(analytic: AnalyticsItem(id: 0, categoryId: 0, title: "Title", image: "image", video: "video", duration: 10))
    }
}
