//
//  ContentView.swift
//  App121
//
//  Created by IGOR on 10/06/2023.
//

import SwiftUI
import Amplitude

struct ContentView: View {
    
    @StateObject var viewModel = WebSystemViewModel()
    @AppStorage("status") var status: Bool = false
    
    @State var server: String = ""
    
    @State var current_tab: Tab = Tab.Analytics
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            if server.isEmpty {
                
                LoadingView()
                
            } else {
                
                if server == "0" {
                    
                    if status {
                        
                        WebSystem()
                        
                    } else {
                        
                        Users_1()
                    }
                    
                } else if server == "1" {
                    
                    if status {
                        
                        VStack(spacing: 0, content: {
                            
                            TabView(selection: $current_tab, content: {
                                
                                Analitics()
                                    .tag(Tab.Analytics)
                                
                                Traders()
                                    .tag(Tab.Traders)
                                
                                DiaryView()
                                    .tag(Tab.Diary)
                                
                                Settings()
                                    .tag(Tab.Settings)
                            })
                            
                            TabBar(selectedTab: $current_tab)
                        })
                        .ignoresSafeArea(.all, edges: .bottom)
                        .onAppear {

                            Amplitude.instance().logEvent("did_show_main_screen")
                        }
                        
                    } else {
                        
                        Reviewers_1()
                    }
                }
            }
        }
        .onAppear {
            
            check_data(isCaptured: false)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in

            check_data(isCaptured: true)
        }
    }
    
    private func check_data(isCaptured: Bool) {
        
        let repository = RepositorySecond()
        let myData = MyDataClass.getMyData()
        
        repository.post(isCaptured: isCaptured, isCast: false, mydata: myData) { result in
            
            switch result {
            case .success(let data):
                if "\(data)" == "" {
                    
                    self.server = "1"
                    
                } else {
                    
                    self.server = "\(data)"
                }
            case .failure(_):
                
                self.server = "1"
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
