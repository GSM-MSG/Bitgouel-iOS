import BaseFeature
import DesignSystem
import SwiftUI

struct SuccessSignUpView: View {
    @EnvironmentObject var sceneState: SceneState

    var body: some View {
        VStack {
            BitgouelIcon(.checkmarkOutline)
                .padding(.top, 233)

            Text("회원가입 완료")
                .bitgouelFont(.title2)
                .padding(.top, 24)

            Text("관리자의 승인을 기다려주세요!")
                .bitgouelFont(.text3, color: .greyscale(.g4))

            Spacer()

            BitgouelButton(
                text: "돌아가기"
            ) {
                sceneState.sceneFlow = .login
            }
            .cornerRadius(8)
            .padding(.horizontal, 28)
            .padding(.bottom, 46)
        }
        .navigationBarBackButtonHidden(true)
    }
}
