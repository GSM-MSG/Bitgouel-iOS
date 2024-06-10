import SwiftUI

struct BitgouelBackButtonModifier: ViewModifier {
    let dismiss: DismissAction
    let willDismiss: () -> Void

    init(
        dismiss: DismissAction,
        willDismiss: @escaping () -> Void = {}
    ) {
        self.dismiss = dismiss
        self.willDismiss = willDismiss
    }

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        willDismiss()
                        dismiss()
                    } label: {
                        BitgouelIcon(.chevronLeft)
                            .foregroundColor(.bitgouel(.primary(.p5)))

                        Text("돌아가기")
                            .foregroundColor(.bitgouel(.primary(.p5)))
                            .font(.bitgouel(.text2))
                    }
                }
            }
    }
}

public extension View {
    func bitgouelBackButton(
        dismiss: DismissAction,
        willDismiss: @escaping () -> Void = {}
    ) -> some View {
        self
            .modifier(BitgouelBackButtonModifier(dismiss: dismiss, willDismiss: willDismiss))
    }
}
