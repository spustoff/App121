//
//  Traders.swift
//  App121
//
//  Created by IGOR on 10/06/2023.
//

import SwiftUI

struct Traders: View {
    
    @AppStorage("money") var money: Int = 25000
    
    @StateObject var viewModel = TradersViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Text("Traders")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            AddTrader()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image("add")

                        })
                    }
                }
                
                VStack {
                    
                    HStack {
                        
                        Text("My balance")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                        
                        Spacer()
                    }
                    .padding(.bottom, 5)
                    
                    HStack {
                        
                        Text("$ \(money)")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .semibold))
                        
                        Spacer()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray.opacity(0.1)))
                
                if viewModel.getItems().isEmpty {

                    VStack {
                        
                        NavigationLink(destination: {
                            
                            AddTrader()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image("add")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .padding()
                        })

                        Text("Nobody")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .semibold))

                        Text("Add traders you are interested in to set a goal")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                } else {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach(viewModel.getItems(), id: \.self) { index in

                            VStack {
                                
                                Image(systemName: "camera")
                                    .foregroundColor(.gray)
                                    .background(Circle()
                                        .stroke(Color.gray)
                                        .frame(width: 50, height: 50))
                                    .padding(30)
                                
                                VStack(alignment: .leading) {
  
                                    Text(index.tradersName ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .semibold))
                                        .padding(.vertical, 5)
                                                                    
                                    HStack {
                                        
                                        Text("Price")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text("\(index.tradersBalance)$")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .semibold))
                                        
                                    }
                                    
                                    HStack {
                                        
                                        Image("bag")
                                        
                                        Text("\(index.tradersPortfoy)$")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .semibold))

                                    }
                                    
//                                    Button(action: {
//
//                                        if viewModel.saved_traders.contains(index.tradersName ?? "") {
//                                            
//                                            if let indexer = viewModel.saved_traders.firstIndex(of: index.tradersName ?? "") {
//
//                                                viewModel.saved_traders.remove(at: indexer)
//                                            }
//
//                                        } else {
//
//                                            viewModel.saved_traders.append(index.tradersName ?? "")
//                                        }
//
//                                    }, label: {
//
//                                        Image(systemName: viewModel.saved_traders.contains(index.tradersName ?? "") ? "heart.fill" : "heart")
//                                            .foregroundColor(viewModel.saved_traders.contains(index.tradersName ?? "") ? .white : .gray)
//                                            .font(.system(size: 21, weight: .regular))
//                                    })
                                }
                                .padding(.vertical, 8)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.gray.opacity(0.1))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                            .onTapGesture {
                                
                                viewModel.current_trader = index
                                
                                viewModel.isDetail = true
                            }
                        }
                    })
                }
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchHistory()
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .sheet(isPresented: $viewModel.isDetail, content: {

            TraderDetail(viewModel: viewModel)
        })
    }
}

struct Traders_Previews: PreviewProvider {
    static var previews: some View {
        Traders()
    }
}
