import SwiftUI

class ChickensViewModel: ObservableObject {
    // MARK: - Welcome
    @Published var showWelcome: Bool = false
    @Published var pageWelcome: Int = 0
    @Published var dateWelcome: Int = 0
    
    // MARK: - Menu
    @Published var currentLevel: Int = 0
    
    // MARK: - Level
    @Published var showLevel: Bool = false
    @Published var dateLevel: [Int] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    // MARK: - Shop
    @Published var showShop: Bool = false
    @Published var dateShop: [[Int]] = [
        [1, 0, 0, 0, 0, 0],
        [1, 0, 0, 0, 0, 0]
    ]
    @Published var selectedShop: (Int, Int) = (0, 0)
    @Published var pageShop: Int = 0
    @Published var itemShop: (Int, Int) = (0, 0)
    
    // MARK: - Game
    @Published var showGame: Bool = false
    @Published var showPause: Bool = false
    @Published var showLose0: Bool = false
    @Published var showLose1: Bool = false
    @Published var showSkinWin: Bool = false
    @Published var isAnimation: Bool = false
    @Published var showWin: Bool = false
    @Published var giftCollected: [Bool] = [false, false]
    @Published var levelGame: Int = 0
    @Published var chickenOffset0: CGSize = .zero
    @Published var chickenOffset1: CGSize = .zero
    @Published var chickenScale0: Double = 1
    @Published var chickenScale1: Double = 1
    @Published var chickenPosition0: (Int, Int) = (0, 0)
    @Published var chickenPosition1: (Int, Int) = (0, 0)
    @Published var giftPosition0: (Int, Int) = (0, 0)
    @Published var giftPosition1: (Int, Int) = (0, 0)
    @Published var gameGrid: [[ChickensTile]] = [
        [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
        [.wall, .wall, .wall, .wall, .water, .water, .wall, .wall, .wall, .wall],
        [.win0, .win0, .ground, .ground, .water, .water, .win1, .win1, .ground, .ground],
        [.win0, .win0, .ground, .ground, .water, .water, .win1, .win1, .ground, .ground],
        [.water, .water, .ground, .ground, .water, .water, .water, .water, .ground, .ground],
        [.water, .water, .ground, .ground, .water, .water, .water, .water, .ground, .ground],
        [.water, .water, .ground, .ground, .water, .water, .water, .water, .ground, .ground],
        [.water, .ground, .ground, .ground, .water, .water, .water, .ground, .ground, .ground],
        [.water, .ground, .ground, .ground, .water, .water, .water, .ground, .ground, .ground],
        [.ground, .ground, .ground, .ground, .water, .water, .ground, .ground, .ground, .ground],
        [.wall, .wall, .wall, .wall, .water, .water, .wall, .wall, .wall, .wall],
        [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water]
    ]
    
    public func chickenSetupGame(_ level: Int) {
        levelGame = level
        
        showPause = false
        isAnimation = false
        showLose0 = false
        showLose1 = false
        showSkinWin = false
        showWin = false
        giftCollected = [false, false]
        chickenOffset0 = .zero
        chickenOffset1 = .zero
        chickenScale0 = 1
        chickenScale1 = 1
        
        switch levelGame {
        case 0:
            chickenPosition0 = (9, 0)
            chickenPosition1 = (9, 6)
            
            giftPosition0 = (7, 3)
            giftPosition1 = (7, 9)
            
            gameGrid = [
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.wall, .wall, .wall, .wall, .water, .water, .wall, .wall, .wall, .wall],
                [.win0, .win0, .ground, .ground, .water, .water, .win1, .win1, .ground, .ground],
                [.win0, .win0, .ground, .ground, .water, .water, .win1, .win1, .ground, .ground],
                [.water, .water, .ground, .ground, .water, .water, .water, .water, .ground, .ground],
                [.water, .water, .ground, .ground, .water, .water, .water, .water, .ground, .ground],
                [.water, .water, .ground, .ground, .water, .water, .water, .water, .ground, .ground],
                [.water, .ground, .ground, .ground, .water, .water, .water, .ground, .ground, .ground],
                [.water, .ground, .ground, .ground, .water, .water, .water, .ground, .ground, .ground],
                [.ground, .ground, .ground, .ground, .water, .water, .ground, .ground, .ground, .ground],
                [.wall, .wall, .wall, .wall, .water, .water, .wall, .wall, .wall, .wall],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water]
            ]
        case 1:
            chickenPosition0 = (9, 2)
            chickenPosition1 = (9, 7)
            
            giftPosition0 = (7, 0)
            giftPosition1 = (7, 7)
            
            gameGrid = [
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.win0, .win0, .ground, .water, .water, .water, .water, .ground, .win1, .win1],
                [.win0, .win0, .ground, .water, .water, .water, .water, .ground, .win1, .win1],
                [.ground, .ground, .ground, .water, .water, .water, .water, .ground, .ground, .ground],
                [.ground, .ground, .water, .water, .ground, .ground, .water, .water, .ground, .ground],
                [.ground, .ground, .water, .ground, .ground, .ground, .ground, .water, .ground, .ground],
                [.ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground],
                [.ground, .ground, .ground, .wall, .wall, .wall, .wall, .ground, .ground, .ground],
                [.ground, .ground, .ground, .wall, .water, .water, .wall, .ground, .ground, .ground],
                [.ground, .ground, .ground, .wall, .water, .water, .wall, .ground, .ground, .ground],
                [.ground, .ground, .ground, .wall, .wall, .wall, .wall, .ground, .ground, .ground],
                [.ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water]
            ]
        case 2:
            chickenPosition0 = (8, 3)
            chickenPosition1 = (10, 6)
            
            giftPosition0 = (1, 7)
            giftPosition1 = (3, 7)
            
            gameGrid = [
                [.empty, .empty, .water, .water, .water, .water, .water, .water, .water, .water],
                [.empty, .empty, .water, .ground, .ground, .ground, .ground, .ground, .win0, .win0],
                [.empty, .empty, .water, .ground, .ground, .ground, .ground, .ground, .wall, .wall],
                [.empty, .empty, .water, .ground, .ground, .ground, .ground, .ground, .win1, .win1],
                [.water, .water, .water, .water, .water, .ground, .water, .water, .water, .water],
                [.water, .water, .water, .water, .water, .ground, .water, .water, .water, .water],
                [.water, .water, .water, .water, .water, .ground, .water, .water, .water, .water],
                [.wall, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .water, .water],
                [.wall, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .water, .water],
                [.wall, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .water, .water],
                [.wall, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .water, .water],
                [.wall, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .water, .water],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water]
            ]
        case 3:
            chickenPosition0 = (9, 3)
            chickenPosition1 = (9, 0)
            
            giftPosition0 = (5, 0)
            giftPosition1 = (8, 8)
            
            gameGrid = [
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.ground, .ground, .ground, .ground, .ground, .ground, .ground, .water, .win0, .win0],
                [.ground, .ground, .ground, .ground, .ground, .ground, .ground, .water, .win0, .win0],
                [.ground, .ground, .water, .wall, .ground, .wall, .wall, .water, .ground, .ground],
                [.ground, .ground, .water, .ground, .win1, .win1, .ground, .water, .ground, .ground],
                [.ground, .ground, .water, .wall, .win1, .win1, .wall, .water, .ground, .ground],
                [.ground, .ground, .water, .water, .water, .water, .water, .ground, .ground, .ground],
                [.ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .wall, .wall],
                [.ground, .wall, .wall, .ground, .ground, .ground, .ground, .ground, .ground, .wall],
                [.ground, .ground, .ground, .ground, .water, .water, .wall, .ground, .ground, .ground],
                [.ground, .ground, .ground, .ground, .water, .water, .wall, .wall, .wall, .ground],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water]
            ]
        case 4:
            chickenPosition0 = (2, 7)
            chickenPosition1 = (2, 1)
            
            giftPosition0 = (4, 1)
            giftPosition1 = (4, 7)
            
            gameGrid = [
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.ground, .ground, .water, .water, .water, .water, .ground, .ground, .ground, .ground],
                [.ground, .ground, .water, .water, .water, .water, .ground, .ground, .ground, .ground],
                [.ground, .ground, .ground, .ground, .water, .water, .ground, .ground, .water, .water],
                [.ground, .ground, .ground, .ground, .water, .water, .ground, .ground, .water, .water],
                [.ground, .ground, .ground, .ground, .water, .water, .ground, .ground, .ground, .ground],
                [.water, .water, .ground, .ground, .water, .water, .ground, .ground, .ground, .ground],
                [.water, .water, .ground, .ground, .water, .water, .water, .water, .water, .ground],
                [.water, .water, .ground, .ground, .water, .water, .water, .water, .water, .ground],
                [.water, .water, .ground, .ground, .water, .water, .water, .water, .water, .ground],
                [.water, .water, .ground, .ground, .water, .water, .water, .water, .water, .ground],
                [.ground, .ground, .ground, .ground, .water, .water, .ground, .ground, .ground, .ground],
                [.ground, .win1, .win1, .ground, .water, .water, .ground, .win0, .win0, .ground],
                [.ground, .win1, .win1, .ground, .water, .water, .ground, .win0, .win0, .ground],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water]
            ]
        case 5:
            chickenPosition0 = (4, 5)
            chickenPosition1 = (10, 4)
            
            giftPosition0 = (3, 5)
            giftPosition1 = (8, 6)
            
            gameGrid = [
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.water, .water, .wall, .wall, .win1, .win1, .wall, .wall, .water, .water],
                [.water, .water, .wall, .ground, .win1, .win1, .ground, .wall, .water, .water],
                [.water, .water, .ground, .ground, .ground, .ground, .ground, .ground, .water, .water],
                [.water, .wall, .wall, .ground, .ground, .ground, .ground, .wall, .wall, .water],
                [.water, .wall, .ground, .ground, .ground, .wall, .ground, .ground, .wall, .water],
                [.water, .wall, .ground, .ground, .ground, .ground, .ground, .ground, .wall, .water],
                [.water, .wall, .ground, .ground, .ground, .ground, .ground, .ground, .wall, .water],
                [.water, .wall, .ground, .ground, .ground, .ground, .ground, .ground, .wall, .water],
                [.water, .wall, .wall, .ground, .wall, .ground, .ground, .wall, .wall, .water],
                [.water, .water, .ground, .ground, .ground, .ground, .ground, .ground, .water, .water],
                [.water, .water, .wall, .ground, .win0, .win0, .ground, .wall, .water, .water],
                [.water, .water, .wall, .wall, .win0, .win0, .wall, .wall, .water, .water],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
            ]
        case 6:
            chickenPosition0 = (3, 6)
            chickenPosition1 = (2, 6)
            
            giftPosition0 = (3, 5)
            giftPosition1 = (3, 0)
            
            gameGrid = [
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .water, .water],
                [.ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .water, .water],
                [.ground, .ground, .water, .water, .wall, .ground, .ground, .wall, .water, .water],
                [.ground, .ground, .water, .water, .wall, .ground, .ground, .wall, .water, .water],
                [.ground, .ground, .water, .water, .wall, .win0, .win0, .wall, .water, .water],
                [.ground, .ground, .water, .water, .ground, .win0, .win0, .ground, .water, .water],
                [.ground, .ground, .wall, .water, .ground, .wall, .wall, .ground, .water, .water],
                [.ground, .ground, .wall, .wall, .water, .water, .water, .water, .water, .water],
                [.ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .win1, .win1],
                [.ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .win1, .win1],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water]
            ]
        case 7:
            chickenPosition0 = (2, 3)
            chickenPosition1 = (2, 9)
            
            giftPosition0 = (4, 3)
            giftPosition1 = (8, 5)
            
            gameGrid = [
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.ground, .win1, .wall, .ground, .win0, .ground, .water, .water, .ground, .ground],
                [.ground, .win1, .ground, .ground, .win0, .ground, .water, .water, .ground, .ground],
                [.ground, .ground, .ground, .wall, .ground, .ground, .water, .water, .ground, .ground],
                [.ground, .ground, .ground, .ground, .ground, .ground, .water, .water, .ground, .ground],
                [.water, .ground, .water, .water, .water, .water, .water, .water, .ground, .ground],
                [.water, .ground, .water, .water, .water, .water, .water, .water, .ground, .ground],
                [.water, .ground, .water, .water, .water, .water, .water, .water, .ground, .ground],
                [.water, .ground, .ground, .ground, .ground, .ground, .water, .water, .ground, .ground],
                [.water, .ground, .water, .water, .ground, .ground, .water, .water, .ground, .ground],
                [.water, .water, .water, .water, .ground, .water, .water, .water, .ground, .ground],
                [.water, .water, .water, .water, .ground, .water, .water, .water, .ground, .ground],
                [.water, .water, .water, .water, .ground, .ground, .ground, .ground, .ground, .ground],
                [.water, .water, .water, .water, .ground, .ground, .ground, .ground, .ground, .ground],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water]
            ]
        case 8:
            chickenPosition0 = (12, 1)
            chickenPosition1 = (12, 8)
            
            giftPosition0 = (7, 0)
            giftPosition1 = (10, 9)
            
            gameGrid = [
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.win0, .win0, .win0, .water, .win1, .dirt, .dirt, .dirt, .dirt, .dirt],
                [.win0, .win0, .win0, .water, .win1, .dirt, .dirt, .dirt, .dirt, .dirt],
                [.ground, .ground, .ground, .water, .water, .water, .water, .ground, .ground, .ground],
                [.ground, .ground, .ground, .water, .water, .water, .water, .ground, .ground, .ground],
                [.dirt, .dirt, .dirt, .water, .water, .water, .water, .ground, .ground, .ground],
                [.dirt, .dirt, .dirt, .water, .water, .water, .water, .ground, .ground, .ground],
                [.ground, .ground, .ground, .water, .water, .water, .water, .ground, .dirt, .dirt],
                [.ground, .ground, .ground, .water, .water, .water, .water, .dirt, .dirt, .dirt],
                [.ground, .ground, .ground, .water, .water, .water, .water, .dirt, .dirt, .dirt],
                [.dirt, .dirt, .dirt, .water, .water, .water, .water, .ground, .ground, .ground],
                [.dirt, .dirt, .dirt, .water, .water, .water, .water, .ground, .ground, .ground],
                [.ground, .ground, .ground, .water, .water, .water, .water, .ground, .ground, .ground],
                [.ground, .ground, .ground, .water, .water, .water, .water, .ground, .ground, .ground],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water]
            ]
        case 9:
            chickenPosition0 = (3, 6)
            chickenPosition1 = (10, 0)
            
            giftPosition0 = (3, 3)
            giftPosition1 = (10, 1)
            
            gameGrid = [
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground],
                [.ground, .win0, .win0, .ground, .ground, .ground, .ground, .wall, .wall, .ground],
                [.ground, .win0, .win0, .ground, .ground, .ground, .ground, .wall, .wall, .ground],
                [.ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground, .ground],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.ground, .ground, .ground, .ground, .ground, .win1, .win1, .ground, .ground, .ground],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
                [.water, .water, .water, .water, .water, .water, .water, .water, .water, .water],
            ]
        default:
            print("Error: unowned level")
        }
        
        showGame = true
    }

    public func chickenMove(_ direction: Int) {
        let yLimit: Int = gameGrid.count
        let xLimit: Int = gameGrid[0].count
        
        let moves: [(dx: Int, dy: Int)] = [
            (-1, 0),
            (1, 0),
            (0, -1),
            (0, 1)
        ]
        
        var newPosition0 = (chickenPosition0.0 + moves[direction].dx, chickenPosition0.1 + moves[direction].dy)
        var newPosition1 = (chickenPosition1.0 + moves[direction].dx, chickenPosition1.1 + moves[direction].dy)
        
        if newPosition0.0 >= 0 && newPosition0.0 < yLimit && newPosition0.1 >= 0 && newPosition0.1 < xLimit {
            if gameGrid[newPosition0.0][newPosition0.1] == .dirt {
                newPosition0 = (newPosition0.0, newPosition0.1 - 1)
                
                if newPosition0.0 >= 0 && newPosition0.0 < yLimit && newPosition0.1 >= 0 && newPosition0.1 < xLimit {
                    if isChickenMove(0, newPosition0, newPosition1) {
                        isAnimation = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.isAnimation = false
                        }
                        
                        withAnimation(.linear(duration: 0.35)) {
                            chickenMoveAnimation(0, direction, isDirt: true)
                        }
                    }
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        self.chickenScaleAnimation(0)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                            withAnimation() {
                                if !self.showLose1 {
                                    self.showLose0 = true
                                }
                            }
                        }
                    }
                }
            } else {
                if isChickenMove(0, newPosition0, newPosition1) {
                    isAnimation = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.isAnimation = false
                    }
                    
                    withAnimation(.linear(duration: 0.35)) {
                        chickenMoveAnimation(0, direction, isDirt: false)
                    }
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.chickenMoveAction(0, newPosition0, newPosition1)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.chickenScaleAnimation(0)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                    withAnimation() {
                        if !self.showLose1 {
                            self.showLose0 = true
                        }
                    }
                }
            }
        }
        
        if newPosition1.0 >= 0 && newPosition1.0 < yLimit && newPosition1.1 >= 0 && newPosition1.1 < xLimit {
            if gameGrid[newPosition1.0][newPosition1.1] == .dirt {
                newPosition1 = (newPosition1.0, newPosition1.1 - 1)
                
                if newPosition1.0 >= 0 && newPosition1.0 < yLimit && newPosition1.1 >= 0 && newPosition1.1 < xLimit {
                    if isChickenMove(1, newPosition0, newPosition1) {
                        isAnimation = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.isAnimation = false
                        }
                        
                        withAnimation(.linear(duration: 0.35)) {
                            chickenMoveAnimation(1, direction, isDirt: true)
                        }
                    }
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        self.chickenScaleAnimation(1)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                            withAnimation() {
                                if !self.showLose0 {
                                    self.showLose1 = true
                                }
                            }
                        }
                    }
                }
            } else {
                if isChickenMove(1, newPosition0, newPosition1) {
                    isAnimation = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.isAnimation = false
                    }
                    
                    withAnimation(.linear(duration: 0.35)) {
                        chickenMoveAnimation(1, direction, isDirt: false)
                    }
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.chickenMoveAction(1, newPosition0, newPosition1)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.chickenScaleAnimation(1)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                    withAnimation() {
                        if !self.showLose0 {
                            self.showLose1 = true
                        }
                    }
                }
            }
        }
    }
    
    public func isChickenMove(_ index: Int, _ newPosition0: (Int, Int), _ newPosition1: (Int, Int)) -> Bool {
        if index == 0 {
            switch gameGrid[newPosition0.0][newPosition0.1] {
            case .empty, .water, .ground, .dirt, .win0:
                return true
            case .win1, .wall:
                return false
            }
        } else {
            switch gameGrid[newPosition1.0][newPosition1.1] {
            case .empty, .water, .ground, .dirt, .win1:
                return true
            case .win0, .wall:
                return false
            }
        }
    }

    public func chickenMoveAction(_ index: Int, _ newPosition0: (Int, Int), _ newPosition1: (Int, Int)) {
        let yLimit: Int = gameGrid.count
        let xLimit: Int = gameGrid[0].count
        
        
        if index == 0 {
            if newPosition0.0 >= 0 && newPosition0.0 < yLimit && newPosition0.1 >= 0 && newPosition0.1 < xLimit {
                switch gameGrid[newPosition0.0][newPosition0.1] {
                case .empty:
                    chickenPosition0 = newPosition0
                    if giftPosition0 == chickenPosition0 {
                        withAnimation() {
                            giftCollected[0] = true
                        }
                    } else if giftPosition1 == chickenPosition0 {
                        withAnimation() {
                            giftCollected[1] = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        self.chickenScaleAnimation(0)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                            withAnimation() {
                                if !self.showLose1 {
                                    self.showLose0 = true
                                }
                            }
                        }
                    }
                case .water:
                    chickenPosition0 = newPosition0
                    if giftPosition0 == chickenPosition0 {
                        withAnimation() {
                            giftCollected[0] = true
                        }
                    } else if giftPosition1 == chickenPosition0 {
                        withAnimation() {
                            giftCollected[1] = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        self.chickenScaleAnimation(0)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                            withAnimation() {
                                if !self.showLose1 {
                                    self.showLose0 = true
                                }
                            }
                        }
                    }
                case .win1:
                    break
                case .wall:
                    break
                case .ground:
                    chickenPosition0 = newPosition0
                    if giftPosition0 == chickenPosition0 {
                        withAnimation() {
                            giftCollected[0] = true
                        }
                    } else if giftPosition1 == chickenPosition0 {
                        withAnimation() {
                            giftCollected[1] = true
                        }
                    }
                case .dirt:
                    chickenPosition0 = newPosition0
                    if giftPosition0 == chickenPosition0 {
                        withAnimation() {
                            giftCollected[0] = true
                        }
                    } else if giftPosition1 == chickenPosition0 {
                        withAnimation() {
                            giftCollected[1] = true
                        }
                    }
                    
                case .win0:
                    chickenPosition0 = newPosition0
                    if giftPosition0 == chickenPosition0 {
                        withAnimation() {
                            giftCollected[0] = true
                        }
                    } else if giftPosition1 == chickenPosition0 {
                        withAnimation() {
                            giftCollected[1] = true
                        }
                    }
                    chickenCheckPositionForWin()
                }
            }
        } else {
            if newPosition1.0 >= 0 && newPosition1.0 < yLimit && newPosition1.1 >= 0 && newPosition1.1 < xLimit {
                switch gameGrid[newPosition1.0][newPosition1.1] {
                case .empty:
                    chickenPosition1 = newPosition1
                    if giftPosition0 == chickenPosition1 {
                        withAnimation() {
                            giftCollected[0] = true
                        }
                    } else if giftPosition1 == chickenPosition1 {
                        withAnimation() {
                            giftCollected[1] = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        self.chickenScaleAnimation(1)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                            withAnimation() {
                                if !self.showLose0 {
                                    self.showLose1 = true
                                }
                            }
                        }
                    }
                case .water:
                    chickenPosition1 = newPosition1
                    if giftPosition0 == chickenPosition1 {
                        withAnimation() {
                            giftCollected[0] = true
                        }
                    } else if giftPosition1 == chickenPosition1 {
                        withAnimation() {
                            giftCollected[1] = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        self.chickenScaleAnimation(1)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                            withAnimation() {
                                if !self.showLose0 {
                                    self.showLose1 = true
                                }
                            }
                        }
                    }
                case .win0:
                    break
                case .wall:
                    break
                case .ground:
                    chickenPosition1 = newPosition1
                    if giftPosition0 == chickenPosition1 {
                        withAnimation() {
                            giftCollected[0] = true
                        }
                    } else if giftPosition1 == chickenPosition1 {
                        withAnimation() {
                            giftCollected[1] = true
                        }
                    }
                case .dirt:
                    chickenPosition1 = newPosition1
                    if giftPosition0 == chickenPosition1 {
                        withAnimation() {
                            giftCollected[0] = true
                        }
                    } else if giftPosition1 == chickenPosition1 {
                        withAnimation() {
                            giftCollected[1] = true
                        }
                    }
                    
                case .win1:
                    chickenPosition1 = newPosition1
                    if giftPosition0 == chickenPosition1 {
                        withAnimation() {
                            giftCollected[0] = true
                        }
                    } else if giftPosition1 == chickenPosition1 {
                        withAnimation() {
                            giftCollected[1] = true
                        }
                    }
                    chickenCheckPositionForWin()
                }
            }
        }
    }
    
    public func chickenMoveAnimation(_ index: Int, _ direction: Int, isDirt: Bool) {
        let tileSize: CGFloat = 36
        
        if index == 0 {
            if isDirt {
                switch direction {
                case 0:
                    chickenOffset0 = CGSize(width: -tileSize, height: -tileSize)
                case 1:
                    chickenOffset0 = CGSize(width: -tileSize, height: tileSize)
                case 2:
                    chickenOffset0 = CGSize(width: -tileSize * 2, height: 0)
                case 3:
                    chickenOffset0 = CGSize(width: 0, height: 0)
                default:
                    print("Error: unowned direction")
                }
            } else {
                switch direction {
                case 0:
                    chickenOffset0 = CGSize(width: 0, height: -tileSize)
                case 1:
                    chickenOffset0 = CGSize(width: 0, height: tileSize)
                case 2:
                    chickenOffset0 = CGSize(width: -tileSize, height: 0)
                case 3:
                    chickenOffset0 = CGSize(width: tileSize, height: 0)
                default:
                    print("Error: unowned direction")
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.chickenOffset0 = .zero
            }
        } else {
            if isDirt {
                switch direction {
                case 0:
                    chickenOffset1 = CGSize(width: -tileSize, height: -tileSize)
                case 1:
                    chickenOffset1 = CGSize(width: -tileSize, height: tileSize)
                case 2:
                    chickenOffset1 = CGSize(width: -tileSize * 2, height: 0)
                case 3:
                    chickenOffset1 = CGSize(width: 0, height: 0)
                default:
                    print("Error: unowned direction")
                }
            } else {
                switch direction {
                case 0:
                    chickenOffset1 = CGSize(width: 0, height: -tileSize)
                case 1:
                    chickenOffset1 = CGSize(width: 0, height: tileSize)
                case 2:
                    chickenOffset1 = CGSize(width: -tileSize, height: 0)
                case 3:
                    chickenOffset1 = CGSize(width: tileSize, height: 0)
                default:
                    print("Error: unowned direction")
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.chickenOffset1 = .zero
            }
        }
    }
    
    public func chickenScaleAnimation(_ index: Int) {
        if index == 0 {
            withAnimation(.linear(duration: 0.5)) {
                chickenScale0 = 0.1
            }
        } else {
            withAnimation(.linear(duration: 0.5)) {
                chickenScale1 = 0.1
            }
        }
    }
    
    public func chickenCheckPositionForWin() {
        if !showLose0 && !showLose1 {
            if gameGrid[chickenPosition0.0][chickenPosition0.1] == .win0 && gameGrid[chickenPosition1.0][chickenPosition1.1] == .win1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    if !self.showLose0 && !self.showLose1 {
                        self.chickenScaleAnimation(0)
                        self.chickenScaleAnimation(1)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                            if !self.showLose0 && !self.showLose1 {
                                withAnimation() {
                                    if self.giftCollected[0] && self.giftCollected[1] {
                                        self.chickenCheckSkinForWin()
                                    }
                                    
                                    self.showWin = true
                                    
                                    self.dateLevel[self.levelGame] = 2
                                    
                                    if self.levelGame < 9 {
                                        if self.dateLevel[self.levelGame + 1] == 0 {
                                            self.dateLevel[self.levelGame + 1] = 1
                                        }
                                    }
                                    
                                    for index in 0...self.dateLevel.count - 1 {
                                        if self.dateLevel[index] == 1 {
                                            self.currentLevel = index
                                            break
                                        }
                                    }
                                    
                                    self.chickenSaveUserDefaultsData()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    public func chickenCheckSkinForWin() {
        switch levelGame {
        case 0:
            if dateShop[0][1] == 0 {
                dateShop[0][1] = 1
                
                withAnimation() {
                    showSkinWin = true
                }
            }
        case 1:
            if dateShop[1][1] == 0 {
                dateShop[1][1] = 1
                
                withAnimation() {
                    showSkinWin = true
                }
            }
        case 2:
            if dateShop[0][2] == 0 {
                dateShop[0][2] = 1
                
                withAnimation() {
                    showSkinWin = true
                }
            }
        case 3:
            if dateShop[1][2] == 0 {
                dateShop[1][2] = 1
                
                withAnimation() {
                    showSkinWin = true
                }
            }
        case 4:
            if dateShop[0][3] == 0 {
                dateShop[0][3] = 1
                
                withAnimation() {
                    showSkinWin = true
                }
            }
        case 5:
            if dateShop[1][3] == 0 {
                dateShop[1][3] = 1
                
                withAnimation() {
                    showSkinWin = true
                }
            }
        case 6:
            if dateShop[0][4] == 0 {
                dateShop[0][4] = 1
                
                withAnimation() {
                    showSkinWin = true
                }
            }
        case 7:
            if dateShop[1][4] == 0 {
                dateShop[1][4] = 1
                
                withAnimation() {
                    showSkinWin = true
                }
            }
        case 8:
            if dateShop[0][5] == 0 {
                dateShop[0][5] = 1
                
                withAnimation() {
                    showSkinWin = true
                }
            }
        case 9:
            if dateShop[1][5] == 0 {
                dateShop[1][5] = 1
                
                withAnimation() {
                    showSkinWin = true
                }
            }
        default:
            print("Error: unowned level")
        }
        
        chickenSaveUserDefaultsData()
    }

    public func chickenSetupShop() {
        pageShop = 0
        itemShop = selectedShop
        showShop = true
    }
    
    public func chickenSaveUserDefaultsData() {
        UserDefaults.standard.set(dateWelcome, forKey: "dateWelcome")
        UserDefaults.standard.set(dateLevel, forKey: "dateLevel")
        UserDefaults.standard.set(dateShop, forKey: "dateShop")
        UserDefaults.standard.set([selectedShop.0, selectedShop.1], forKey: "selectedShop")
    }
    
    public func chickenLoadUserDefaultsData() {
        dateWelcome = UserDefaults.standard.integer(forKey: "dateWelcome")
        dateLevel = UserDefaults.standard.array(forKey: "dateLevel") as? [Int] ?? [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        dateShop = UserDefaults.standard.array(forKey: "dateShop") as? [[Int]] ?? [
            [1, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0]
        ]
        if let array = UserDefaults.standard.array(forKey: "selectedShop") as? [Int], array.count == 2 {
            selectedShop = (array[0], array[1])
        } else {
            selectedShop = (0, 0)
        }
    }
}
