//
//  TabBar.swift
//  App121
//
//  Created by IGOR on 10/06/2023.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    @State var tabs: [Tab] = [Tab.Analytics, Tab.Traders, Tab.Diary, Tab.Settings]
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                            
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("yellow") : Color.gray)

                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("yellow") : Color.gray)
                            .font(.system(size: 11, weight: .medium))
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 9)
        .padding(.bottom, 25)
        .background(Color("bg"))
    }
}

enum Tab: String, CaseIterable {
    
    case Analytics = "Analytics"
    
    case Traders = "Traders"
    
    case Diary = "Diary"

    case Settings = "Settings"

}
