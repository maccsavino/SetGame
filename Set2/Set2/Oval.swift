//
//  Oval.swift
//  Set2
//
//  Created by Kevin Savinovich on 4/22/23.
//

import SwiftUI

struct Oval: Shape {
    func path(in rect: CGRect) -> Path {
            var path = Path()

            let center = CGPoint(x: rect.midX, y: rect.midY)
            let radiusX = rect.width / 12
            let radiusY = rect.width / 4
            
            let startPoint = CGPoint(x: center.x + radiusX, y: center.y)
            path.move(to: startPoint)
            
            let endPoint = CGPoint(x: center.x - radiusX, y: center.y)
            let controlPoint1 = CGPoint(x: center.x + radiusX, y: center.y - radiusY)
            let controlPoint2 = CGPoint(x: center.x - radiusX, y: center.y - radiusY)
            
            path.addCurve(to: endPoint, control1: controlPoint1, control2: controlPoint2)

            let startPoint2 = CGPoint(x: center.x - radiusX, y: center.y)
            path.move(to: startPoint2)

            let endPoint2 = CGPoint(x: center.x + radiusX, y: center.y)
            let controlPoint3 = CGPoint(x: center.x - radiusX, y: center.y + radiusY)
            let controlPoint4 = CGPoint(x: center.x + radiusX, y: center.y + radiusY)
            
            path.addCurve(to: endPoint2, control1: controlPoint3, control2: controlPoint4)

            return path
        }
    }

