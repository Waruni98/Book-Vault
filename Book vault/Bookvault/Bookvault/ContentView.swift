

import SwiftUI
// Search Structure
struct searchConfig : Equatable {
    enum Filter{
        case all,fave
    }
    var query : String = ""
    var filter:Filter = .all
}

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        //sort the books that we entered
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books:FetchedResults<Book>
    
    @State private var isShowingView = false
    @State private var showingAddScreen = false
    @State private var searchConfig :searchConfig = .init()
    
    var body: some View{
        
        NavigationView{
            ZStack {
                Image("background1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.2)
                
                //Display Book List
                List {
                    ForEach(books) { book in
                        NavigationLink(destination: DetailView(book: book)) {
                            HStack(alignment: .center) {
                                
                                EmojiRatingView(rating: book.rating)
                                    .font(.title)
                                    .frame(width: 50)
                                    .padding(30)
                                

                                VStack(alignment: .leading, spacing: 8) {
                                    Text(book.title ?? "Unknown Title")
                                        .font(.headline)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                    
                                    Text(book.author ?? "Unknown Author")
                                        .foregroundColor(.secondary)
                                        .font(.subheadline)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                    }
                }
                
                
                .navigationTitle("Book Vault")
                //Create and Edit Button
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: {
                            isShowingView.toggle()
                        }, label: {
                            Label("Edit Book", systemImage: "pencil")
                        })
                    }
                }
            }
                .searchable(text:$searchConfig.query)
                .onChange(of: searchConfig) { newValue in
                    books.nsPredicate = Book.filter(newValue.query)
                }
            //When u hit the add or edit button ,these sheets are appears
            //ADD SCREEN
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
            //EDIT SCREEN
            .sheet(isPresented: $isShowingView) {
                if let book = books.first {
                    EditBookView(book: book)
                }
            }
        }
        
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
