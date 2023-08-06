//
//  RatingView.swift
//  TestProject1
//
//  Created by Juan Ticante Vicente on 05/08/23.
//

import SwiftUI

class Rating: ObservableObject {
    @Published var value: Int? = 3
}

struct RatingViewContainer: View {
    
    @ObservedObject var rating: Rating
    
    var body: some View {
        RatingView(rating: $rating.value)
    }
}

struct RatingView: View {
    
    @Binding var rating: Int?
    
    private func starType(index: Int) -> String {
        
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
        
    }
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }.padding(.bottom)
        VStack {
            Text("This is SWITUI")
        }
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
