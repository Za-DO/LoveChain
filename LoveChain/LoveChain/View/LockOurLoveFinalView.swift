//
//  LockOurLoveFinalView.swift
//  LoveChain
//
//  Created by Terry Koo on 2022/08/21.
//

import SwiftUI

struct LockOurLoveFinalView: View {
    @Binding var firstNaviLinkActive: Bool
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Text("YOUR LOVE IS LOCKED!")
                    .font(.custom("InsaniburgerwithCheese", size: 20))
                ZStack {
                    Image("coupleImage")
                        .resizable()
                        .frame(width: 315, height: 315)
                    Image("LoveLocker")
                        .offset(x: 120, y: -120)
                }
                HStack {
                    Text("MINJI")
                        .font(.custom("InsaniburgerwithCheese", size: 20))
                        .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    Text("DONGJUN")
                        .font(.custom("InsaniburgerwithCheese", size: 20))
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.black)
                        .offset(x: -25, y: 0)
                }
                Divider()
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                VStack(alignment: .leading) {
                Text("BUY COUPLE SITE")
                    .font(.custom("InsaniburgerwithCheese", size: 20))
                Text("You can buy the couple site to hang a lock")
                    .font(.custom("InsaniburgerwithCheese", size: 10))
                }
                .offset(x: -33, y: 0)
                ZStack {
                    Image("GoButton")
                        .resizable()
                        .frame(width: 302, height: 72)
                    Button(action: {
                        // TODO: - 메인뷰로 이동 로직 구현
                        print("메인뷰로 이동")
                        firstNaviLinkActive.toggle()
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 302, height: 72)
                            .opacity(0)
                    })
                }
            }
            .padding()
        }
    }
}
//
//struct LockOurLoveFinalView_Previews: PreviewProvider {
//    static var previews: some View {
//        LockOurLoveFinalView()
//    }
//}
