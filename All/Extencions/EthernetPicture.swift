//
//  EthernetPicture.swift
//  App121
//
//  Created by Вячеслав on 6/15/23.
//

import SwiftUI
import Kingfisher

struct EthernetPicture: View {

    var urlString: String

    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat

    var body: some View {

        if let url = URL(string: urlString) {
            
            let resource = KF.ImageResource(downloadURL: url, cacheKey: "\(url.absoluteString)")

            KFImage(source: .network(resource))
                .resizable()
                .placeholder {

                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: width, height: height)
                        .cornerRadius(cornerRadius)
                        .overlay (

                            Image(systemName: "photo")
                                .foregroundColor(.gray)
                                .font(.system(size: 13))
                        )
                }
                .downsampling(size: CGSize(width: width, height: height))
                .cacheOriginalImage()
                .frame(width: width, height: height)
                .cornerRadius(cornerRadius)
            
        } else {
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.gray.opacity(0.2))
                .frame(width: width, height: height)
                .cornerRadius(cornerRadius)
                .overlay (

                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                )
        }
    }
}
