import SwiftUI

struct SuperHeroSearcher: View {
    
    @StateObject private var viewModel = HeroViewModel(
        repository: HeroRepositoryImpl(apiService: ApiService())
    )
    
    var body: some View {
        
        VStack {
            
            MyTextField(onSubmit: { query in
                viewModel.fetchHeroes(query: query)
            })
            
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .padding(.top, 10)
            } 
            else {
                
                if(viewModel.hasSearched){
                    if viewModel.list.isEmpty {
                        Text("No heroes found")
                            .padding(.top, 10)
                    }
                    else {
                        List(viewModel.list) { hero in
                            Text(hero.name)
                        }
                        .padding(.top, 10)
                    }
                }             
            }
            
//            if let results = list {
//                List(results) { hero in
//                    Text(hero.name)
//                }
//                .padding(.top, 10)
//            }
            //            else {
            //               Text("No results")
            //                   .padding(.top, 10)
            //           }
            
            Spacer() // Empuja otros elementos hacia abajo
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundApp)
    }
}

struct MyTextField: View {
       
    
    @State var text = ""
    
    //@Binding var wrapper: [Hero]?
    
    @StateObject private var viewModel = HeroViewModel(
        repository: HeroRepositoryImpl(apiService: ApiService())
    )
    
    let onSubmit: (String) -> Void

    var body: some View {
        TextField(
            "Search...",
            text: $text
        )
        .padding()
        .background(Color.white) // Fondo blanco para el TextField
        .cornerRadius(10) // Esquinas redondeadas
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        ) // Borde gris sutil
        .padding(.horizontal, 10) // Añade padding horizontal externo para separar del borde de la pantalla
        .keyboardType(.emailAddress)
        .onChange(of: text) { oldValue, newValue in
            print("Last value was: \(oldValue)")
            print("New value is: \(newValue)")
        }
        .autocorrectionDisabled()
        .onSubmit {
            onSubmit(text)
            text = ""
           // viewModel.fetchHeroes(query: "batman")
//            Task{
//                do {
//                    wrapper = try await ApiNetwork().getHerosByQuery(query: "")
//                }
//                catch {
//                    print("")
//                }
//            }
        }
    }
}



#Preview {
    SuperHeroSearcher()
}
