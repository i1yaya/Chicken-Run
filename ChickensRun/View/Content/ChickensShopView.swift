import SwiftUI

struct ChickensShopView: View {
    @ObservedObject var viewModel: ChickensViewModel
    
    let chickenNames: [[String]] = [
        ["Default", "Cowgirl", "Miss Bow", "Parisian", "Gentlemonocle", "Sunny Shades"],
        ["Default", "Pilot", "Chef", "Floaty Feathers", "Sky Captain", "Shadow Cool"]
    ]
    
    var body: some View {
        ZStack {
            Image("ChickensShopBackground")
                .resizable()
                .ignoresSafeArea()
                .padding(.all, 0.0)
            
            Color.black
                .ignoresSafeArea()
                .opacity(0.35)
            
            VStack {
                HStack {
                    ZStack {
                        Image("ChickensShopPageButton01")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .opacity(viewModel.pageShop == 1 ? 0 : 1)
                        
                        Button {
                            withAnimation() {
                                viewModel.pageShop = 0
                            }
                        } label: {
                            Image("ChickensShopPageButton00")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 120)
                        }
                        .opacity(viewModel.pageShop == 1 ? 1 : 0)
                    }
                    
                    ZStack {
                        Image("ChickensShopPageButton11")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .opacity(viewModel.pageShop == 0 ? 0 : 1)
                        
                        Button {
                            withAnimation() {
                                viewModel.pageShop = 1
                            }
                        } label: {
                            Image("ChickensShopPageButton10")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 120)
                        }
                        .opacity(viewModel.pageShop == 0 ? 1 : 0)
                    }
                }
                
                Spacer()
                
                HStack {
                    Button {
                        if viewModel.pageShop == 0 {
                            withAnimation() {
                                if viewModel.itemShop.0 > 0 {
                                    viewModel.itemShop.0 -= 1
                                } else {
                                    viewModel.itemShop.0 = 5
                                }
                            }
                        } else {
                            withAnimation() {
                                if viewModel.itemShop.1 > 0 {
                                    viewModel.itemShop.1 -= 1
                                } else {
                                    viewModel.itemShop.1 = 5
                                }
                            }
                        }
                    } label: {
                        Image("ChickensShopLeftButton")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                    }
                    
                    Spacer()
                    
                    VStack {
                        ZStack {
                            ZStack {
                                Image("ChickenSkin\(viewModel.pageShop)\(viewModel.pageShop == 0 ? viewModel.itemShop.0 : viewModel.itemShop.1)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200)
                                    .blur(radius: viewModel.dateShop[viewModel.pageShop][viewModel.pageShop == 0 ? viewModel.itemShop.0 : viewModel.itemShop.1] == 1 ? 0 : 10)
                            }
                            
                            Image("ChickenLock")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 125)
                                .opacity(viewModel.dateShop[viewModel.pageShop][viewModel.pageShop == 0 ? viewModel.itemShop.0 : viewModel.itemShop.1] == 1 ? 0 : 1)
                        }
                        .frame(height: 225)
                        
                        ZStack {
                            Image("ChickensShopNameField")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 60)
                            
                            Text("\(chickenNames[viewModel.pageShop][viewModel.pageShop == 0 ? viewModel.itemShop.0 : viewModel.itemShop.1].uppercased())")
                                .font(.system(size: 18))
                                .fontWeight(.black)
                                .foregroundColor(Color(#colorLiteral(red: 0.2623589039, green: 0.236628592, blue: 0.5711556673, alpha: 1)))
                                .padding(.top, 5.0)
                                .padding(.trailing, 5.0)
                            
                            Text("\(chickenNames[viewModel.pageShop][viewModel.pageShop == 0 ? viewModel.itemShop.0 : viewModel.itemShop.1].uppercased())")
                                .font(.system(size: 18))
                                .fontWeight(.black)
                                .foregroundColor(Color(#colorLiteral(red: 0.9029586227, green: 0.7833379766, blue: 0.008847188952, alpha: 1)))
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        if viewModel.pageShop == 0 {
                            withAnimation() {
                                if viewModel.itemShop.0 < 5 {
                                    viewModel.itemShop.0 += 1
                                } else {
                                    viewModel.itemShop.0 = 0
                                }
                            }
                        } else {
                            withAnimation() {
                                if viewModel.itemShop.1 < 5 {
                                    viewModel.itemShop.1 += 1
                                } else {
                                    viewModel.itemShop.1 = 0
                                }
                            }
                        }
                    } label: {
                        Image("ChickensShopRightButton")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                    }
                }
                .padding(.horizontal, 15.0)
                
                Spacer()
                
                ZStack {
                    Button {
                        withAnimation() {
                            viewModel.showShop = false
                            viewModel.selectedShop = viewModel.itemShop
                            
                            viewModel.chickenSaveUserDefaultsData()
                        }
                    } label: {
                        Image("ChickensShopSaveButton")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 57.5)
                    }
                    .opacity(viewModel.dateShop[0][viewModel.itemShop.0] == 1 && viewModel.dateShop[1][viewModel.itemShop.1] == 1 ? 1 : 0)
                    
                    Image("ChickensShopSaveButton")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 57.5)
                        .opacity(viewModel.dateShop[0][viewModel.itemShop.0] == 1 && viewModel.dateShop[1][viewModel.itemShop.1] == 1 ? 0 : 0.5)
                }
            }
            .padding(.vertical, 25.0)
        }
    }
}
