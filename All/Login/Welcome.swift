//
//  Welcome.swift
//  App121
//
//  Created by IGOR on 10/06/2023.
//

import SwiftUI

struct Welcome: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo_big")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                
                Text("Welcome!")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                
                Text("You can log in to your account or register")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
            }
            .padding(.bottom, 90)
            
            VStack {
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Login()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Log In")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 7).fill(Color.gray).opacity(0.1))
                        .padding(.horizontal)
                })
                
                NavigationLink(destination: {
                    
                    Register()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Register")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 7).fill(Color("primary")))
                        .padding(.horizontal)
                })
            }
            .padding(.bottom)
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
