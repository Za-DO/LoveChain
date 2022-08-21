//
//  HomeView.swift
//  LoveChain
//
//  Created by 유정인 on 2022/08/20.
//

import SwiftUI

struct HomeView: View {
    @State var firstNaviLinkActive = false
    @State var spotNumber: Int = 0
    @State var spotTapped: Bool = false
    var coupleData: CoupleCertificateData
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 38), spacing: 0), count: 10)
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("homeBackground")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 7) {
                            Image("appLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 160)
                            HStack(spacing: 4) {
                                Image("loveCoin")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .foregroundColor(Color("mainColor"))
                                Text("0.1399 ($2.04)")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                            }
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 20) {
                            NavigationLink(destination: LockOurLoveView(firstNaviLinkActive: $firstNaviLinkActive), isActive: $firstNaviLinkActive) {
                                Image("LoveLocker")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                            }
                            Image("spotInfo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 154)
                        }
                    }
                    .padding(.horizontal, 20)
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(1...160, id: \.self) { spotNum in
                            Button {
                                self.spotTapped.toggle()
                                self.spotNumber = spotNum
                            } label: {
                                if coupleData.spotStatement == .soldout {
                                    Image(dataSource.filter({$0.id == spotNum}).isEmpty ? "vacancySpot" : dataSource.filter({$0.id == spotNum})[0].coupleImage )
                                        .resizable()
                                        .scaledToFit()
                                        .opacity(0.4)
                                        .frame(width: 38)
                                }
                            }
                        }
                    }
                }
                VStack {
                    Spacer()
                    if self.spotTapped == true {
                        NavigationLink(destination: BuySpotView(spotNumber: $spotNumber, spotTapped: $spotTapped)) {
                            Image("homeSpotButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 335)
                        }
                    }
                }
                if self.spotTapped == true {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.8)
                        .ignoresSafeArea()
                        .onTapGesture {
                            self.spotTapped = false
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
                                        Image("loveCoin")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20)
                                        Text("0.1399 ($2.04)")
                                            .font(.custom("InsaniburgerwithCheese", size: 12))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        .padding(.bottom, 28)
                        Image("coupleImage1")
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
            }
            .navigationTitle("HOME")
            .navigationBarHidden(true)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(coupleData: CoupleCertificateData(id: 1, hashData: "#1-1", coupleImage: "coupleImage1", spotStatement: .soldout))
    }
}
