//
//  Webaaaak.swift
//  App121
//
//  Created by Вячеслав on 6/15/23.
//

import SwiftUI
import FirebaseRemoteConfig
import WebKit

struct WebSystem: View {

    @StateObject var viewModel = WebSystemViewModel()
    
    @State var response: URL = URL(string: "https://")!

    var body: some View {

        ZStack{

            Color("bg")
                .ignoresSafeArea()

            if !response.absoluteString.isEmpty {
                
                WebPresenter(link: response)
            }
        }
        .ignoresSafeArea(.all)
        .onAppear {

            viewModel.getLink(field: "url_link") { result in
                
                response = result
            }
        }
    }
}

final class WebSystemViewModel: ObservableObject {

    func getLink(field: String, completion: @escaping (URL) -> Void) {

        let config = RemoteConfig.remoteConfig()

        config.configSettings.minimumFetchInterval = 300
        config.fetchAndActivate{ _, _ in

            guard
                let url_string = config.configValue(forKey: field).stringValue, let url = URL(string: url_string)

            else {

                return
            }

            completion(url)
        }
    }
}

struct WebPresenter: UIViewRepresentable {

    var link: URL?

    func makeUIView(context: Context) -> WKWebView {

        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {

        guard let link = link else {

            return
        }

        webView.frame.size.height = 1
        webView.frame.size = webView.sizeThatFits(CGSize.zero)
        webView.load(URLRequest(url: link))
    }
}
