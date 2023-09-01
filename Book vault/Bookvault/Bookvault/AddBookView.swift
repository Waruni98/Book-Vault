//
//  AddBookView.swift
//  Bookvault
//
//  Created by waruni on 2023-04-17.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    @State private var showingAlert = false
    
    let genres = ["Fantasy" , "Horror", "Kids","Mestery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of Book", text:$title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical)
                    TextField("Author's name", text: $author)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical)
                    
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    TextEditor(text: $review)
                        .frame(height: 100)
                    RatingView(rating: $rating)
                }header: {
                    Text("Write a review")
                }
                //validation for add book page
                
                Section{
                    Button("Save"){
                        if validateFields() {
                            showingAlert.toggle()
                        }
                    }
                    //
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Are you sure you want to save this book?"),
                            message: Text("All fields are required"),
                            primaryButton: .destructive(Text("Save")) {
                                saveBook()
                            },
                            secondaryButton: .cancel())
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
    private func saveBook() {
        //Add new book to the sytem
        let newBook = Book(context: moc)
        newBook.id=UUID()
        newBook.title=title
        newBook.author=author
        newBook.rating=Int16(rating)
        newBook.genre=genre
        newBook.review=review
        
        try?moc.save()
        dismiss()
    }
    
    //add book validations
    private func validateFields() -> Bool {
        if title.isEmpty || author.isEmpty || genre.isEmpty || review.isEmpty {
            return false
        }
        return true
    }
}

extension Book{
    //Search function
    
    static func filter(_ query: String) -> NSPredicate {
        query.isEmpty ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", query)
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
