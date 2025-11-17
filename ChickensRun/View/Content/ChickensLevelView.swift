import SwiftUI

struct ChickensLevelView: View {
    @ObservedObject var viewModel: ChickensViewModel
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.2623589039, green: 0.236628592, blue: 0.5711556673, alpha: 1))
                .ignoresSafeArea()
                .opacity(0.9)
            
            VStack {
                HStack {
                    Image("ChickensLevelTitle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                    
                    Spacer()
                    
                    Button {
                        withAnimation() {
                            viewModel.showLevel = false
                        }
                    } label: {
                        Image("ChickensLevelCloseButton")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 42.5)
                    }
                }
                .padding(.horizontal, 15.0)
                
                VStack {
                    ForEach(0..<5) { index in
                        HStack {
                            ForEach(0..<2) { jndex in
                                ZStack {
                                    ZStack {
                                        Button {
                                            withAnimation() {
                                                viewModel.chickenSetupGame(2 * index + jndex)
                                            }
                                        } label: {
                                            ZStack {
                                                Image("ChickensLevel\(viewModel.dateLevel[2 * index + jndex])")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 75)
                                                
                                                ZStack {
                                                    Text("LEVEL \(2 * index + jndex + 1)")
                                                        .font(.system(size: 24))
                                                        .fontWeight(.black)
                                                        .foregroundColor(Color(#colorLiteral(red: 0.2623589039, green: 0.236628592, blue: 0.5711556673, alpha: 1)))
                                                        .padding(.top, 5.0)
                                                        .padding(.trailing, 5.0)
                                                    
                                                    Text("LEVEL \(2 * index + jndex + 1)")
                                                        .font(.system(size: 24))
                                                        .fontWeight(.black)
                                                        .foregroundColor(Color(#colorLiteral(red: 0.9029586227, green: 0.7833379766, blue: 0.008847188952, alpha: 1)))
                                                }
                                                .padding(.top, -5.0)
                                            }
                                        }
                                        .opacity(viewModel.dateLevel[2 * index + jndex] != 0 ? 1 : 0)
                                    }
                                    
                                    ZStack {
                                        Image("ChickensLevel0")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 75)
                                    }
                                    .opacity(viewModel.dateLevel[2 * index + jndex] == 0 ? 1 : 0)
                                }
                            }
                        }
                    }
                }
                .padding(.top, 35.0)
                
                Spacer()
            }
            .padding(.vertical, 25.0)
        }
    }
}
