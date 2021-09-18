//
//  ContentView.swift
//  gb-swiftui
//
//  Created by Marat Khanbekov on 09.09.2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var login: String = ""
    @State private var password: String = ""
    @State private var keyboardHeight: CGFloat = 0

    
    private let kbHeightPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .compactMap { $0.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect }
            .map { $0.size.height },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ -> CGFloat in 0 })
        .removeDuplicates()
    
    var body: some View {
        
        ZStack {

            Color(red: 81/255, green: 129/255, blue: 184/255, opacity: 1)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .frame(minWidth: 100, idealWidth: 100, maxWidth: 100, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: .center)
                    Spacer()

                    VStack (spacing: 20) {


                        HStack (spacing: 10) {
                            Label("Login", systemImage: "person.fill")
                                .foregroundColor(Color.white)
                            Spacer()
                            TextField("", text: $login)
                                .frame(width: 200, height: 40, alignment: .trailing)
                                .background(Color.white)
                                .clipShape(Capsule())
                                .shadow(radius: 2)
                        }

                        HStack (spacing: 10) {
                            Label("Password", systemImage: "key")
                                .foregroundColor(Color.white)
                            Spacer()
                            SecureField("", text: $password)
                                .frame(width: 200, height: 40, alignment: .trailing)
                                .background(Color.white)
                                .clipShape(Capsule())
                                .shadow(radius: 2)
                        }
                    }.padding(30)

                    Spacer()

                    Button(action: {debugPrint("Login button pressed")}) {
                        Text("Login")
                    }
                    .foregroundColor(Color.black)
                    .frame(width: 100, height: 40, alignment: .center)
                    .background(Color(red: 214/255, green: 222/255, blue: 236/255, opacity: 1))
                    .clipShape(Capsule())
                    .shadow(radius: 2)
                    Spacer()
                        .disabled(login.isEmpty || password.isEmpty)

                }
            }
        }
        .padding(.bottom, keyboardHeight)
        .onReceive(kbHeightPublisher) { height in
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                self.keyboardHeight = height - 20
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
            
        }
    }
}
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// 1. Создаем Builder
@resultBuilder struct MyBuilder {
    static func buildBlock(_ atrs: String...) -> String {
        return atrs.reduce("", + )
    }
}
// 2. Добавляем его атрибутом перед кложурой в каком либо методе
func stringsReduce(@MyBuilder block: () -> String) -> String {
    return block()
}



struct Container <Content : View> : View {
    var content : Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.blue.opacity(0.3))
            VStack {
                Spacer()
                
                content
                    .font(.system(size: 20))
                    .foregroundColor(.secondary)
                    .padding()
                
                Spacer()
                
                Divider()
                
                HStack {
                    Button(action: {
                        // action
                    }) {
                        Image(systemName: "hand.thumbsup")
                    }.frame(width: 150)
                    
                    Divider()
                    
                    Button(action: {
                        // action
                    }) {
                        Image(systemName: "hand.thumbsdown")
                    }
                    .frame(width: 150)
                }
                .font(.system(size: 20))
                .frame(height: 50)
                .padding()
            }
        }
        .padding()

    }
}
