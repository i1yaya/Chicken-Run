import SwiftUI

struct ChickensGameView: View {
    @ObservedObject var viewModel: ChickensViewModel
    
    var body: some View {
        ZStack {
            ZStack {
                Image("ChickensGameBackground")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.all, 0.0)
                
                ZStack {
                    VStack {
                        ForEach(viewModel.gameGrid.indices, id: \.self) { rowIndex in
                            HStack {
                                ForEach(viewModel.gameGrid[rowIndex].indices, id: \.self) { colIndex in
                                    let tile = viewModel.gameGrid[rowIndex][colIndex]
                                    
                                    ZStack {
                                        ZStack {
                                            ZStack {
                                                Image("TileDirt")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 37.5)
                                                    .opacity(tile == .dirt ? 1 : 0)
                                                
                                                Image("TileWater")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 37.5)
                                                    .opacity(tile == .water ? 1 : 0)
                                                
                                                Image("TileGround")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 37.5)
                                                    .opacity(tile == .ground ? 1 : 0)
                                                
                                                Image("TileWall")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 37.5)
                                                    .opacity(tile == .wall ? 1 : 0)
                                                
                                                Image("TileWin0")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 37.5)
                                                    .opacity(tile == .win0 ? 1 : 0)
                                                
                                                Image("TileWin1")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 37.5)
                                                    .opacity(tile == .win1 ? 1 : 0)
                                            }
                                            .frame(width: 37.5, height: 37.5)
                                        }
                                        .padding(.all, -5.0)
                                        
                                        ZStack {
                                            ZStack {
                                                ZStack {
                                                    Image("TileGift")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 25)
                                                }
                                                .opacity(viewModel.giftPosition0 == (rowIndex, colIndex) ? viewModel.giftCollected[0] ? 0 : 1 : 0)
                                                
                                                ZStack {
                                                    Image("TileGift")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 25)
                                                }
                                                .opacity(viewModel.giftPosition1 == (rowIndex, colIndex) ? viewModel.giftCollected[1] ? 0 : 1 : 0)
                                            }
                                            .frame(width: 37.5, height: 37.5)
                                        }
                                        .padding(.all, -5.0)
                                    }
                                }
                            }
                        }
                    }
                    
                    VStack {
                        ForEach(viewModel.gameGrid.indices, id: \.self) { rowIndex in
                            HStack {
                                ForEach(viewModel.gameGrid[rowIndex].indices, id: \.self) { colIndex in
                                    ZStack {
                                        ZStack {
                                            if viewModel.chickenPosition0 == (rowIndex, colIndex) {
                                                ZStack {
                                                    Image("ChickenSkin0\(viewModel.selectedShop.0)")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 25)
                                                }
                                                .offset(viewModel.chickenOffset0)
                                                .zIndex(5)
                                                .scaleEffect(viewModel.chickenScale0)
                                                .opacity(viewModel.chickenPosition0 == (rowIndex, colIndex) ? 1 : 0)
                                            }
                                            
                                            if viewModel.chickenPosition1 == (rowIndex, colIndex) {
                                                ZStack {
                                                    Image("ChickenSkin1\(viewModel.selectedShop.1)")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 25)
                                                }
                                                .offset(viewModel.chickenOffset1)
                                                .zIndex(5)
                                                .scaleEffect(viewModel.chickenScale1)
                                            }
                                        }
                                        .frame(width: 37.5, height: 37.5)
                                    }
                                    .padding(.all, -5.0)
                                }
                            }
                        }
                    }
                }
                
                
                VStack {
                    HStack {
                        ZStack {
                            Text("LEVEL \(viewModel.levelGame + 1)")
                                .font(.system(size: 24))
                                .fontWeight(.black)
                                .foregroundColor(Color(#colorLiteral(red: 0.1475261591, green: 0.1349831001, blue: 0.3294994213, alpha: 1)))
                                .padding(.top, 5.0)
                                .padding(.trailing, 5.0)
                            
                            Text("LEVEL \(viewModel.levelGame + 1)")
                                .font(.system(size: 24))
                                .fontWeight(.black)
                                .foregroundColor(Color(#colorLiteral(red: 0.9029586227, green: 0.7833379766, blue: 0.008847188952, alpha: 1)))
                        }
                        
                        Spacer()
                        
                        Button {
                            withAnimation() {
                                viewModel.showPause = true
                            }
                        } label: {
                            Image("ChickensGamePauseButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 42.5)
                        }
                    }
                    .padding(.horizontal, 15.0)
                    
                    Spacer()
                    
                    HStack {
                        Image("ChickensGameGift\(viewModel.giftCollected[0] ? 1 : 0)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 55)
                        
                        Spacer()
                        
                            Image("ChickensGameGift\(viewModel.giftCollected[1] ? 1 : 0)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 55)
                    }
                    .padding(.horizontal, 15.0)
                }
                .padding(.vertical, 25.0)
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        VStack {
                            Button {
                                if !viewModel.isAnimation {
                                    withAnimation() {
                                        viewModel.chickenMove(0)
                                    }
                                }
                            } label: {
                                Image("ChickensGameUpButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 52.5)
                            }
                            
                            Button {
                                if !viewModel.isAnimation {
                                    withAnimation() {
                                        viewModel.chickenMove(1)
                                    }
                                }
                            } label: {
                                Image("ChickensGameDownButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 52.5)
                            }
                        }
                        
                        HStack {
                            Button {
                                if !viewModel.isAnimation {
                                    withAnimation() {
                                        viewModel.chickenMove(2)
                                    }
                                }
                            } label: {
                                Image("ChickensGameLeftButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 52.5)
                            }
                            
                            Button {
                                if !viewModel.isAnimation {
                                    withAnimation() {
                                        viewModel.chickenMove(3)
                                    }
                                }
                            } label: {
                                Image("ChickensGameRightButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 52.5)
                            }
                        }
                    }
                }
                .padding(.vertical, 15.0)
            }
            
            ZStack {
                Color(#colorLiteral(red: 0.2623589039, green: 0.236628592, blue: 0.5711556673, alpha: 1))
                    .ignoresSafeArea()
                    .opacity(0.9)
                
                VStack {
                    ZStack {
                        Image("ChickensGamePauseFrame")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 220)
                        
                        VStack {
                            Spacer()
                            
                            HStack {
                                Button {
                                    withAnimation() {
                                        viewModel.chickenSetupGame(viewModel.levelGame)
                                    }
                                } label: {
                                    Image("ChickensGamePauseRestartButton")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 125)
                                }
                                
                                Button {
                                    withAnimation() {
                                        viewModel.showGame = false
                                    }
                                } label: {
                                    Image("ChickensGamePauseMenuButton")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 125)
                                }
                            }
                        }
                        .frame(height: 200)
                    }
                    
                    Text("TAP TO CONTINUE")
                        .font(.system(size: 14))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.top, 15.0)
                        .opacity(0.5)
                }
            }
            .onTapGesture {
                withAnimation() {
                    viewModel.showPause = false
                }
            }
            .opacity(viewModel.showPause ? 1 : 0)
            
            ZStack {
                Color(#colorLiteral(red: 0.2623589039, green: 0.236628592, blue: 0.5711556673, alpha: 1))
                    .ignoresSafeArea()
                    .opacity(0.9)
                
                Image("ChickensGameLose0")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
            }
            .onTapGesture {
                withAnimation() {
                    viewModel.chickenSetupGame(viewModel.levelGame)
                }
            }
            .opacity(viewModel.showLose0 ? 1 : 0)
            
            ZStack {
                Color(#colorLiteral(red: 0.2623589039, green: 0.236628592, blue: 0.5711556673, alpha: 1))
                    .ignoresSafeArea()
                    .opacity(0.9)
                
                Image("ChickensGameLose1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
            }
            .onTapGesture {
                withAnimation() {
                    viewModel.chickenSetupGame(viewModel.levelGame)
                }
            }
            .opacity(viewModel.showLose1 ? viewModel.showLose0 ? 0 : 1 : 0)
            
            ZStack {
                Color(#colorLiteral(red: 0.2623589039, green: 0.236628592, blue: 0.5711556673, alpha: 1))
                    .ignoresSafeArea()
                    .opacity(0.9)
                
                Image("ChickensGameWinGround")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 420)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Button {
                            withAnimation() {
                                viewModel.chickenSetupGame(viewModel.levelGame)
                            }
                        } label: {
                            Image("ChickensGameWinRestartButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 120)
                        }
                        
                        if viewModel.levelGame < 9 {
                            Button {
                                withAnimation() {
                                    viewModel.levelGame += 1
                                    viewModel.chickenSetupGame(viewModel.levelGame)
                                }
                            } label: {
                                Image("ChickensGameWinNextButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 125)
                            }
                        }
                        
                        Button {
                            withAnimation() {
                                viewModel.showGame = false
                            }
                        } label: {
                            Image("ChickensGameWinMenuButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 120)
                        }
                    }
                }
                .frame(height: 400)
            }
            .opacity(viewModel.showWin ? 1 : 0)
            
            ZStack {
                Image("ChickensGameWinSkin\(viewModel.levelGame)")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.all, 0.0)
            }
            .onTapGesture {
                withAnimation() {
                    viewModel.showSkinWin = false
                }
            }
            .opacity(viewModel.showSkinWin ? 1 : 0)
        }
    }
}
