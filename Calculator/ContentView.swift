//
//  ContentView.swift
//  Calculator
//
//  Created by Oğuz YÜKSEL on 8.12.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var firstBox: String = ""
    @State private var secondBox: String = ""
    @State private var result: String = ""
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Group{
            Spacer()
            Spacer()
                Spacer()
            }
            TextField("Please enter first value...", text: $firstBox)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.2))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(12)
                .font(Font.system(size: 25, weight: .medium, design: .serif))
                .padding(EdgeInsets(top: 0, leading: 120, bottom: 0, trailing: 120))
            TextField("Please enter second value...", text: $secondBox)
                .background(Color.purple)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.2))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(12)
                .font(Font.system(size: 25, weight: .medium, design: .serif))
                .padding(EdgeInsets(top: 10, leading: 120, bottom: 0, trailing: 120))
                
            
            
            Spacer()
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Spacer()
                Spacer()
                Group{
                    Button("+" ,action:  {
                        result = String(calculator { (a:Double, b:Double) -> Double in
                            return Double(a) + Double(b)
                        })
                    }).foregroundColor(.white).font(.largeTitle)
                    Spacer()
                    Button("-" ,action:  {
                        result = String(calculator { (a:Double, b:Double) -> Double in
                            return Double(a) - Double(b)
                        })
                    }).foregroundColor(.white).font(.largeTitle)
                    Spacer()
                    Button("*" ,action:  {
                        result = String(calculator { (a:Double, b:Double) -> Double in
                            return Double(a) * Double(b)
                        })
                    }).foregroundColor(.white).font(.largeTitle)
                    Spacer()
                    Button("/" ,action:  {
                        result = String(calculator { (a:Double, b:Double) -> Double in
                            return Double(a) / Double(b)
                        })
                    }).foregroundColor(.white).font(.largeTitle)
                }
                Spacer()
                Spacer()
            }
            
            )
            Spacer()
            Text(result).foregroundColor(.white).font(.largeTitle)
            Group{
            Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            Spacer()
            Spacer()
            Spacer()
                Text("Developed by OguzYuksel").foregroundColor(.white)
            Spacer()
            }
        })
        
        
        
        }
        
    }
    func calculator(operation: (Double,Double) -> Double) -> Double {
        return operation(Double(firstBox) ?? 0, Double(secondBox) ?? 0)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad (8th generation)")
        
        
    }
}
