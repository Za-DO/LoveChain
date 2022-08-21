//
//  HomeView.swift
//  LoveChain
//
//  Created by 유정인 on 2022/08/20.
//

import SwiftUI
jjjj
struct HomeView: View {
    @State var firstNaviLinkActive = false
    @State var spotNumber: Int = 0
    @State var spotTapped: Bool = false
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 0), spacing: 0), count: 10)
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("homeBackground")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading, spacing: 7) {
                            Image("appLogo")
                            HStack(spacing: 4) {
                                Image("loveCoin")
                                    .foregroundColor(Color("mainColor"))
                                Text("0.1399 ($2.04)")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                            }
                        }
                        Spacer()
                        // TODO: Navigation destination 수정
                        NavigationLink(destination: LockOurLoveView(firstNaviLinkActive: $firstNaviLinkActive), isActive: $firstNaviLinkActive) {
                            Image("LoveLocker")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                        }
                    }
                    .padding(.horizontal, 20)
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(1...160, id: \.self) { spotNum in
                            Button {
                                self.spotTapped.toggle()
                                
                            } label: {
                                Rectangle()
                                    .stroke(Color("homeGridColor"))
                                    .frame(width: 40, height: 40)
                            }
                        }
                    }
                    if spotTapped == true {
                        NavigationLink(destination: BuySpotView(spotNumber: $spotNumber)) {
                            Image("homeSpotButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 335)
                        }
                    }
                }
            }
            .navigationTitle("HOME")
            .navigationBarHidden(true)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
