//
//  NextView.swift
//  UI-138
//
//  Created by にゃんにゃん丸 on 2021/03/04.
//

import SwiftUI

struct NextView: View {
    @State var mail = ""
    @State var pass = ""
    @State var show = false
    var body: some View {
        
        ZStack{
            
            Color("c1")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:15){
                
                VStack(spacing:15){
                    
                    Image("p1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                       
                       
                    
                    
                    
                }
                .modifier(TopModefier())
                .padding(.bottom,20)
                
                HStack{
                    
                     Image(systemName: "envelope.fill")
                        .foregroundColor(.gray)
                    
                    TextField("Enter Your Email", text: $mail)
                }
                .modifier(TextModeifier())
                
                HStack{
                    
                     Image(systemName: "key")
                    
                    SecureField("Enter Your Password", text: $pass)
                    
                    Button(action: {}) {
                        
                        Image(systemName: "eyeglasses")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                        
                    }
                    .buttonStyle(ButttonModeifier())
                   
                    
                    
                }
                .modifier(TextModeifier())
                
                Button(action: {}) {
                    Text("Login")
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                }
                .buttonStyle(ButttonModeifier())
                
               
                
                Text("or")
                    .foregroundColor(.gray)
                
                HStack(spacing:30){
                    
                    
                    Button(action: {}) {
                        
                        Image("p2")
                            .resizable()
                            .renderingMode(.original)
                            
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                    }
                    .buttonStyle(OtherModeifier())
                    
                    
                    Button(action: {
                        
                        show.toggle()
                    }) {
                        
                        Image("p3")
                            .resizable()
                            .renderingMode(.original)
                            
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                    }
                    .buttonStyle(OtherModeifier())
                        
                      
                        
                    
                   
                    
                  
                        
                      
                        
                   
                }
                .padding(.top,20)
                
               
                
        
                
               
                
                
                
                
            }
            .padding(.horizontal,30)
            
        }
        .fullScreenCover(isPresented: $show) {
            
            CustomTab()
            
        }
        
        
          
            
      
       
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView()
    }
}

struct TopModefier : ViewModifier {
    func body(content: Content) -> some View {
        content.background(Color("c1"))
            .padding(20)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 6, x: 10, y: 10)
            .shadow(color: Color.white, radius: 6, x: -8, y: -8)
    }
}

struct TextModeifier : ViewModifier {
    func body(content: Content) -> some View {
        content.padding(20)
            .background(Color("c1"))
            .cornerRadius(15)
            
            .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black.opacity(0.05),lineWidth: 4)
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            )
           
    }
}

struct ButttonModeifier : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.background(Color("c1")).cornerRadius(15)
            .overlay(
            
                VStack{
                    if configuration.isPressed{
                        
                        
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.blue.opacity(0.05),lineWidth: 4)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: -5, y: -5)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    
                }
            
            )
            .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.2), radius: 5, x: 5, y: 5)
            .shadow(color: Color.white.opacity(configuration.isPressed ? 0 : 0.6),radius: 5, x: -5,y: -5)
    }
}


struct OtherModeifier : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.background(Color("c1")).clipShape(Circle())
            .overlay(
            
                VStack{
                    if configuration.isPressed{
                        
                        
                      Circle()
                            .stroke(Color.blue.opacity(0.05),lineWidth: 4)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                        .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: -5, y: -5)
                            .clipShape(Circle())
                    }
                    
                }
            
            )
            .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.2), radius: 5, x: 5, y: 5)
            .shadow(color: Color.white.opacity(configuration.isPressed ? 0 : 0.6),radius: 5, x: -5,y: -5)
    }
}
