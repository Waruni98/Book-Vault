//
//  DetailView.swift
//  Bookvault
//
//  Created by waruni on 2023-04-18.
//

import SwiftUI

struct DetailView: View {
    let book:Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        
        //Display Details about books
        ScrollView{
            ZStack(alignment : .bottomTrailing){
                Image(book.genre ?? "Kids")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "KIDS")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5,y: -5)
            }
            
            Text(book.author ?? "Unknwon Author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No Author")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknwon Book")
        
        //Display Alert Msg for delete Book
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete this? " ,isPresented: $showingDeleteAlert){
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) {}
        }message: {
            Text("Are you Sure?")
        }
        .toolbar{
            Button{
                showingDeleteAlert = true
            }label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
        
    }
    
    //Delete Function
    func deleteBook(){
        moc.delete(book)
        dismiss()
    }
}



