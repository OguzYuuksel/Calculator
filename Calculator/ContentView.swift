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
                    .frame(height: 40)
                    .background(Color.white)
                    .cornerRadius(18)
                    .font(Font.system(size: 25, weight: .medium, design: .serif))
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 0, trailing: 40))
                TextField("Please enter second value...", text: $secondBox)
                    .frame(height: 40)
                    .background(Color.white)
                    .cornerRadius(18)
                    .font(Font.system(size: 25, weight: .medium, design: .serif))
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 0, trailing: 40))
                
                
                
                
                
                Spacer()
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Spacer()
                    Spacer()
                    Group{
                        Button("+" ,action:  {
                            result = calculator { (a:String, b:String) -> String in
                                return String (Double(a)! + Double(b)!)
                            }
                        }
                        )
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        Spacer()
                        Button("-" ,action:  {
                            result = calculator { (a:String, b:String) -> String in
                                return String(Double(a)! - Double(b)!)
                            }
                        }).foregroundColor(.white).font(.largeTitle)
                        Spacer()
                        Button("*" ,action:  {
                            result = calculator { (a:String, b:String) -> String in
                                return String(Double(a)! * Double(b)!)
                            }
                        }).foregroundColor(.white).font(.largeTitle)
                        Spacer()
                        Button("/" ,action:  {
                            result = calculator { (a:String, b:String) -> String in
                                return String(Double(a)! / Double(b)!)
                            }
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
    
    func loadNumber(first : String, second: String) -> Bool {
        guard (Double(first) != nil && Double(second) != nil) else {
            return false
        }
        return true
    }
    
    func calculator(operation: (String,String) -> String) -> String {
        if loadNumber(first: firstBox, second: secondBox) {
            return operation(firstBox, secondBox)
        } else
        {
            return "Please enter a valid number"
        }    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
        
        
    }
}
