import SwiftUI

public struct BitgouelIcon: View {
    var icon: Icon
    var renderingMode: Image.TemplateRenderingMode
    var width: CGFloat?
    var height: CGFloat?

    public init(
        _ icon: Icon,
        renderingMode: Image.TemplateRenderingMode = .original,
        width: CGFloat? = 24,
        height: CGFloat? = 24
    ) {
        self.icon = icon
        self.renderingMode = renderingMode
        self.width = width
        self.height = height
    }

    public enum Icon: CaseIterable {
        case checkmark
        case checkmarkFill
        case checkmarkOutline
        case chevronDown
        case chevronLeft
        case chevronRight
        case chevronUp
        case emptyBox
        case exclamationmark
        case eye
        case eyeSlash
        case filter
        case filterFill
        case home
        case laptop
        case magnifyingglass
        case megaphone
        case message
        case messageFill
        case minusFill
        case people
        case person
        case personFill
        case person3Fill
        case plus
        case plusFill
        case questionmark
        case redXmarkFill
        case search
        case setting
        case verticalEllipsis
        case xmark
        case xmarkFill
    }

    public var body: some View {
        iconToImage()
            .resizable()
            .renderingMode(renderingMode)
            .frame(width: width, height: height)
    }

    // swiftlint: disable cyclomatic_complexity function_body_length
    private func iconToImage() -> Image {
        switch icon {
        case .checkmark:
            return DesignSystemAsset.Icons.checkmark.swiftUIImage

        case .checkmarkFill:
            return DesignSystemAsset.Icons.checkmarkFill.swiftUIImage

        case .checkmarkOutline:
            return DesignSystemAsset.Icons.checkmarkOutline.swiftUIImage

        case .chevronDown:
            return DesignSystemAsset.Icons.chevronDown.swiftUIImage

        case .chevronLeft:
            return DesignSystemAsset.Icons.chevronLeft.swiftUIImage

        case .chevronRight:
            return DesignSystemAsset.Icons.chevronRight.swiftUIImage

        case .chevronUp:
            return DesignSystemAsset.Icons.chevronUp.swiftUIImage

        case .emptyBox:
            return DesignSystemAsset.Icons.emptyBox.swiftUIImage

        case .exclamationmark:
            return DesignSystemAsset.Icons.exclamationmark.swiftUIImage

        case .eye:
            return DesignSystemAsset.Icons.eye.swiftUIImage

        case .eyeSlash:
            return DesignSystemAsset.Icons.eyeSlash.swiftUIImage

        case .filter:
            return DesignSystemAsset.Icons.filter.swiftUIImage

        case .filterFill:
            return DesignSystemAsset.Icons.filterFill.swiftUIImage

        case .home:
            return DesignSystemAsset.Icons.home.swiftUIImage

        case .laptop:
            return DesignSystemAsset.Icons.laptop.swiftUIImage

        case .magnifyingglass:
            return DesignSystemAsset.Icons.magnifyingglass.swiftUIImage

        case .megaphone:
            return DesignSystemAsset.Icons.megaphone.swiftUIImage

        case .message:
            return DesignSystemAsset.Icons.message.swiftUIImage

        case .messageFill:
            return DesignSystemAsset.Icons.messageFill.swiftUIImage

        case .minusFill:
            return DesignSystemAsset.Icons.minusFill.swiftUIImage

        case .people:
            return DesignSystemAsset.Icons.people.swiftUIImage

        case .person:
            return DesignSystemAsset.Icons.person.swiftUIImage

        case .personFill:
            return DesignSystemAsset.Icons.personFill.swiftUIImage

        case .person3Fill:
            return DesignSystemAsset.Icons.person3Fill.swiftUIImage

        case .plus:
            return DesignSystemAsset.Icons.plus.swiftUIImage

        case .plusFill:
            return DesignSystemAsset.Icons.plusFill.swiftUIImage

        case .questionmark:
            return DesignSystemAsset.Icons.questionmark.swiftUIImage

        case .redXmarkFill:
            return DesignSystemAsset.Icons.redXmarkFill.swiftUIImage

        case .search:
            return DesignSystemAsset.Icons.search.swiftUIImage

        case .setting:
            return DesignSystemAsset.Icons.setting.swiftUIImage

        case .verticalEllipsis:
            return DesignSystemAsset.Icons.verticalEllipsis.swiftUIImage

        case .xmark:
            return DesignSystemAsset.Icons.xmark.swiftUIImage

        case .xmarkFill:
            return DesignSystemAsset.Icons.xmarkFill.swiftUIImage
        }
    }
    // swiftlint:enable cyclomatic_complexity function_body_length
}
