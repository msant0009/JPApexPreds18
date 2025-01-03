//
//  ContentView.swift
//  JPApexPredators18
//
//  Created by Mark Santoro on 1/1/25.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    
    @State var searchText = ""
    
    var filteredDinos: [ApexPredator]{
        if searchText.isEmpty{
            return predators.apexPredators
        } else{
            return predators.apexPredators.filter {
                predator in
                predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            List(filteredDinos){ predator in
                NavigationLink{
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                } label: {
                HStack{
                    //dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .shadow(color: .white, radius: 1)
                    
                    VStack(alignment: .leading){
                        //dino name
                        Text(predator.name)
                            .fontWeight(.bold)
                        
                        //dino type
                        Text(predator.type.rawValue.capitalized)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.horizontal, 13)
                            .padding(.vertical, 5)
                            .background(predator.type.background)
                            .clipShape(.capsule)
                    }
                }
            }
        }
        .navigationTitle(Text("Apex Predators"))
        .searchable(text: $searchText)
        .autocorrectionDisabled()
        .animation(.default, value: searchText)
            
        }
        .preferredColorScheme(.dark)
    }
}
 
#Preview {
    ContentView()
}
