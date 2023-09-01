//
//  EditBookView.swift
//  Bookvault
//
//  Created by waruni on 2023-04-26.
//

import SwiftUI

struct EditBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    let book: Book
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy" , "Horror", "Kids","Mestery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of Book", text:$title)
                        .onAppear(perform: {
                            self.title = book.title ?? ""
                        })
                    TextField("Author's name", text: $author)
                        .onAppear(perform: {
                            self.author = book.author ?? ""
                        })
                    
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                    .onAppear(perform: {
                        self.genre = book.genre ?? ""
                    })
                }
                
                Section{
                    TextEditor(text: $review)
                        .onAppear(perform: {
                            self.review = book.review ?? ""
                        })
                    RatingView(rating: $rating)
                        .onAppear(perform: {
                            self.rating = Int(book.rating)
                        })
                }header: {
                    Text("Write a review")
                }
                Section{
                    Button("Save"){
                        //Update existing book in the system
                        book.title = title
                        book.author = author
                        book.rating = Int16(rating)
                        book.genre = genre
                        book.review = review
                        
                        try?moc.save()
                        dismiss()
                        
                    }
                }
            }
            .navigationTitle("Edit Book")
        }
        .onAppear(perform: {
            title = book.title ?? ""
            author = book.author ?? ""
            rating = Int(book.rating)
            genre = book.genre ?? ""
            review = book.review ?? ""
        })
        
    }
}



struct EditBookView_Previews: PreviewProvider {
    static var previews: some View {
        let book = Book()
        book.title = "Test Book"
        book.author = "Test Author"
        book.rating = 3
        book.genre = "Test Genre"
        book.review = "Test Review"
        
        return EditBookView(book: book)
    }
}
