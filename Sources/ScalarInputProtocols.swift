//
//  ScalarInputProtocols.swift
//  Cmg
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

// MARK: - Radius

public protocol InputRadiusAvailable {
    
    var inputRadius: ScalarInput { get }
}

extension InputRadiusAvailable {
    
    public var radius: Float {
        get { return inputRadius.value }
        set { inputRadius.setValue(newValue) }
    }
}

public protocol InputRadius0Available {
    
    var inputRadius0: ScalarInput { get }
}

extension InputRadius0Available {
    
    public var radius0: Float {
        get { return inputRadius0.value }
        set { inputRadius0.setValue(newValue) }
    }
}

public protocol InputRadius1Available {
    
    var inputRadius1: ScalarInput { get }
}

extension InputRadius1Available {
    
    public var radius1: Float {
        get { return inputRadius1.value }
        set { inputRadius1.setValue(newValue) }
    }
}

// MARK: - Angle

public protocol InputAngleAvailable {
    
    var inputAngle: ScalarInput { get }
}

extension InputAngleAvailable {
    
    public var angle: Float {
        get { return inputAngle.value }
        set { inputAngle.setValue(newValue) }
    }
}

// MARK: - NoiseLevel

public protocol InputNoiseLevelAvailable {
    
    var inputNoiseLevel: ScalarInput { get }
}

extension InputNoiseLevelAvailable {
    
    public var noiseLevel: Float {
        get { return inputNoiseLevel.value }
        set { inputNoiseLevel.setValue(newValue) }
    }
}

// MARK: - Sharpness

public protocol InputSharpnessAvailable {
    
    var inputSharpness: ScalarInput { get }
}

extension InputSharpnessAvailable {
    
    public var sharpness: Float {
        get { return inputSharpness.value }
        set { inputSharpness.setValue(newValue) }
    }
}

// MARK: - Amount

public protocol InputAmountAvailable {
    
    var inputAmount: ScalarInput { get }
}

extension InputAmountAvailable {
    
    public var amount: Float {
        get { return inputAmount.value }
        set { inputAmount.setValue(newValue) }
    }
}

// MARK: - Saturation

public protocol InputSaturationAvailable {
    
    var inputSaturation: ScalarInput { get }
}

extension InputSaturationAvailable {
    
    public var saturation: Float {
        get { return inputSaturation.value }
        set { inputSaturation.setValue(newValue) }
    }
}

// MARK: - Brightness

public protocol InputBrightnessAvailable {
    
    var inputBrightness: ScalarInput { get }
}

extension InputBrightnessAvailable {
    
    public var brightness: Float {
        get { return inputBrightness.value }
        set { inputBrightness.setValue(newValue) }
    }
}

// MARK: - Contrast

public protocol InputContrastAvailable {
    
    var inputContrast: ScalarInput { get }
}

extension InputContrastAvailable {
    
    public var contrast: Float {
        get { return inputContrast.value }
        set { inputContrast.setValue(newValue) }
    }
}

// MARK: - EV

public protocol InputEVAvailable {
    
    var inputEV: ScalarInput { get }
}

extension InputEVAvailable {
    
    public var ev: Float {
        get { return inputEV.value }
        set { inputEV.setValue(newValue) }
    }
}

// MARK: - Power

public protocol InputPowerAvailable {
    
    var inputPower: ScalarInput { get }
}

extension InputPowerAvailable {
    
    public var power: Float {
        get { return inputPower.value }
        set { inputPower.setValue(newValue) }
    }
}

// MARK: - CubeDimension

public protocol InputCubeDimensionAvailable {
    
    var inputCubeDimension: ScalarInput { get }
}

extension InputCubeDimensionAvailable {
    
    public var cubeDimension: Float {
        get { return inputCubeDimension.value }
        set { inputCubeDimension.setValue(newValue) }
    }
}

// MARK: - Intensity

public protocol InputIntensityAvailable {
    
    var inputIntensity: ScalarInput { get }
}

extension InputIntensityAvailable {
    
    public var intensity: Float {
        get { return inputIntensity.value }
        set { inputIntensity.setValue(newValue) }
    }
}

// MARK: - Levels

public protocol InputLevelsAvailable {
    
    var inputLevels: ScalarInput { get }
}

extension InputLevelsAvailable {
    
    public var levels: Float {
        get { return inputLevels.value }
        set { inputLevels.setValue(newValue) }
    }
}

// MARK: - Scale

public protocol InputScaleAvailable {
    
    var inputScale: ScalarInput { get }
}

extension InputScaleAvailable {
    
    public var scale: Float {
        get { return inputScale.value }
        set { inputScale.setValue(newValue) }
    }
}

// MARK: - AspectRatio

public protocol InputAspectRatioAvailable {
    
    var inputAspectRatio: ScalarInput { get }
}

extension InputAspectRatioAvailable {
    
    public var aspectRatio: Float {
        get { return inputAspectRatio.value }
        set { inputAspectRatio.setValue(newValue) }
    }
}

// MARK: - Width

public protocol InputWidthAvailable {
    
    var inputWidth: ScalarInput { get }
}

extension InputWidthAvailable {
    
    public var width: Float {
        get { return inputWidth.value }
        set { inputWidth.setValue(newValue) }
    }
}

// MARK: - GCR

public protocol InputGCRAvailable {
    
    var inputGCR: ScalarInput { get }
}

extension InputGCRAvailable {
    
    public var gcr: Float {
        get { return inputGCR.value }
        set { inputGCR.setValue(newValue) }
    }
}

// MARK: - UCR

public protocol InputUCRAvailable {
    
    var inputUCR: ScalarInput { get }
}

extension InputUCRAvailable {
    
    public var ucr: Float {
        get { return inputUCR.value }
        set { inputUCR.setValue(newValue) }
    }
}

// MARK: - QuietSpace

public protocol InputQuietSpaceAvailable {
    
    var inputQuietSpace: ScalarInput { get }
}

extension InputQuietSpaceAvailable {
    
    public var quietSpace: Float {
        get { return inputQuietSpace.value }
        set { inputQuietSpace.setValue(newValue) }
    }
}

// MARK: - CorrectionLevel

public protocol InputCorrectionLevelAvailable {
    
    var inputCorrectionLevel: ScalarInput { get }
}

extension InputCorrectionLevelAvailable {
    
    public var correctionLevel: Float {
        get { return inputCorrectionLevel.value }
        set { inputCorrectionLevel.setValue(newValue) }
    }
}

// MARK: - Layers

public protocol InputLayersAvailable {
    
    var inputLayers: ScalarInput { get }
}

extension InputLayersAvailable {
    
    public var layers: Float {
        get { return inputLayers.value }
        set { inputLayers.setValue(newValue) }
    }
}

// MARK: - Strands

public protocol InputStrandsAvailable {
    
    var inputStrands: ScalarInput { get }
}

extension InputStrandsAvailable {
    
    public var strands: Float {
        get { return inputStrands.value }
        set { inputStrands.setValue(newValue) }
    }
}

// MARK: - Periodicity

public protocol InputPeriodicityAvailable {
    
    var inputPeriodicity: ScalarInput { get }
}

extension InputPeriodicityAvailable {
    
    public var periodicity: Float {
        get { return inputPeriodicity.value }
        set { inputPeriodicity.setValue(newValue) }
    }
}

// MARK: - Rotation

public protocol InputRotationAvailable {
    
    var inputRotation: ScalarInput { get }
}

extension InputRotationAvailable {
    
    public var rotation: Float {
        get { return inputRotation.value }
        set { inputRotation.setValue(newValue) }
    }
}

// MARK: - Zoom

public protocol InputZoomAvailable {
    
    var inputZoom: ScalarInput { get }
}

extension InputZoomAvailable {
    
    public var zoom: Float {
        get { return inputZoom.value }
        set { inputZoom.setValue(newValue) }
    }
}

// MARK: - Refraction

public protocol InputRefractionAvailable {
    
    var inputRefraction: ScalarInput { get }
}

extension InputRefractionAvailable {
    
    public var refraction: Float {
        get { return inputRefraction.value }
        set { inputRefraction.setValue(newValue) }
    }
}

// MARK: - CropAmount

public protocol InputCropAmountAvailable {
    
    var inputCropAmount: ScalarInput { get }
}

extension InputCropAmountAvailable {
    
    public var cropAmount: Float {
        get { return inputCropAmount.value }
        set { inputCropAmount.setValue(newValue) }
    }
}

// MARK: - CenterStretchAmount

public protocol InputCenterStretchAmountAvailable {
    
    var inputCenterStretchAmount: ScalarInput { get }
}

extension InputCenterStretchAmountAvailable {
    
    public var centerStretchAmount: Float {
        get { return inputCenterStretchAmount.value }
        set { inputCenterStretchAmount.setValue(newValue) }
    }
}

// MARK: - Height

public protocol InputHeightAvailable {
    
    var inputHeight: ScalarInput { get }
}

extension InputHeightAvailable {
    
    public var height: Float {
        get { return inputHeight.value }
        set { inputHeight.setValue(newValue) }
    }
}

// MARK: - HighLimit

public protocol InputHighLimitAvailable {
    
    var inputHighLimit: ScalarInput { get }
}

extension InputHighLimitAvailable {
    
    public var highLimit: Float {
        get { return inputHighLimit.value }
        set { inputHighLimit.setValue(newValue) }
    }
}

// MARK: - LowLimit

public protocol InputLowLimitAvailable {
    
    var inputLowLimit: ScalarInput { get }
}

extension InputLowLimitAvailable {
    
    public var lowLimit: Float {
        get { return inputLowLimit.value }
        set { inputLowLimit.setValue(newValue) }
    }
}

// MARK: - Count

public protocol InputCountAvailable {
    
    var inputCount: ScalarInput { get }
}

extension InputCountAvailable {
    
    public var count: Float {
        get { return inputCount.value }
        set { inputCount.setValue(newValue) }
    }
}

// AcuteAngle

public protocol InputAcuteAngleAvailable {
    
    var inputAcuteAngle: ScalarInput { get }
}

extension InputAcuteAngleAvailable {
    
    public var acuteAngle: Float {
        get { return inputAcuteAngle.value }
        set { inputAcuteAngle.setValue(newValue) }
    }
}

// MARK: - Size

public protocol InputSizeAvailable {
    
    var inputSize: ScalarInput { get }
}

extension InputSizeAvailable {
    
    public var size: Float {
        get { return inputSize.value }
        set { inputSize.setValue(newValue) }
    }
}

// Decay

public protocol InputDecayAvailable {
    
    var inputDecay: ScalarInput { get }
}

extension InputDecayAvailable {
    
    public var decay: Float {
        get { return inputDecay.value }
        set { inputDecay.setValue(newValue) }
    }
}

// Bias

public protocol InputBiasAvailable {
    
    var inputBias: ScalarInput { get }
}

extension InputBiasAvailable {
    
    public var bias: Float {
        get { return inputBias.value }
        set { inputBias.setValue(newValue) }
    }
}

// Halo Radius

public protocol InputHaloRadiusAvailable {
    
    var inputHaloRadius: ScalarInput { get }
}

extension InputHaloRadiusAvailable {
    
    public var haloRadius: Float {
        get { return inputHaloRadius.value }
        set { inputHaloRadius.setValue(newValue) }
    }
}

// Halo Width

public protocol InputHaloWidthAvailable {
    
    var inputHaloWidth: ScalarInput { get }
}

extension InputHaloWidthAvailable {
    
    public var haloWidth: Float {
        get { return inputHaloWidth.value }
        set { inputHaloWidth.setValue(newValue) }
    }
}

// Halo Overlap

public protocol InputHaloOverlapAvailable {
    
    var inputHaloOverlap: ScalarInput { get }
}

extension InputHaloOverlapAvailable {
    
    public var haloOverlap: Float {
        get { return inputHaloOverlap.value }
        set { inputHaloOverlap.setValue(newValue) }
    }
}

// Striation Strength

public protocol InputStriationStrengthAvailable {
    
    var inputStriationStrength: ScalarInput { get }
}

extension InputStriationStrengthAvailable {
    
    public var striationStrength: Float {
        get { return inputStriationStrength.value }
        set { inputStriationStrength.setValue(newValue) }
    }
}

// Striation Contrast

public protocol InputStriationContrastAvailable {
    
    var inputStriationContrast: ScalarInput { get }
}

extension InputStriationContrastAvailable {
    
    public var striationContrast: Float {
        get { return inputStriationContrast.value }
        set { inputStriationContrast.setValue(newValue) }
    }
}

// Time

public protocol InputTimeAvailable {
    
    var inputTime: ScalarInput { get }
}

extension InputTimeAvailable {
    
    public var time: Float {
        get { return inputTime.value }
        set { inputTime.setValue(newValue) }
    }
}

// DataColumns

public protocol InputDataColumnsAvailable {
    
    var inputDataColumns: ScalarInput { get }
}

extension InputDataColumnsAvailable {
    
    public var dataColumns: Float {
        get { return inputDataColumns.value }
        set { inputDataColumns.setValue(newValue) }
    }
}

// Rows

public protocol InputRowsAvailable {
    
    var inputRows: ScalarInput { get }
}

extension InputRowsAvailable {
    
    public var rows: Float {
        get { return inputRows.value }
        set { inputRows.setValue(newValue) }
    }
}

// Preferred AspectRatio

public protocol InputPreferredAspectRatioAvailable {
    
    var inputPreferredAspectRatio: ScalarInput { get }
}

extension InputPreferredAspectRatioAvailable {
    
    public var preferredAspectRatio: Float {
        get { return inputPreferredAspectRatio.value }
        set { inputPreferredAspectRatio.setValue(newValue) }
    }
}

// Compaction Mode

public protocol InputCompactionModeAvailable {
    
    var inputCompactionMode: ScalarInput { get }
}

extension InputCompactionModeAvailable {
    
    public var compactionMode: Float {
        get { return inputCompactionMode.value }
        set { inputCompactionMode.setValue(newValue) }
    }
}


// Always Specify Compaction

public protocol InputAlwaysSpecifyCompactionAvailable {
    
    var inputAlwaysSpecifyCompaction: ScalarInput { get }
}

extension InputAlwaysSpecifyCompactionAvailable {
    
    public var alwaysSpecifyCompaction: Float {
        get { return inputAlwaysSpecifyCompaction.value }
        set { inputAlwaysSpecifyCompaction.setValue(newValue) }
    }
}

// Cross Scale

public protocol InputCrossScaleAvailable {
    
    var inputCrossScale: ScalarInput { get }
}

extension InputCrossScaleAvailable {
    
    public var crossScale: Float {
        get { return inputCrossScale.value }
        set { inputCrossScale.setValue(newValue) }
    }
}

// Cross Angle

public protocol InputCrossAngleAvailable {
    
    var inputCrossAngle: ScalarInput { get }
}

extension InputCrossAngleAvailable {
    
    public var crossAngle: Float {
        get { return inputCrossAngle.value }
        set { inputCrossAngle.setValue(newValue) }
    }
}

// Cross Opacity

public protocol InputCrossOpacityAvailable {
    
    var inputCrossOpacity: ScalarInput { get }
}

extension InputCrossOpacityAvailable {
    
    public var crossOpacity: Float {
        get { return inputCrossOpacity.value }
        set { inputCrossOpacity.setValue(newValue) }
    }
}

// Cross Width

public protocol InputCrossWidthAvailable {
    
    var inputCrossWidth: ScalarInput { get }
}

extension InputCrossWidthAvailable {
    
    public var crossWidth: Float {
        get { return inputCrossWidth.value }
        set { inputCrossWidth.setValue(newValue) }
    }
}

// Epsilon

public protocol InputEpsilonAvailable {
    
    var inputEpsilon: ScalarInput { get }
}

extension InputEpsilonAvailable {
    
    public var epsilon: Float {
        get { return inputEpsilon.value }
        set { inputEpsilon.setValue(newValue) }
    }
}

// Sun Radius

public protocol InputSunRadiusAvailable {
    
    var inputSunRadius: ScalarInput { get }
}

extension InputSunRadiusAvailable {
    
    public var sunRadius: Float {
        get { return inputSunRadius.value }
        set { inputSunRadius.setValue(newValue) }
    }
}

// Max Striation Radius

public protocol InputMaxStriationRadiusAvailable {
    
    var inputMaxStriationRadius: ScalarInput { get }
}

extension InputMaxStriationRadiusAvailable {
    
    public var maxStriationRadius: Float {
        get { return inputMaxStriationRadius.value }
        set { inputMaxStriationRadius.setValue(newValue) }
    }
}

// Unsharp Mask Radius

public protocol InputUnsharpMaskRadiusAvailable {
    
    var inputUnsharpMaskRadius: ScalarInput { get }
}

extension InputUnsharpMaskRadiusAvailable {
    
    public var unsharpMaskRadius: Float {
        get { return inputUnsharpMaskRadius.value }
        set { inputUnsharpMaskRadius.setValue(newValue) }
    }
}

// Unsharp Mask Intensity

public protocol InputUnsharpMaskIntensityAvailable {
    
    var inputUnsharpMaskIntensity: ScalarInput { get }
}

extension InputUnsharpMaskIntensityAvailable {
    
    public var unsharpMaskIntensity: Float {
        get { return inputUnsharpMaskIntensity.value }
        set { inputUnsharpMaskIntensity.setValue(newValue) }
    }
}

// Highlight Amount

public protocol InputHighlightAmountAvailable {
    
    var inputHighlightAmount: ScalarInput { get }
}

extension InputHighlightAmountAvailable {
    
    public var highlightAmount: Float {
        get { return inputHighlightAmount.value }
        set { inputHighlightAmount.setValue(newValue) }
    }
}

// Shadow Amount

public protocol InputShadowAmountAvailable {
    
    var inputShadowAmount: ScalarInput { get }
}

extension InputShadowAmountAvailable {
    
    public var shadowAmount: Float {
        get { return inputShadowAmount.value }
        set { inputShadowAmount.setValue(newValue) }
    }
}

// NRNoiseLevel

public protocol InputNRNoiseLevelAvailable {
    
    var inputNRNoiseLevel: ScalarInput { get }
}

extension InputNRNoiseLevelAvailable {
    
    public var nrNoiseLevel: Float {
        get { return inputNRNoiseLevel.value }
        set { inputNRNoiseLevel.setValue(newValue) }
    }
}

// NRSharpness

public protocol InputNRSharpnessAvailable {
    
    var inputNRSharpness: ScalarInput { get }
}

extension InputNRSharpnessAvailable {
    
    public var nrSharpness: Float {
        get { return inputNRSharpness.value }
        set { inputNRSharpness.setValue(newValue) }
    }
}

// Edge Intensity

public protocol InputEdgeIntensityAvailable {
    
    var inputEdgeIntensity: ScalarInput { get }
}

extension InputEdgeIntensityAvailable {
    
    public var edgeIntensity: Float {
        get { return inputEdgeIntensity.value }
        set { inputEdgeIntensity.setValue(newValue) }
    }
}

// Threshold

public protocol InputThresholdAvailable {
    
    var inputThreshold: ScalarInput { get }
}

extension InputThresholdAvailable {
    
    public var threshold: Float {
        get { return inputThreshold.value }
        set { inputThreshold.setValue(newValue) }
    }
}
