//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Rushabh on 12/06/24.
//

import SwiftUI
struct Card: Identifiable {
    let id = UUID()
    let index: Int
    var name: String
    var detail: String
    var time: String
}

struct ContentView: View {
    @State private var name: String = "Pro Men"
    @State private var index = 0

    var arrMenu = ["Start","5K","10K","15K","20K","FINISH"]
    var arrPage = ["<","1","2","3",">"]

    var arrCard = [Card(index: 1, name: "Tamirat Tola", detail: "M32 | ETH | BIB 4", time: "Time: 02:04:58"),
                   Card(index: 2, name: "Albert Korir", detail: "M32 | KEN | BIB 6", time: "Time: 02:06:57"),
                   Card(index: 3, name: "Shura Kitata", detail: "M32 | ETH | BIB 3", time: "Time: 02:07:11"),
                   Card(index: 4, name: "Abdi Nageeye", detail: "M32 | NED | BIB 2", time: "Time: 02:10:21")]

    var body: some View {
       
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        TextField("", text: $name)
                            .font(Font.system(size: 16, weight: .semibold))
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 10)

                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.gray)
                            .padding([.horizontal], 10)
                            .font(Font.system(size: 20, weight: .bold))
                    }
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                    .padding([.horizontal], 15)
                    .padding([.bottom], 5)

                    scrollView
                    unofficial
                    
                    ScrollView {
                        ForEach(self.arrCard) { card in
                            CardView(card: card)
                        }
                    }
                    Spacer(minLength: 10)
                    
                    HStack{
                        ForEach(Array(self.arrPage.enumerated()), id: \.element) { index,element in
                            Button(action: {
                                print("tapped!")
                            }, label: {
                                if index == 0    {
                                    Image(systemName: "chevron.backward")
                                        .foregroundColor(Color.gray)
                                        .padding([.horizontal], 10)
                                        .font(Font.system(size: 20, weight: .bold))
                                } 
                                else if index == self.arrPage.count - 1    {
                                    Image(systemName: "chevron.forward")
                                        .foregroundColor(Color.gray)
                                        .padding([.horizontal], 10)
                                        .font(Font.system(size: 20, weight: .bold))
                                }
                                else {
                                    Text(element)
                                        .foregroundColor(.black)
                                        .frame(width: 30, height: 40)
                                        .cornerRadius(15)
                                }
                               
                            })
                        }
                    }.frame(width: 100, height: 50, alignment: .bottom)
                }

            }
            .navigationBarTitle(Text("Leaderboard"), displayMode: .inline)
            

        }
            }
   
    var scrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ZStack {
                HStack {
                    ForEach(Array(self.arrMenu.enumerated()), id: \.element) { index,element in
                        ZStack {
                            if index == self.index {
                                RoundedRectangle(cornerRadius: 35)
                                    .foregroundColor(.orange)
                            }
                            Text(element.description)
                                .font(Font.system(size: 15, weight: .semibold))
                                .foregroundColor(index == self.index ? .white : .black)
                                .onTapGesture { clickOption(index: index) }
                        }
                    }
                    .frame(width: 70, height: 70)                        .frame(minHeight: 0, maxHeight: .greatestFiniteMagnitude)
                }
            }
        }
        .frame(height: 70)
        .transition(.move(edge: .bottom))
        .padding([.horizontal], 15)
        
    }
    
    var unofficial:some View {
        HStack {
            Image(systemName: "info.circle")
                .foregroundColor(Color.black)
                .font(Font.system(size: 20, weight: .bold))
            Text("This results are unofficial")
                .font(Font.system(size: 17, weight: .medium))
                .foregroundColor(.black)
        }
        .frame( maxWidth: .infinity,alignment: .topLeading)
        .padding([.horizontal,.top], 25)

    }
   
    struct CardView: View {
        let card: Card

        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 10).stroke(Color.gray)
                    .fill(.white)
                    .padding()
                    .overlay {
                        
                        HStack {
                            HStack {
                                VStack(alignment: .leading, content: {
                                    Text("\(card.index)")
                                        .font(Font.system(size: 25, weight: .bold))
                                        .foregroundColor(.black)
                                })
                            }
                            .frame(width: 20.0)
                            HStack {
                                VStack(alignment: .leading,spacing: 10){
                                    Text(card.name)
                                        .font(Font.system(size: 21, weight: .medium))
                                        .foregroundColor(.black)
                                    Text(card.detail)
                                        .font(Font.system(size: 17, weight: .regular))
                                        .foregroundColor(.black)
                                    
                                    Text(card.time)
                                        .font(Font.system(size: 19, weight: .medium))
                                        .foregroundColor(.black)
                                }
                                .frame(width: 250.0)
                            }
                            HStack {
                                VStack(alignment: .leading, content: {
                                    Image(systemName: "chevron.forward")
                                        .foregroundColor(Color.black)
                                        .font(Font.system(size: 20, weight: .bold))
                                })
                            }
                            .frame(width: 20.0)
                        }
                        
                        .frame(width:.infinity,alignment: .leading)
                    }


            }
            .frame(width: .infinity, height: 180)
        }
    }
    func clickOption(index: Int) {
        print(index)
        self.index =  index
    }
}





#Preview {
    ContentView()
}
