//
//  DiaryView.swift
//  App121
//
//  Created by Вячеслав on 6/15/23.
//

import SwiftUI

struct DiaryView: View {
    
    @StateObject var viewModel = DiaryViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Diary")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .padding([.horizontal, .top])
                
                VStack(alignment: .leading, content: {
                    
                    Text("\(Date().convertDate(format: "MMM d"))")
                        .foregroundColor(.black)
                        .font(.system(size: 13, weight: .medium))
                    
                    Text("Today")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("yellow")))
                .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.diaries) { index in
                            
                            HStack {
                                
                                VStack(spacing: 10) {
                                    
                                    Image(index.currency)
                                    
                                    Text("\(index.date.convertDate(format: "HH:mm"))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Text("\(index.date.convertDate(format: "MMM d"))")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                                VStack(alignment: .leading, content: {
                                    
                                    Text(index.text)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                                        .multilineTextAlignment(.leading)
                                    
                                    HStack {
                                        
                                        Circle()
                                            .fill(.gray.opacity(0.1))
                                            .frame(width: 24, height: 24)
                                            .overlay (
                                            
                                                Image(systemName: "camera")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 11, weight: .regular))
                                            )
                                        
                                        Text(index.name)
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .medium))
                                    }
                                })
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                
                                Spacer()
                            }
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
