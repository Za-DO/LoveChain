//
//  LockOurLoveView.swift
//  LoveChain
//
//  Created by Terry Koo on 2022/08/20.
//

import SwiftUI

struct LockOurLoveView: View {
    @State var name1: String = ""
    @State var name2: String = ""
    @State var check: Bool = false
    @State private var showingImagePicker = false
    @State var pickedImage: Image?
    @State var action: Bool = false
    
    var body: some View {
        ZStack{
            VStack {
                Text("COUPLE NAME")
                    .font(.custom("InsaniburgerwithCheese", size: 20))
                    .offset(x: -100, y: 0)
                HStack {
                    Spacer()
                        .frame(width: 20, height: 0)
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color("LightGray"))
                        TextField("       Lover 1", text: $name1)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    }
                    .frame(width: 132, height: 47, alignment: .center)
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color("LightGray"))
                        TextField("       Lover 2", text: $name2)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    }
                    .frame(width: 132, height: 47, alignment: .center)
                    Spacer()
                }
                Divider()
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 0))

                Text("MEMORY")
                    .font(.custom("InsaniburgerwithCheese", size: 20))
                    .offset(x: -120, y: 0)
                ZStack {
                    Button(action: {
                        self.showingImagePicker.toggle()
                    }, label: {
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 315, height: 315)
                                .foregroundColor(Color("LightGray"))
                                .shadow(color: .gray, radius: 8, x: 0, y: 1)
                            Image(systemName: "photo")
                                .foregroundColor(Color("DarkGray"))
                                .font(.system(size: 35))
                        }
                    }).sheet(isPresented: $showingImagePicker) {
                        SUImagePicker(sourceType: .photoLibrary) { (image) in
                            self.pickedImage = Image(uiImage: image)
                            print(image)
                        }
                    }

                    pickedImage?.resizable()
                        .frame(width: 315, height: 315)
                        .onTapGesture {
                            showingImagePicker.toggle()
                        }
                        .cornerRadius(8)
                        .sheet(isPresented: $showingImagePicker) {
                        SUImagePicker(sourceType: .photoLibrary) { (image) in
                            self.pickedImage = Image(uiImage: image)
                            print(image)
                        }
                    }
                }
                HStack {
                    if !check {
                        Image(systemName: "square")
                    } else {
                        ZStack {
                            Image(systemName: "checkmark.square.fill")
                        }
                    }
                    Text("By checking this box, I agree to Love Chain's Term of Service")
                        .font(.custom("InsaniburgerwithCheese", size: 15))
                }
                .onTapGesture {
                    check.toggle()
                }
                .padding(EdgeInsets(top: 20, leading: 5, bottom: 20, trailing: 5))
                Spacer()
                if !name1.isEmpty && !name2.isEmpty && pickedImage != nil && check == true {
                    Button(action: {
                        action.toggle()
                    }, label: {
                        ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundColor(.black)
                                    .frame(width: 334, height: 58, alignment: .center)
                            Text("LOCK")
                                .foregroundColor(Color(.white))
                        }
                    })
                } else {
                    Button(action: {
                        // 비활성화
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color("DarkGray"))
                                .frame(width: 334, height: 58, alignment: .center)
                            Text("LOCK")
                                .foregroundColor(Color(.white))
                        }
                    })
                }
            }
            .padding()
            .onChange(of: self.showingImagePicker, perform: { _ in
                print("\(self.showingImagePicker)")
            })
            if action {
                ZStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.8)
                        .ignoresSafeArea()
                    Image("LockAction")
                        .resizable()
                        .frame(width: 315, height: 245)
                    NavigationLink(destination: ContentView(), label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 131, height: 65)
                                .foregroundColor(.black)
                            Text("LOCK!")
                                .font(.custom("InsaniburgerwithCheese", size: 20))
                        }
                        .offset(x: 74, y: 62)
                        
                    })
                }
            }
        }
    }
}

struct LockOurLoveView_Previews: PreviewProvider {
    static var previews: some View {
        LockOurLoveView()
    }
}
