import SwiftUI

struct ChickensWindowView: View {
    @ObservedObject var viewModel = ChickensViewModel()
    
    var body: some View {
        ZStack {
            ChickensMenuView(viewModel: self.viewModel)
            
            ChickensLevelView(viewModel: self.viewModel)
                .opacity(viewModel.showLevel ? 1 : 0)
            
            ChickensShopView(viewModel: self.viewModel)
                .opacity(viewModel.showShop ? 1 : 0)
            
            ChickensGameView(viewModel: self.viewModel)
                .opacity(viewModel.showGame ? 1 : 0)
            
            ChickensWelcomeView(viewModel: self.viewModel)
                .opacity(viewModel.showWelcome ? 1 : 0)
        }
        .onAppear() {
            viewModel.chickenLoadUserDefaultsData()
            
            for index in 0...viewModel.dateLevel.count - 1 {
                if viewModel.dateLevel[index] == 1 {
                    viewModel.currentLevel = index
                    break
                }
            }
            
            if viewModel.dateWelcome != 2 {
                viewModel.showWelcome = true
            } else {
                viewModel.showWelcome = false
            }
        }
    }
}
