//
//  HomeView.swift
//  LoveChain
//
//  Created by 유정인 on 2022/08/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("homeViewGrid")
                    .resizable()
                    .ignoresSafeArea()
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 7) {
                        Text("LOVE CHAIN")
                            .font(.custom("InsaniburgerwithCheese", size: 24))
                            .foregroundColor(.red)
                        HStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                            Text("0.1399")
                                .font(.custom("InsaniburgerwithCheese", size: 14))
                        }
                        Spacer()
                    }
                    Spacer()
                    // TODO: Navigation destination 수정
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "lock.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                }
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 700, trailing: 20))
            }
            .navigationTitle("MainView")
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
