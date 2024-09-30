//
//  CardFiltersView.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 27.9.24..
//

import SwiftUI

struct CardFiltersView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        VStack {
            
            Text("Card Filters")
                .font(.title)
                .fontWeight(.bold)
            
            HStack {
                
                Text("Select a monster card race")
                    .font(.caption)
                    .fontWeight(.bold)
                
                VStack {
                    Picker("Select a monster card race", selection: $viewModel.monsterCardSelectedRace) {
                        ForEach(Card.monsterCardRaces, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    
                }
                
            }
        }
    }
    
}

#Preview {
    CardFiltersView()
}
