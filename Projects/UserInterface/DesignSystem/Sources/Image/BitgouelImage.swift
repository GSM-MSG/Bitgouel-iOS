import SwiftUI

public struct BitgouelImage: View {
    public enum Image {
        // swiftlint: disable identifier_name
        case dongilHighSchoolOfFutureScienceHighSchool
        case EVEDI
        case GIGA
        case gwangjuEducationLogo
        case gwangjuEducationText
        case gwangjuLogo
        case gwangjuText
        case gwangjuAutomaticEquipmentTechnicalHighSchool
        case gwangjuElectronicTechnicalHighSchool
        case gwangjuGirlsCommercialHighSchool
        case gwangjuNaturalScienceHighSchool
        case gwangjuSoftwareMeisterHighSchool
        case gwangjuTechnicalHighSchool
        case jeonnamGirlsCommercialHighSchool
        case jeonnamTechnicalHighSchool
        case klda
        case kumpaTechnicalHighSchool
        case mainpageImage1
        case mainpageImage2
        case mainpageImage3
        case mainpageImage4
        case mainpageImage5
        case mainpageImage6
        case mainpageImage7
        case mainpageImage8
        case mainpageImage9
        case mainpageImage10
        case mainpageImage11
        case seojinGirlsHighSchool
        case smhrd
        case songwonGirlsCommercialHighSchool
        case sunguiScienceTechnologyHighSchool
    }
    // swiftlint: enable identifier_name

    private var image: Image
    private var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode = .original
    ) {
        self.image = image
        self.renderingMode = renderingMode
    }

    public var body: some View {
        bitgouelImageToImage()
            .resizable()
            .renderingMode(renderingMode)
    }

    // swiftlint: disable cyclomatic_complexity function_body_length
    private func bitgouelImageToImage() -> SwiftUI.Image {
        switch image {
        case .dongilHighSchoolOfFutureScienceHighSchool:
            return DesignSystemAsset.Images.dongilHighSchoolOfFutureScienceHighSchool.swiftUIImage

        case .EVEDI:
            return DesignSystemAsset.Images.evedi.swiftUIImage

        case .GIGA:
            return DesignSystemAsset.Images.giga.swiftUIImage

        case .gwangjuEducationLogo:
            return DesignSystemAsset.Images.gwangjuEducationLogo.swiftUIImage

        case .gwangjuEducationText:
            return DesignSystemAsset.Images.gwangjuEducationText.swiftUIImage

        case .gwangjuLogo:
            return DesignSystemAsset.Images.gwangjuLogo.swiftUIImage

        case .gwangjuText:
            return DesignSystemAsset.Images.gwangjuText.swiftUIImage

        case .gwangjuAutomaticEquipmentTechnicalHighSchool:
            return DesignSystemAsset.Images.gwangjuAutomaticEquipmentTechnicalHighSchool.swiftUIImage

        case .gwangjuElectronicTechnicalHighSchool:
            return DesignSystemAsset.Images.gwangjuElectronicTechnicalHighSchool.swiftUIImage

        case .gwangjuGirlsCommercialHighSchool:
            return DesignSystemAsset.Images.gwangjuGirlsCommercialHighSchool.swiftUIImage

        case .gwangjuNaturalScienceHighSchool:
            return DesignSystemAsset.Images.gwangjuNaturalScienceHighSchool.swiftUIImage

        case .gwangjuSoftwareMeisterHighSchool:
            return DesignSystemAsset.Images.gwangjuSoftwareMeisterHighSchool.swiftUIImage

        case .gwangjuTechnicalHighSchool:
            return DesignSystemAsset.Images.gwangjuTechnicalHighSchool.swiftUIImage

        case .jeonnamGirlsCommercialHighSchool:
            return DesignSystemAsset.Images.jeonnamGirlsCommercialHighSchool.swiftUIImage

        case .jeonnamTechnicalHighSchool:
            return DesignSystemAsset.Images.jeonnamTechnicalHighSchool.swiftUIImage

        case .klda:
            return DesignSystemAsset.Images.klda.swiftUIImage

        case .kumpaTechnicalHighSchool:
            return DesignSystemAsset.Images.kumpaTechnicalHighSchool.swiftUIImage

        case .mainpageImage1:
            return DesignSystemAsset.Images.mainpageImage1.swiftUIImage

        case .mainpageImage2:
            return DesignSystemAsset.Images.mainpageImage2.swiftUIImage

        case .mainpageImage3:
            return DesignSystemAsset.Images.mainpageImage3.swiftUIImage

        case .mainpageImage4:
            return DesignSystemAsset.Images.mainpageImage4.swiftUIImage

        case .mainpageImage5:
            return DesignSystemAsset.Images.mainpageImage5.swiftUIImage

        case .mainpageImage6:
            return DesignSystemAsset.Images.mainpageImage6.swiftUIImage

        case .mainpageImage7:
            return DesignSystemAsset.Images.mainpageImage7.swiftUIImage

        case .mainpageImage8:
            return DesignSystemAsset.Images.mainpageImage8.swiftUIImage

        case .mainpageImage9:
            return DesignSystemAsset.Images.mainpageImage9.swiftUIImage

        case .mainpageImage10:
            return DesignSystemAsset.Images.mainpageImage10.swiftUIImage

        case .mainpageImage11:
            return DesignSystemAsset.Images.mainpageImage11.swiftUIImage

        case .seojinGirlsHighSchool:
            return DesignSystemAsset.Images.seojinGirlsHighSchool.swiftUIImage

        case .smhrd:
            return DesignSystemAsset.Images.smhrd.swiftUIImage

        case .songwonGirlsCommercialHighSchool:
            return DesignSystemAsset.Images.songwonGirlsCommercialHighSchool.swiftUIImage

        case .sunguiScienceTechnologyHighSchool:
            return DesignSystemAsset.Images.sunguiScienceTechnologyHighSchool.swiftUIImage
        }
    }
    // swiftlint: enable cyclomatic_complexity function_body_length
}
