//
//  CameraView.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/10.
//

import SwiftUI
struct CameraView: View {
    @ObservedObject private var avFoundationVM = AVFoundationVM()
    @Binding var isActive: Bool
    @Binding var image: UIImage

    var body: some View {
        VStack {
            if avFoundationVM.image == nil {
                VStack(alignment: .center) {
                    CALayerView(caLayer: avFoundationVM.previewLayer)
                    Spacer()
                    Button(action: {
                        self.avFoundationVM.takePhoto()
                    }) {
                        Image(systemName: "camera.circle.fill")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .center)
                    }
                    .padding(.bottom, 100.0)
                }.onAppear {
                    self.avFoundationVM.startSession()
                }.onDisappear {
                    self.avFoundationVM.endSession()
                }

                Spacer()
            } else {
                ZStack(alignment: .topLeading) {
                    VStack {
                        Spacer()
                        Image(uiImage: avFoundationVM.image!)
                        .resizable()
                        .scaledToFill()
                        .aspectRatio(contentMode: .fit)

                        Spacer()
                    }
                    HStack{
                        Button(action: {
                            avFoundationVM.image = nil
                            self.isActive.toggle()
                        }) {
                                Image(systemName: "xmark.circle.fill")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .leading)
                                .foregroundColor(.white)
                                .background(Color.gray)
                        }
                        .frame(width: 80, height: 80, alignment: .center)
                        Button(action: {
                            //ここをDBに保存する形にする
                            //UIImageWriteToSavedPhotosAlbum(avFoundationVM.image!, nil, nil, nil)
                            image = avFoundationVM.image!
                            self.isActive.toggle()
                        }, label: {
                            Text("保存")
                                .frame(width: 80, height: 80, alignment: .trailing)
        
                        })
                    }
                }
            }
        }
    }
}
