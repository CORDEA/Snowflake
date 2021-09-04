//
//  KochCurve.swift
//  Snowflake
//
//  Created by Yoshihiro Tanaka on 9/4/21.
//

import Foundation

class KochCurve {
    func compute(n: Int) -> [CGPoint] {
        let start = CGPoint(x: 100, y: 100)
        let end = CGPoint(x: 300, y: 100)
        return [start] + compute(n: n, a: start, b: end) + [end]
    }

    private func compute(n: Int, a: CGPoint, b: CGPoint) -> [CGPoint] {
        if n <= 0 {
            return []
        }

        let x = b.x - a.x
        let y = b.y - a.y
        let length = sqrt(pow(x, 2) + pow(y, 2))
        let angle60: CGFloat = CGFloat(60 * Double.pi / 180)
        let angle = atan2(y, x)

        let start = CGPoint(x: x * 1 / 3 + a.x, y: y * 1 / 3 + a.y)
        let end = CGPoint(x: x * 2 / 3 + a.x, y: y * 2 / 3 + a.y)
        let top = CGPoint(
                x: start.x + length / 3 * cos(angle + angle60),
                y: start.y + length / 3 * sin(angle + angle60)
        )

        return [start] + compute(n: n - 1, a: start, b: top) + [top] + compute(n: n - 1, a: top, b: end) + [end]
    }
}
