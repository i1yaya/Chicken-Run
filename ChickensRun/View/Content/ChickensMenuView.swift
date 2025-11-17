import SwiftUI

struct ChickensMenuView: View {
    @ObservedObject var viewModel: ChickensViewModel
    
    var body: some View {
        ZStack {
            Image("ChickensMenuBackground")
                .resizable()
                .ignoresSafeArea()
                .padding(.all, 0.0)
            
            VStack {
                Spacer()
                
                HStack {
                    Button {
                        withAnimation() {
                            viewModel.showLevel = true
                        }
                    } label: {
                        Image("ChickensMenuLevelButton")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 125)
                    }
                    
                    Button {
                        withAnimation() {
                            viewModel.chickenSetupGame(viewModel.currentLevel)
                        }
                    } label: {
                        Image("ChickensMenuPlayButton")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 190)
                    }
                    
                    Button {
                        withAnimation() {
                            viewModel.chickenSetupShop()
                        }
                    } label: {
                        Image("ChickensMenuShopButton")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 125)
                    }
                }
            }
            .padding(.vertical, 25.0)
        }
    }
}
