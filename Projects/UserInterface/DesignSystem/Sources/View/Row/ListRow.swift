import DateUtil
import SwiftUI

public struct ListRow: View {
    let id: String
    let title: String
    let modifiedAt: Date

    public init(
        id: String,
        title: String,
        modifiedAt: Date
    ) {
        self.id = id
        self.title = title
        self.modifiedAt = modifiedAt
    }

    public var body: some View {
        VStack(spacing: 12) {
            Spacer()

            HStack {
                BitgouelText(
                    text: title,
                    font: .text1
                )

                Spacer()
            }

            HStack(spacing: 0) {
                BitgouelText(
                    text: modifiedAt.toStringCustomFormat(format: "yyyy.M.dd"),
                    font: .caption
                )

                BitgouelText(
                    text: "에 게시",
                    font: .caption
                )

                Spacer()
            }
            .foregroundColor(.bitgouel(.greyscale(.g7)))

            Spacer()
        }
        .padding(.vertical, 8)
    }
}
