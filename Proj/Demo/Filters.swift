//
//  Filters.swift
//  Demo
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit
import Cmg

protocol PhotoProcessable: class {
    
    var name: String { get }
    var sliders: [Slider] { get }
    var thumbnailImage: UIImage? { get set }
    
    func processing(_ uiImage: UIImage) -> UIImage
    func resetSliderValues()
}

final class Filter<T: Cmg.Processable>: PhotoProcessable {
    
    typealias FilterClass = T
    
    let name: String
    let sliders: [Slider]
    let internalFilter: FilterClass
    
    var thumbnailImage: UIImage?
    
    init(_ filter: FilterClass) {
        self.name = filter.name
        self.sliders = filter.sliders()
        self.internalFilter = filter
    }
    
    func processing(_ uiImage: UIImage) -> UIImage {
        let b = Benchmark(key: self.name); defer { _ = b.finish() }
        
        let filteredImage: UIImage? = self.internalFilter.processing(uiImage)
        if filteredImage == nil {
            print("filteredImage is nil !!!")
            if let _filter = self.internalFilter as? Filterable { print(_filter.filter.attributes) }
        }
        return filteredImage ?? uiImage
    }
    
    func resetSliderValues() {
        self.sliders.forEach() { $0.resetValue() }
    }
}

struct FilterGenerator {}

enum Image {
    case original
    case thumbnail
    
    var size : CGSize {
        switch self {
        case .original:
            return CGSize(width: 1200, height: 1200)
        case .thumbnail:
            return CGSize(width: 600, height: 600)
        }
    }
}

extension FilterGenerator {
    
    static var originalImage: UIImage = UIImage(named: "sample.jpg")!
    static var thumbnailImage: UIImage = UIImage(named: "sample.jpg")!.cmg_resizeAtAspectFill(Image.thumbnail.size)!
    
    static func generate() -> [PhotoProcessable] {
        var filters: [PhotoProcessable] = []
        let size = FilterGenerator.originalImage.size
        let blendImage = UIImage(named: "blendImage.jpg")!
        let maskImage = UIImage(named: "maskImage.png")!
        
        // Blur
        
        if #available(iOS 9.0, *) {
            filters.append(Filter(BoxBlur()))
            filters.append(Filter(DiscBlur()))
            filters.append(Filter(GaussianBlur()))
            filters.append(Filter(Median()))
            filters.append(Filter(MotionBlur()))
            filters.append(Filter(NoiseReduction()))
            filters.append(Filter(ZoomBlur(imageSize: size)))
        }
        
        // Color Adjustment
        
        filters.append(Filter(ColorClamp()))
        filters.append(Filter(ColorControls()))
        filters.append(Filter(ColorMatrix()))
        filters.append(Filter(ColorPolynomial()))
        filters.append(Filter(ExposureAdjust()))
        filters.append(Filter(GammaAdjust()))
        filters.append(Filter(HueAdjust()))
        filters.append(Filter(LinearToSRGBToneCurve()))
        filters.append(Filter(SRGBToneCurveToLinear()))
        filters.append(Filter(TemperatureAndTint()))
        filters.append(Filter(ToneCurve()))
        filters.append(Filter(Vibrance()))
        filters.append(Filter(WhitePointAdjust()))
        
        // Color Effect
        
        filters.append(Filter(ColorCrossPolynomial()))
        
        let cubeArray: [Double] = [
            0.7, 0.5, 1.0, 0.6,
            0.0, 1.0, 0.0, 1.0,
            0.9, 0.6, 0.8, 0.2,
            1.0, 0.4, 0.0, 1.0]
        let bytes = UnsafeMutablePointer<UInt8>.allocate(capacity: cubeArray.count)
        let count = MemoryLayout<Double>.size * cubeArray.count
        let cubeData = Data(bytes: bytes, count: count)
        defer {
            bytes.deinitialize(count: cubeArray.count)
            bytes.deallocate()
        }
        
        filters.append(Filter(ColorCube(inputCubeData: cubeData)))
        filters.append(Filter(ColorCubeWithColorSpace(inputCubeData: cubeData, inputColorSpace: CGColorSpaceCreateDeviceRGB())))
        filters.append(Filter(ColorInvert()))
        filters.append(Filter(ColorMap(uiImage: blendImage)))
        filters.append(Filter(ColorMonochrome()))
        filters.append(Filter(ColorPosterize()))
        filters.append(Filter(FalseColor()))
        filters.append(Filter(MaskToAlpha()))
        filters.append(Filter(MaximumComponent()))
        filters.append(Filter(MinimumComponent()))
        filters.append(Filter(PhotoEffectChrome()))
        filters.append(Filter(PhotoEffectFade()))
        filters.append(Filter(PhotoEffectInstant()))
        filters.append(Filter(PhotoEffectMono()))
        filters.append(Filter(PhotoEffectNoir()))
        filters.append(Filter(PhotoEffectProcess()))
        filters.append(Filter(PhotoEffectTonal()))
        filters.append(Filter(PhotoEffectTransfer()))
        filters.append(Filter(SepiaTone()))
        filters.append(Filter(Vignette()))
        filters.append(Filter(VignetteEffect(imageSize: size)))
        
        // Composite Operation
        
        filters.append(Filter(AdditionCompositing(uiImage: blendImage)))
        filters.append(Filter(ColorBlendMode(uiImage: blendImage)))
        filters.append(Filter(ColorBurnBlendMode(uiImage: blendImage)))
        filters.append(Filter(ColorDodgeBlendMode(uiImage: blendImage)))
        filters.append(Filter(DarkenBlendMode(uiImage: blendImage)))
        filters.append(Filter(DifferenceBlendMode(uiImage: blendImage)))
        filters.append(Filter(DivideBlendMode(uiImage: blendImage)))
        filters.append(Filter(ExclusionBlendMode(uiImage: blendImage)))
        filters.append(Filter(HardLightBlendMode(uiImage: blendImage)))
        filters.append(Filter(HueBlendMode(uiImage: blendImage)))
        filters.append(Filter(LightenBlendMode(uiImage: blendImage)))
        filters.append(Filter(LinearBurnBlendMode(uiImage: blendImage)))
        filters.append(Filter(OverlayBlendMode(uiImage: blendImage)))
        filters.append(Filter(ScreenBlendMode(uiImage: blendImage)))
        filters.append(Filter(SourceAtopCompositing(uiImage: blendImage)))
        filters.append(Filter(SourceOverCompositing(uiImage: blendImage)))
        
        // Distortion Effect
        
        filters.append(Filter(BumpDistortion(imageSize: size)))
        filters.append(Filter(CircleSplashDistortion(imageSize: size)))
        if #available(iOS 9.0, *) {
            filters.append(Filter(CircularWrap(imageSize: size)))
            filters.append(Filter(Droste(imageSize: size)))
            filters.append(Filter(DisplacementDistortion(image: blendImage)))
            filters.append(Filter(GlassDistortion(image: blendImage, imageSize: size)))
            filters.append(Filter(GlassLozenge(imageSize: size)))
            filters.append(Filter(StretchCrop(imageSize: size)))
            filters.append(Filter(TorusLensDistortion(imageSize: size)))
        }
        filters.append(Filter(HoleDistortion(imageSize: size)))
        filters.append(Filter(LightTunnel(imageSize: size)))
        filters.append(Filter(PinchDistortion(imageSize: size)))
        filters.append(Filter(TwirlDistortion(imageSize: size)))
        filters.append(Filter(VortexDistortion(imageSize: size)))
        
        // Generator
        
        filters.append(Filter(AztecCodeGenerator(message: "Cmg")))
        filters.append(Filter(CheckerboardGenerator(imageSize: size)))
        filters.append(Filter(Code128BarcodeGenerator(message: "Cmg")))
        filters.append(Filter(ConstantColorGenerator()))
        filters.append(Filter(QRCodeGenerator(message: "Cmg")))
        filters.append(Filter(RandomGenerator()))
        filters.append(Filter(StarShineGenerator(imageSize: size)))
        filters.append(Filter(StripesGenerator(imageSize: size)))
        if #available(iOS 9.0, *) {
            filters.append(Filter(LenticularHaloGenerator(imageSize: size)))
            filters.append(Filter(PDF417BarcodeGenerator(inputMessage: "Cmg", imageSize: size)))
            filters.append(Filter(SunbeamsGenerator(imageSize: size)))
        }
        
        // Geometry Adjustment
        
        filters.append(Filter(AffineTransform()))
        filters.append(Filter(Crop(imageSize: size)))
        filters.append(Filter(LanczosScaleTransform()))
        filters.append(Filter(PerspectiveCorrection(imageSize: size)))
        filters.append(Filter(PerspectiveTransform(imageSize: size)))
        filters.append(Filter(PerspectiveTransformWithExtent(imageSize: size)))
        filters.append(Filter(StraightenFilter()))
        
        // Gradient
        
        filters.append(Filter(GaussianGradient(imageSize: size)))
        filters.append(Filter(LinearGradient(imageSize: size)))
        filters.append(Filter(RadialGradient(imageSize: size)))
        filters.append(Filter(SmoothLinearGradient(imageSize: size)))
        
        // Halftone Effect
        
        filters.append(Filter(CircularScreen(imageSize: size)))
        if #available(iOS 9.0, *) {
            filters.append(Filter(CMYKHalftone(imageSize: size)))
        }
        filters.append(Filter(DotScreen(imageSize: size)))
        filters.append(Filter(HatchedScreen(imageSize: size)))
        filters.append(Filter(LineScreen(imageSize: size)))
        
        // Reduction
        
        if #available(iOS 9.0, *) {
            filters.append(Filter(AreaAverage(imageSize: size)))
            filters.append(Filter(RowAverage(imageSize: size)))
            filters.append(Filter(ColumnAverage(imageSize: size)))
            filters.append(Filter(HistogramDisplayFilter()))
            filters.append(Filter(AreaMaximum(imageSize: size)))
            filters.append(Filter(AreaMinimum(imageSize: size)))
            filters.append(Filter(AreaMaximumAlpha(imageSize: size)))
            filters.append(Filter(AreaMinimumAlpha(imageSize: size)))
        }
        
        // Sharpen
        
        filters.append(Filter(SharpenLuminance()))
        filters.append(Filter(UnsharpMask()))
        
        // Stylize
        
        filters.append(Filter(BlendWithAlphaMask(backgroundImage: blendImage, maskImage: maskImage)))
        filters.append(Filter(BlendWithMask(backgroundImage: maskImage, maskImage: blendImage)))
        filters.append(Filter(Convolution3X3()))
        filters.append(Filter(Convolution5X5()))
        filters.append(Filter(Convolution9Horizontal()))
        filters.append(Filter(Convolution9Vertical()))
        filters.append(Filter(Gloom()))
        filters.append(Filter(HighlightShadowAdjust()))
        filters.append(Filter(Pixellate(imageSize: size)))
        if #available(iOS 9.0, *) {
            filters.append(Filter(ComicEffect()))
            filters.append(Filter(Convolution7X7()))
            filters.append(Filter(Crystallize(imageSize: size)))
            filters.append(Filter(DepthOfField(imageSize: size)))
            filters.append(Filter(Edges()))
            filters.append(Filter(EdgeWork()))
            filters.append(Filter(HeightFieldFromMask()))
            filters.append(Filter(HexagonalPixellate(imageSize: size)))
            filters.append(Filter(LineOverlay()))
            filters.append(Filter(Pointillize(imageSize: size)))
            filters.append(Filter(ShadedMaterial(uiImage: blendImage)))
        }
        
        // Tile Effect
        
        filters.append(Filter(AffineClamp()))
        filters.append(Filter(AffineTile()))
        filters.append(Filter(EightfoldReflectedTile(imageSize: size)))
        filters.append(Filter(FourfoldReflectedTile(imageSize: size)))
        filters.append(Filter(FourfoldRotatedTile(imageSize: size)))
        filters.append(Filter(FourfoldTranslatedTile(imageSize: size)))
        filters.append(Filter(GlideReflectedTile(imageSize: size)))
        if #available(iOS 9.0, *) {
            filters.append(Filter(Kaleidoscope(imageSize: size)))
            filters.append(Filter(OpTile(imageSize: size)))
            filters.append(Filter(ParallelogramTile(imageSize: size)))
            filters.append(Filter(TriangleTile(imageSize: size)))
        }
        filters.append(Filter(PerspectiveTile(imageSize: size)))
        filters.append(Filter(SixfoldReflectedTile(imageSize: size)))
        filters.append(Filter(SixfoldRotatedTile(imageSize: size)))
        filters.append(Filter(TriangleKaleidoscope(imageSize: size)))
        filters.append(Filter(TwelvefoldReflectedTile(imageSize: size)))
        
        // Enhancement
        
        filters.append(Filter(AutoAdjustEnhance()))
        filters.append(Filter(AutoAdjustRedEye()))

        // Filter Group
        
        filters.append(
            Filter(FilterGroup(name: "FilterGroup1", [
                SepiaTone(),
                ColorControls(),
                PhotoEffectProcess(),
                ]
                )))
        filters.append(
            Filter(FilterGroup(name: "FilterGroup2", [
                ColorMonochrome(),
                HueAdjust(),
                LightenBlendMode(uiImage: blendImage),
                ]
                )))
        if #available(iOS 9.0, *) {
            filters.append(
                Filter(FilterGroup(name: "FilterGroup3", [
                    BoxBlur(),
                    Vignette(),
                    PhotoEffectMono(),
                    ]
                    )))
        }
        
        return filters
    }
}
