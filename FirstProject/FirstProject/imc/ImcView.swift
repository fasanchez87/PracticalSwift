import SwiftUI

struct ImcView: View {

    @State var gender: Int = 0
    
    @State var height: Double = 177
    
    @State var age: Int = 10
    
    @State var weight: Int = 68
    
    var body: some View {
   
        VStack {
            HStack {
                ToogleButton(
                    title: "Man",
                    image: "heart.fill",
                    genderId: 0,
                    selectedGender: $gender
                )
                
                ToogleButton(
                    title: "Woman",
                    image: "star.fill",
                    genderId: 1,
                    selectedGender: $gender
                )
            }
            
            HeightCalculator(height: $height)
            
            HStack {
                
                AgeCalculator(age: $age, valueDefault: 10)
                
                WeightCalculator(weight: $weight, valueDefault: 30)
      
            }
            
            CalculateButton(weight: weight, height: height)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.backgroundApp)
        //.navigationBarBackButtonHidden()
        //.navigationTitle("IMC Calculator")
        .toolbar {
            ToolbarItem(placement: .principal){
                Text("IMC Calculator")
                    .foregroundColor(.colorTitleAppBar)
                    .font(.system(
                        size: 18
                    )
                        .bold()
                    )
            }
        }
    }
}

struct MyText : View {
    let text: String
    var body: some View {
        Text(text)
            .font(.title)
            .bold()
            .foregroundColor(.white)
    }
}

struct MyTextSmall : View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(
            size: 16,
            weight: .light
            )).foregroundColor(.white)
    }
}

struct ToogleButton : View {
    
    let title: String
    let image: String
    let genderId: Int
    
    @Binding var selectedGender: Int
    
    var body: some View {
        
        let color = if(genderId == selectedGender){
            Color.backgroundComponentSelected
        }
        else {
            Color.backgroundComponent
        }
        
        Button(action: {
            selectedGender = genderId
        }){
            VStack {
                Image(
                    systemName: image
                )
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 100)
                MyText(text: title)
            }
            .frame(maxWidth: .infinity , maxHeight: .infinity)
            .background(color)
            .cornerRadius(15)
        }
    }
}

struct HeightCalculator : View {
    
    @Binding var height: Double
    
    var body: some View {
     
        VStack {
            
            MyTextSmall(text: "Altura")
            
            MyText(text: "\(Int(height)) CM")
            
            Slider(
                value: $height,
                in: 100...250,
                step: 1
            )
            .padding(.horizontal, 50)// Padding solo a la derecha e izquierda
            .accentColor(.backgroundComponentSelected) // Cambia el color de la línea del slider
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
        .cornerRadius(15)
    }
}

struct AgeCalculator : View {
    
    @Binding var age: Int
   
    let valueDefault: Int
    
    var body: some View {
        
        VStack {
            
            MyTextSmall(text: "Age")
            
            MyText(text: "\(age)")
            
            HStack {
                CircularButton(action: {
                    if(age > valueDefault){
                        age -= 1
                    }
                }, imageName: "minus")
              
                CircularButton(action: {
                    age += 1
                }, imageName: "plus")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
        .cornerRadius(15)

    }
    }

struct WeightCalculator : View {
   
    @Binding var weight: Int
    
    let valueDefault: Int
    
        var body: some View {
            
            VStack {
                
                MyTextSmall(text: "Weight")
                
                MyText(text: "\(weight)")
                
                HStack {
                    CircularButton(action: {
                        if(weight > valueDefault){
                            weight -= 1
                        }
                    }, imageName: "minus")
                  
                    CircularButton(action: {
                        weight += 1
                    }, imageName: "plus")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
            .cornerRadius(15)
        }
    }


struct CircularButton: View {
    
    var action: () -> Void
    
    var imageName: String

    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .padding(20)
                .background(.backgroundComponentSelected)
                .clipShape(Circle())
                .shadow(radius: 10)
        }
    }
}

struct CalculateButton: View {
    
    let weight: Int
    let height: Double
    
    var body: some View {
        NavigationLink(destination: { 
            ImcResult(weight: weight, heigth: height)
        }) {
            Text("Calculate")
                .bold()
                .foregroundColor(.backgroundComponentSelected)
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Ajusta el tamaño para que ocupe todo el espacio del botón
                .padding(.vertical, 10) // Padding vertical
                .background(Color.backgroundComponent) // Fondo del botón
                .cornerRadius(8) // Opcional: Añadir esquinas redondeadas
                .multilineTextAlignment(.center) // Centra el texto horizontalmente
        }
        .frame(height: 50) // Ajusta la altura del botón
        .padding(.horizontal, 50) // Padding vertical
        .padding(.vertical, 20) // Padding vertical
    }
}

#Preview {
    ImcView()
}
