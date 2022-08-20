//
//  HomeView.swift
//  LoveChain
//
//  Created by 유정인 on 2022/08/20.
//

import SwiftUI

struct HomeView: View {
    @State var isTouchedFillBlock: Bool = false
    @State var isTouchedEmptyBlock: Bool = false
    
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
                    NavigationLink(destination: LockOurLoveView()) {
                        Image(systemName: "lock.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    
                }
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 700, trailing: 20))
                VStack {
                    Button {
                        self.isTouchedFillBlock = true
                    } label: {
                        Rectangle()
                            .frame(height: 330)
                            .opacity(0)
                    }
                    Button {
                        self.isTouchedEmptyBlock = true
                    } label: {
                        Rectangle()
                            .frame(height: 330)
                            .opacity(0)
                    }
                }
                .padding(.top, 90)
                
                if isTouchedFillBlock == true {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.8)
                        .ignoresSafeArea()
                        .onTapGesture {
                            self.isTouchedFillBlock = false
                        }
                    VStack(alignment: .trailing) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 314, height: 72)
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Spot 56")
                                    .font(.custom("InsaniburgerwithCheese", size: 24))
                                    .foregroundColor(.white)
                                HStack {
                                    Text("#3302")
                                        .font(.custom("InsaniburgerwithCheese", size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Spacer()
                                    HStack {
                                        Image(systemName: "heart.fill")
                                            .foregroundColor(.red)
                                        Text("0.1399 ($179.14)")
                                            .font(.custom("InsaniburgerwithCheese", size: 12))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        .padding(.bottom, 28)
                        Image("coupleImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 315)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        Text("Minji \(Image(systemName: "heart.fill")) Dongjun")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 38)
                }
                if isTouchedEmptyBlock == true {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.000001)
                        .ignoresSafeArea()
                        .onTapGesture {
                            self.isTouchedEmptyBlock = false
                        }
                    Group {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 335, height: 72)
                        HStack(spacing: 62) {
                            Text("You can buy this spot!")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            NavigationLink(destination: ContentView()) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.white)
                                        .frame(width: 69, height: 41)
                                    Image(systemName: "arrow.right")
                                        .font(.system(size: 30))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    .padding(.top, 680)
                }
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
