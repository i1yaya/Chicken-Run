import SwiftUI

struct ChickensWelcomeView: View {
    @ObservedObject var viewModel: ChickensViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            Image("ChickensWelcomeBackground\(viewModel.pageWelcome)")
                .resizable()
                .ignoresSafeArea()
                .padding(.all, 0.0)
            
            VStack {
                Spacer()
                
                Image("ChickensWelcomeFrame\(viewModel.pageWelcome)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 140)
                
                Button {
                    if viewModel.pageWelcome < 2 {
                        withAnimation() {
                            viewModel.pageWelcome += 1
                        }
                    } else {
                        withAnimation() {
                            viewModel.dateWelcome = 2
                            viewModel.chickenSaveUserDefaultsData()
                            
                            viewModel.showWelcome = false
                        }
                    }
                } label: {
                    Image("ChickensWelcomeContinueButton")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 55)
                }
                .padding(.top, -10.0)
            }
            .padding(.vertical, 25.0)
        }
    }
}
