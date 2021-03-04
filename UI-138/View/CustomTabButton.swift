//
//  CustomTabButton.swift
//  UI-138
//
//  Created by にゃんにゃん丸 on 2021/03/04.
//

import SwiftUI

struct CustomTabButton: View {
    @Binding var selectedtab : String
    @State var  tabpoint : [CGFloat] = []
    var body: some View {
        HStack(spacing:0){
            
            TAbButton(image: "house", selectedtab: $selectedtab, tabpoint: $tabpoint)
            
            TAbButton(image: "bookmark", selectedtab: $selectedtab, tabpoint: $tabpoint)
            
            TAbButton(image: "terminal", selectedtab: $selectedtab, tabpoint: $tabpoint)
            
            TAbButton(image: "moon", selectedtab: $selectedtab, tabpoint: $tabpoint)
            
        }
        .padding()
        .background(Color.white
                        .clipShape(CustomShape(tabpoint: getcurvepoint() - 15))
        )
        .overlay(
        Circle()
            .fill(Color.purple)
            .frame(width: 10, height: 10)
            .offset(x: getcurvepoint() - 20)
            ,alignment: .bottomLeading
        
        )
        .cornerRadius(15)
        .padding(.horizontal)
    }
    
    func getcurvepoint()-> CGFloat{
        
        
        if tabpoint.isEmpty{
            return 10
        }
        
        else{
            switch selectedtab {
            case "house": return tabpoint[0]
            case "bookmark" : return tabpoint[1]
            case "terminal" : return tabpoint [2]
            default:
                return tabpoint [3]
            }
        }
    }
}

struct CustomTabButton_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}

struct TAbButton : View {
    
    var image : String
    @Binding var selectedtab : String
    @Binding var tabpoint : [CGFloat]
    
    var body: some View{
        
        GeometryReader{reader -> AnyView in
            
            let midx = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                if tabpoint.count <= 4{
                    
                    tabpoint.append(midx)
                }
            }
            
            
          return AnyView(
            Button(action: {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)){
                    selectedtab = image
                }
                
                
            }, label: {
                Image(systemName: "\(image)\(selectedtab == image ? ".fill" : "")")
                    .font(.system(size: 25, weight: .semibold))
                    .offset(y: selectedtab == image ? -15 : 0)
                
                    
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle())
          )
           
            
            
        }
        .frame(height: 50)
        
        
    }
}


