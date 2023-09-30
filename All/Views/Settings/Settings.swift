//
//  Settings.swift
//  App121
//
//  Created by IGOR on 10/06/2023.
//

import SwiftUI
import StoreKit

struct Settings: View {
    
    @AppStorage("name") var name: String = ""
    @AppStorage("password") var password: String = ""
    
    @AppStorage("status") var status: Bool = false
    
    @State var isEdit: Bool = false
    @State var isDelete: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding([.horizontal, .top])
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Image(systemName: "camera")
                        .foregroundColor(.white)
                        .background(Circle().fill(Color.white.opacity(0.1))
                            .frame(width: 100, height: 100))
                        .padding(.vertical, 50)
                    
                    Text(name.isEmpty ? "Name" : name)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            isEdit = true
                        }
                        
                    }, label: {
                        
                        Text("Edit profile")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .medium))
                            .frame(width: 100, height: 35)
                            .background(RoundedRectangle(cornerRadius: 8)
                                .fill(Color("yellow")))
                    })
                    .padding()
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image("starfill")
                            
                            Text("Rate Our App")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                            Image("right")
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(RoundedRectangle(cornerRadius: 8)
                            .fill(.gray.opacity(0.1)))
                        .padding(.horizontal)
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://docs.google.com/document/d/1IgxxT5rRLMSX0nIHFFzpGBNRxYNfgZkcUHNE8QgXvZM/edit?usp=sharing") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Image("comment")
                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                            Image("right")
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(RoundedRectangle(cornerRadius: 8)
                            .fill(.gray.opacity(0.1)))
                        .padding(.horizontal)
                    })
                }
                .padding(.vertical)
                
                Spacer()
            }
        }
        .overlay (
        
            ZStack {
                
                Color.black.opacity(isEdit ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isEdit = false
                        }
                    }
                
                VStack {
                    
                    Text("Edit Profile")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.bottom, 20)
                    
                    VStack(alignment: .leading, content: {
                        
                        Text("Your Name")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text(name)
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(name.isEmpty ? 1 : 0)
                            
                            TextField("", text: $name)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    })
                    
                    VStack(alignment: .leading, content: {
                        
                        Text("Delete Account")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isDelete = true
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 14, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.red.opacity(0.15)))
                        })
                    })
                    .padding(.top, 20)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                .padding()
                .offset(y: isEdit ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay (
        
            ZStack {
                
                Color.black.opacity(isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isDelete = false
                        }
                    }
                
                VStack {
                    
                    Text("Delete Account")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.bottom, 20)
                    
                    Text("Are you sure you want to delete your account? All data will be permanently deleted from our platform without a refund")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        status = false
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.red.opacity(0.15)))
                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                .padding()
                .offset(y: isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
