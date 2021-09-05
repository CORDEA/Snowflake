//
//  ContentView.swift
//  Snowflake
//
//  Created by Yoshihiro Tanaka on 9/4/21.
//

import SwiftUI

struct ContentView: View {
    private let width: CGFloat = 500
    private let height: CGFloat = 500
    private let length: CGFloat = 300
    private let n = 3

    private let curve: KochCurve

    init() {
        curve = KochCurve(length: length)
    }

    var body: some View {
        Path { path in
            path.addPath(
                    drawKochCurve(n: n),
                    transform: CGAffineTransform(translationX: width / 2, y: 0)
            )
        }
                .stroke(lineWidth: 1.0)
                .padding()
                .frame(width: width, height: height, alignment: .center)
    }

    private func drawKochCurve(n: Int) -> Path {
        let list = curve.compute(n: n)
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            list.forEach { point in
                path.addLine(to: point)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
