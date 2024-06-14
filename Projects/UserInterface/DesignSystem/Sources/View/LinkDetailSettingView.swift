import SwiftUI

public struct LinkDetailSettingView: View {
    @State var links: [String]
    public let link: String
    public let dismiss: DismissAction
    public var applyButtonTapAction: ([String]) -> Void

    public init(
        links: [String],
        link: String,
        dismiss: DismissAction,
        applyButtonTapAction: @escaping ([String]) -> Void
    ) {
        _links = State(initialValue: links)
        self.link = link
        self.dismiss = dismiss
        self.applyButtonTapAction = applyButtonTapAction
    }

    public var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                HStack {
                    BitgouelText(
                        text: "링크 입력",
                        font: .text1
                    )

                    Spacer()
                }
                .padding(.top, 28)

                VStack {
                    linkRow()
                }
                .padding(.top, 8)

                Button {
                    links.append("")
                } label: {
                    HStack {
                        Text("링크 추가")

                        Spacer()

                        BitgouelIcon(.plus)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .foregroundColor(.bitgouel(.greyscale(.g10)))
                    .background(Color.bitgouel(.primary(.p5)))
                    .cornerRadius(8, corners: .allCorners)
                }
                .padding(.top, 8)
            }
            Spacer()

            BitgouelButton(
                text: "적용하기",
                style: .primary
            ) {
                applyButtonTapAction(links)
                dismiss()
            }
            .padding(.bottom, 12)
        }
    }

    @ViewBuilder
    func linkRow() -> some View {
        ForEach(links.indices, id: \.self) { index in
            BitgouelTextField(
                "링크 입력 (선택)",
                text: Binding(
                    get: { links[index] },
                    set: { newvalue in links[index] = newvalue }
                )
            )
        }
    }
}
