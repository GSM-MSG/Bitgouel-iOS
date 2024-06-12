import SwiftUI

public struct NoInfoView: View {
    public var text: String

    public init(
        text: String = "정보가 없어요"
    ) {
        self.text = text
    }

    public var body: some View {
        VStack {
            BitgouelIcon(.emptyBox, width: 72, height: 72)

            Text(text)
                .bitgouelFont(.text3, color: .greyscale(.g4))
        }
    }
}
