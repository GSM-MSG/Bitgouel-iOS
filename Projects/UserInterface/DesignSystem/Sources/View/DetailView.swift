import SwiftUI

public struct DetailView: View {
    public let title: String
    public let content: String
    public let links: [String]
    public let writtenBy: Bool
    public let deleteAction: () -> Void
    public let editAction: () -> Void
    @Binding public var isDelete: Bool

    public init(
        title: String,
        content: String,
        links: [String],
        writtenBy: Bool,
        deleteAction: @escaping () -> Void,
        editAction: @escaping () -> Void,
        isDelete: Binding<Bool>
    ) {
        self.title = title
        self.content = content
        self.links = links
        self.writtenBy = writtenBy
        self.deleteAction = deleteAction
        self.editAction = editAction
        self._isDelete = isDelete
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading) {
                BitgouelText(
                    text: title,
                    font: .text1
                )
                .padding(.top, 4)
            }

            Divider()

            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    BitgouelText(
                        text: content,
                        font: .caption
                    )

                    if !links.isEmpty {
                        Divider()

                        relatedLinkRow()
                    }
                }
            }

            if writtenBy {
                popupButton()
            }
        }
        .padding(.horizontal, 28)
        .bitgouelAlert(
            title: "게시글을 삭제하시겠습니까?",
            description: content,
            isShowing: $isDelete,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    isDelete = false
                },
                .init(text: "삭제", style: .error) {
                    deleteAction()
                }
            ]
        )
    }

    @ViewBuilder
    func relatedLinkRow() -> some View {
        VStack(alignment: .leading) {
            BitgouelText(
                text: "관련 링크 보기",
                font: .text1
            )

            VStack(alignment: .leading, spacing: 4) {
                ForEach(links, id: \.self) { link in
                    if let url = URL(string: link) {
                        Link(
                            destination: url,
                            label: {
                                BitgouelText(
                                    text: "\(url)",
                                    font: .caption
                                )
                            }
                        )
                    }
                }
            }
        }
    }

    @ViewBuilder
    func popupButton() -> some View {
        HStack {
            BitgouelButton(
                text: "수정하기",
                style: .primary,
                action: {
                    editAction()
                }
            )

            Spacer()

            BitgouelButton(
                text: "삭제하기",
                style: .error,
                action: {
                    isDelete = true
                }
            )
        }
    }
}
