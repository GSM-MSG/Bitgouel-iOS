import DesignSystem
import SwiftUI

struct PickerTextField: View {
    var placeholder: String
    var text: String
    var action: () -> Void

    init(
        _ placeholder: String,
        text: String,
        action: @escaping () -> Void
    ) {
        self.placeholder = placeholder
        self.text = text
        self.action = action
    }

    var body: some View {
        HStack {
            Text(text)
                .bitgouelFont(.text3)
                .foregroundColor(Color.bitgouel(.greyscale(.g0)))
                .padding(.horizontal, 20)

            Spacer()
        }
        .padding(.vertical, 16)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.bitgouel(.greyscale(.g7)))
            if text.isEmpty {
                HStack {
                    Text(placeholder)
                        .bitgouelFont(.text3)
                        .foregroundColor(.bitgouel(.greyscale(.g4)))
                        .padding(.horizontal, 20)

                    Spacer()
                }
                .padding(.vertical, 16)
            }
        }
        .buttonWrapper(action)
    }
}
