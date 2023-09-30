//
//  TraderDetail.swift
//  App121
//
//  Created by IGOR on 13/06/2023.
//

import SwiftUI

struct TraderDetail: View {
    
    @AppStorage("money") var money: Int = 25000
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: TradersViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.current_trader?.tradersName ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image("back")
                  
                        })
                        
                        Spacer()

                    }
                }
                .padding()
                .padding(.top)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        ZStack {
                            
                            Image(systemName: "camera")
                                .foregroundColor(.gray)
                            
                            Circle()
                                .stroke(Color.gray.opacity(0.2), lineWidth: 5)
                                .frame(width: 70, height: 70)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(calculatePercentage() / 100))
                                .stroke(Color("orange"), lineWidth: 5)
                                .frame(width: 70, height: 70)
                                .rotationEffect(.degrees(-90))
                            
                        }
                        .padding()
                        
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                VStack(alignment: .leading) {
                                
                                Text("Final price")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                HStack {
                                    
                                    Image("cash")
                                    
                                    Text("\(viewModel.current_trader?.tradersBalance ?? 0)$")
                                        .foregroundColor(.white)
                                        .font(.system(size: 23, weight: .semibold))
                                }
                                
                                HStack {
                                    
                                    Image(findBalance() < 0 ? "up" : "down")
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text("\(findBalance(), specifier: "%.f") more than yours")
                                            .foregroundColor(findBalance() < 0 ? .green : .red)
                                            .font(.system(size: 16, weight: .semibold))
                                        
                                        Text("Your balance \(money)")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                }
                            }
                            }
                            
                            Button(action: {
                                
                                if viewModel.saved_traders.contains(viewModel.current_trader?.tradersName ?? "") {

                                    if let indexer = viewModel.saved_traders.firstIndex(of: viewModel.current_trader?.tradersName ?? "") {

                                        viewModel.saved_traders.remove(at: indexer)
                                    }
                                } else {

                                    viewModel.saved_traders.append(viewModel.current_trader?.tradersName ?? "")
                                }
                                
                            }, label: {
                                
                                Image(systemName: viewModel.saved_traders.contains(viewModel.current_trader?.tradersName ?? "") ? "heart.fill" : "heart")
                                    .foregroundColor(viewModel.saved_traders.contains(viewModel.current_trader?.tradersName ?? "") ? .white : .gray)
                                    .font(.system(size: 21, weight: .regular))
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
        }
    }
    
    func findBalance() -> Double {
        
        let TraderB = viewModel.current_trader?.tradersBalance
        let myB = money
        
        let fark = Double(TraderB ?? 0) - Double(myB)
        
        return fark
    }
    
    func calculatePercentage() -> Double {
        
        let value = money
        let maxValue = viewModel.current_trader?.tradersBalance
        
        let percentCircle = Double(value) / Double(maxValue ?? 0) * 100
        
        return percentCircle
    }
}

struct TraderDetail_Previews: PreviewProvider {
    static var previews: some View {
        TraderDetail(viewModel: TradersViewModel())
    }
}
