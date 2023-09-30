//
//  Login.swift
//  App121
//
//  Created by IGOR on 10/06/2023.
//

import SwiftUI

struct Login: View {
    
    @AppStorage("name") var name: String = ""
    @AppStorage("password") var password: String = ""

    @AppStorage("status") var status: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image("back")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                        
                    })
                    
                    Spacer()
                }
                .padding()
                
                Image("logo_big")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .padding()
                
                Text("Log In")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                
                Text("Log In complete with other users")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .regular))
                    .padding(.bottom, 30)
                
                VStack {
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter your name")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(name.isEmpty ? 1 : 0)
                        
                        TextField("", text: $name)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                    .padding(.horizontal)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter password")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(password.isEmpty ? 1 : 0)
                        
                        TextField("", text: $password)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                    .padding(.horizontal)
                    
                    Button(action: {
                        
                        name = name
                        password = password
                        status = true
                        
                    }, label: {
                        
                        Text("Log In")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 7).fill(name.isEmpty || password.isEmpty ? Color.gray.opacity(0.5) : Color("primary")))
                            .padding(.horizontal)
                            .padding(.top, 30)
                    })
                    .disabled(name.isEmpty || password.isEmpty ? true : false)
                    
                    Spacer()
                }
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
