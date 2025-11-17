import SwiftUI

struct ChickensSplashView: View {
    var body: some View {
        ZStack {
            Image("ChickensSplashBackground")
                .resizable()
                .ignoresSafeArea()
                .padding(.all, 0.0)
            
            Image("ChickensSplashLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 150)
            
            VStack {
                Spacer()
                
                Image("ChickensSplashTitle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 12.5)
                
                ZStack {
                    Image("ChickensSplashBar")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 42)
                    
                    ChickensProgressBar(progress: 1)
                        .frame(width: 265)
                }
                .padding(.top, 10.0)
            }
            .padding(.vertical, 25.0)
        }
    }
}
