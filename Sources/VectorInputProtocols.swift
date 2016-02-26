//
//  VectorInputProtocols.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/19.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

// MARK: - Center

public protocol InputCenterAvailable {
    
    var inputCenter: VectorInput { get }
}

extension InputCenterAvailable {
    
    public var center: Vector2 {
        get { return inputCenter.vector2 }
        set { inputCenter.setVector(newValue.ciVector) }
    }
}

// MARK: - Point

public protocol InputPointAvailable {
    
    var inputPoint: VectorInput { get }
}

extension InputPointAvailable {
    
    public var point: Vector2 {
        get { return inputPoint.vector2 }
        set { inputPoint.setVector(newValue.ciVector) }
    }
}

public protocol InputPoint0Available {
    
    var inputPoint0: VectorInput { get }
}

extension InputPoint0Available {
    
    public var point0: Vector2 {
        get { return inputPoint0.vector2 }
        set { inputPoint0.setVector(newValue.ciVector) }
    }
}

public protocol InputPoint1Available {
    
    var inputPoint1: VectorInput { get }
}

extension InputPoint1Available {
    
    public var point1: Vector2 {
        get { return inputPoint1.vector2 }
        set { inputPoint1.setVector(newValue.ciVector) }
    }
}

public protocol InputPoint2Available {
    
    var inputPoint2: VectorInput { get }
}

extension InputPoint2Available {
    
    public var point2: Vector2 {
        get { return inputPoint2.vector2 }
        set { inputPoint2.setVector(newValue.ciVector) }
    }
}

public protocol InputPoint3Available {
    
    var inputPoint3: VectorInput { get }
}

extension InputPoint3Available {
    
    public var point3: Vector2 {
        get { return inputPoint3.vector2 }
        set { inputPoint3.setVector(newValue.ciVector) }
    }
}

public protocol InputPoint4Available {
    
    var inputPoint4: VectorInput { get }
}

extension InputPoint4Available {
    
    public var point4: Vector2 {
        get { return inputPoint4.vector2 }
        set { inputPoint4.setVector(newValue.ciVector) }
    }
}

// MARK: - Inset

public protocol InputInsetPoint0Available {
    
    var inputInsetPoint0: VectorInput { get }
}

extension InputInsetPoint0Available {
    
    public var insetPoint0: Vector2 {
        get { return inputInsetPoint0.vector2 }
        set { inputInsetPoint0.setVector(newValue.ciVector) }
    }
}

public protocol InputInsetPoint1Available {
    
    var inputInsetPoint1: VectorInput { get }
}

extension InputInsetPoint1Available {
    
    public var insetPoint1: Vector2 {
        get { return inputInsetPoint1.vector2 }
        set { inputInsetPoint1.setVector(newValue.ciVector) }
    }
}

// MARK: - Size

public protocol InputVectorSizeAvailable {
    
    var inputVectorSize: VectorInput { get }
}

extension InputVectorSizeAvailable {
    
    public var vector_size: Vector2 {
        get { return inputVectorSize.vector2 }
        set { inputVectorSize.setVector(newValue.ciVector) }
    }
}

// MARK: - Extent

public protocol InputExtentAvailable {
    
    var inputExtent: VectorInput { get }
}

extension InputExtentAvailable {
    
    public var extent: Vector4 {
        get { return inputExtent.vector4 }
        set { inputExtent.setVector(newValue.ciVector) }
    }
}

// MARK: - Rect

public protocol InputTopLeftAvailable {
    
    var inputTopLeft: VectorInput { get }
}

extension InputTopLeftAvailable {
    
    public var topLeft: Vector2 {
        get { return inputTopLeft.vector2 }
        set { inputTopLeft.setVector(newValue.ciVector) }
    }
}

public protocol InputTopRightAvailable {
    
    var inputTopRight: VectorInput { get }
}

extension InputTopRightAvailable {
    
    public var topRight: Vector2 {
        get { return inputTopRight.vector2 }
        set { inputTopRight.setVector(newValue.ciVector) }
    }
}

public protocol InputBottomRightAvailable {
    
    var inputBottomRight: VectorInput { get }
}

extension InputBottomRightAvailable {
    
    public var bottomRight: Vector2 {
        get { return inputBottomRight.vector2 }
        set { inputBottomRight.setVector(newValue.ciVector) }
    }
}

public protocol InputBottomLeftAvailable {
    
    var inputBottomLeft: VectorInput { get }
}

extension InputBottomLeftAvailable {
    
    public var bottomLeft: Vector2 {
        get { return inputBottomLeft.vector2 }
        set { inputBottomLeft.setVector(newValue.ciVector) }
    }
}

// MARK: - Components Input

public protocol InputMaxComponentsAvailable {
    
    var inputMaxComponents: VectorInput { get }
}

extension InputMaxComponentsAvailable {
    
    public var maxComponents: Vector4 {
        get { return inputMaxComponents.vector4 }
        set { inputMaxComponents.setVector(newValue.ciVector) }
    }
}

public protocol InputMinComponentsAvailable {
    
    var inputMinComponents: VectorInput { get }
}

extension InputMinComponentsAvailable {
    
    public var minComponents: Vector4 {
        get { return inputMinComponents.vector4 }
        set { inputMinComponents.setVector(newValue.ciVector) }
    }
}

// MARK: - RGBA

public protocol InputRVectorAvailable {
    
    var inputRVector: VectorInput { get }
}

extension InputRVectorAvailable {
    
    public var rVector: Vector4 {
        get { return inputRVector.vector4 }
        set { inputRVector.setVector(newValue.ciVector) }
    }
}

public protocol InputGVectorAvailable {
    
    var inputGVector: VectorInput { get }
}

extension InputGVectorAvailable {
    
    public var gVector: Vector4 {
        get { return inputGVector.vector4 }
        set { inputGVector.setVector(newValue.ciVector) }
    }
}

public protocol InputBVectorAvailable {
    
    var inputBVector: VectorInput { get }
}

extension InputBVectorAvailable {
    
    public var bVector: Vector4 {
        get { return inputBVector.vector4 }
        set { inputBVector.setVector(newValue.ciVector) }
    }
}

public protocol InputAVectorAvailable {
    
    var inputAVector: VectorInput { get }
}

extension InputAVectorAvailable {
    
    public var aVector: Vector4 {
        get { return inputAVector.vector4 }
        set { inputAVector.setVector(newValue.ciVector) }
    }
}

public protocol InputBiasVectorAvailable {
    
    var inputBiasVector: VectorInput { get }
}

extension InputBiasVectorAvailable {
    
    public var biasVector: Vector4 {
        get { return inputBiasVector.vector4 }
        set { inputBiasVector.setVector(newValue.ciVector) }
    }
}

// MARK: - Coefficients

public protocol InputRedCoefficientsAvailable {
    
    var inputRedCoefficients: VectorInput { get }
}

extension InputRedCoefficientsAvailable {
    
    public var redCoefficients: VectorAny {
        get { return inputRedCoefficients.vectorAny }
        set { inputRedCoefficients.setVector(newValue.ciVector) }
    }
}

public protocol InputGreenCoefficientsAvailable {
    
    var inputGreenCoefficients: VectorInput { get }
}

extension InputGreenCoefficientsAvailable {
    
    public var greenCoefficients: VectorAny {
        get { return inputGreenCoefficients.vectorAny }
        set { inputGreenCoefficients.setVector(newValue.ciVector) }
    }
}

public protocol InputBlueCoefficientsAvailable {
    
    var inputBlueCoefficients: VectorInput { get }
}

extension InputBlueCoefficientsAvailable {
    
    public var blueCoefficients: VectorAny {
        get { return inputBlueCoefficients.vectorAny }
        set { inputBlueCoefficients.setVector(newValue.ciVector) }
    }
}

public protocol InputAlphaCoefficientsAvailable {
    
    var inputAlphaCoefficients: VectorInput { get }
}

extension InputAlphaCoefficientsAvailable {
    
    public var alphaCoefficients: VectorAny {
        get { return inputAlphaCoefficients.vectorAny }
        set { inputAlphaCoefficients.setVector(newValue.ciVector) }
    }
}

// MARK: - Neutral

public protocol InputNeutralAvailable {
    
    var inputNeutral: VectorInput { get }
}

extension InputNeutralAvailable {
    
    public var neutral: Vector2 {
        get { return inputNeutral.vector2 }
        set { inputNeutral.setVector(newValue.ciVector) }
    }
}

// MARK: - Target Neutral

public protocol InputTargetNeutralAvailable {
    
    var inputTargetNeutral: VectorInput { get }
}

extension InputTargetNeutralAvailable {
    
    public var targetNeutral: Vector2 {
        get { return inputTargetNeutral.vector2 }
        set { inputTargetNeutral.setVector(newValue.ciVector) }
    }
}

// MARK: - Min Width

public protocol InputMinWidthAvailable {
    
    var inputMinWidth: VectorInput { get }
}

extension InputMinWidthAvailable {
    
    public var minWidth: Vector2 {
        get { return inputMinWidth.vector2 }
        set { inputMinWidth.setVector(newValue.ciVector) }
    }
}

// MARK: - Max Width

public protocol InputMaxWidthAvailable {
    
    var inputMaxWidth: VectorInput { get }
}

extension InputMaxWidthAvailable {
    
    public var maxWidth: Vector2 {
        get { return inputMaxWidth.vector2 }
        set { inputMaxWidth.setVector(newValue.ciVector) }
    }
}

// MARK: - Min Height

public protocol InputMinHeightAvailable {
    
    var inputMinHeight: VectorInput { get }
}

extension InputMinHeightAvailable {
    
    public var minHeight: Vector2 {
        get { return inputMinHeight.vector2 }
        set { inputMinHeight.setVector(newValue.ciVector) }
    }
}

// MARK: - Max Height

public protocol InputMaxHeightAvailable {
    
    var inputMaxHeight: VectorInput { get }
}

extension InputMaxHeightAvailable {
    
    public var maxHeight: Vector2 {
        get { return inputMaxHeight.vector2 }
        set { inputMaxHeight.setVector(newValue.ciVector) }
    }
}

// MARK: - Weights

public protocol InputWeightsAvailable {
    
    var inputWeights: VectorInput { get }
}

extension InputWeightsAvailable {
    
    public var weights: VectorAny {
        get { return inputWeights.vectorAny }
        set { inputWeights.setVector(newValue.ciVector) }
    }
}

// MARK: - Rectangle

public protocol InputRectangleAvailable {
    
    var inputRectangle: VectorInput { get }
}

extension InputRectangleAvailable {
    
    public var rectangle: Vector4 {
        get { return inputRectangle.vector4 }
        set { inputRectangle.setVector(newValue.ciVector) }
    }
}
