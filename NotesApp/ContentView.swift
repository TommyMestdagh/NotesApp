import SwiftUI

struct NoteItem: Identifiable {
    let id = UUID()
    var name: String
}

class Notes: ObservableObject {
    @Published var items: [NoteItem] = []
    
    func removeItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func addItem(name: String) {
        items.append(NoteItem(name: name))
    }
}

struct ContentView: View {
    
    @StateObject var notes = Notes()
    @State private var item: String = ""
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("Notes").padding().font(.title)
                Spacer()
            }
            TextField("Voeg note toe", text: $item).padding()
                .padding()
            Button(action: {
                if !item.isEmpty {
                    notes.addItem(name: item)
                    item = ""
                }
            }) {
                Text("Add Item")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(11)
            }
            
            List {
                ForEach($notes.items) { $noteItem in  // Using Binding here
                    NavigationLink(noteItem.name, destination: Pag2View(task: $noteItem))  // Passing Binding to Pag2View
                }
                .onDelete(perform: notes.removeItems)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct Pag2View: View {
    
    @Binding var task: NoteItem  // Using Binding to allow editing
    
    var body: some View {
        VStack {
            TextField("Edit task name", text: $task.name)  // Editable field for task name
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("You are editing: \(task.name)")
                .padding()
                .font(.title)
        }
        .padding()
    }
}


