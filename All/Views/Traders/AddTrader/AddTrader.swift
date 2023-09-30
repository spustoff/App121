//
//  AddTrader.swift
//  App121
//
//  Created by IGOR on 12/06/2023.
//

import SwiftUI

struct AddTrader: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = AddTraderViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New trader")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image("back")
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 90)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        HStack {
                                                
                            ZStack(alignment: .leading, content: {
                                
                                Text("Name")
                                    .foregroundColor(viewModel.tradersName.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.tradersName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.tradersName)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.horizontal, 4)
                        
                        HStack {
                                                
                            ZStack(alignment: .leading, content: {
                                
                                Text("Traders balance")
                                    .foregroundColor(viewModel.tradersBalance.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.tradersBalance.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.tradersBalance)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .keyboardType(.decimalPad)
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.horizontal, 4)
                        
                        HStack {
                                                
                            ZStack(alignment: .leading, content: {
                                
                                Text("Traders portfoy")
                                    .foregroundColor(viewModel.tradersPortfoy.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.tradersPortfoy.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.tradersPortfoy)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.horizontal, 4)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addToHistory {
                        
                        router.wrappedValue.dismiss()
                        
                        viewModel.tradersName = ""
                        viewModel.tradersBalance = ""
                        viewModel.tradersPortfoy = ""
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        .padding(.vertical)
                })
                .opacity(viewModel.tradersName.isEmpty || viewModel.tradersBalance.isEmpty ? 0.5 : 1)
                .disabled(viewModel.tradersName.isEmpty || viewModel.tradersBalance.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

struct AddTrader_Previews: PreviewProvider {
    static var previews: some View {
        AddTrader()
    }
}
