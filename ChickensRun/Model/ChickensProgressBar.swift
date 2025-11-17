import SwiftUI

struct ChickensProgressBar: View {
    var progress: CGFloat
    let stripeWidth: CGFloat = 15
    let height: CGFloat = 35
    
    @State private var offsetX: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: height / 2)
                .fill(Color.yellow)
                .frame(height: height)
            
            GeometryReader { geo in
                let width = geo.size.width * progress
                let stripesCount = Int((width / stripeWidth) * 2)
                
                HStack(spacing: 0) {
                    ForEach(0..<stripesCount, id: \.self) { i in
                        Rectangle()
                            .fill(i.isMultiple(of: 2) ? Color.orange : Color.yellow)
                            .frame(width: stripeWidth, height: height * 2)
                            .rotationEffect(.degrees(45))
                    }
                }
                .offset(x: offsetX)
                .frame(width: width, height: height, alignment: .leading)
                .clipShape(RoundedRectangle(cornerRadius: height / 2))
                .onAppear {
                    offsetX = 0
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                        offsetX = -stripeWidth * 2
                    }
                }
            }
        }
        .frame(height: height)
    }
}
