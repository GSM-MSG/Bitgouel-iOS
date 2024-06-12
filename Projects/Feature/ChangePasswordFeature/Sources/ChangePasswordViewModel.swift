import BaseFeature
import Foundation
import UserDomainInterface

final class ChangePasswordViewModel: BaseViewModel {
    @Published var currentPassword: String = ""
    @Published var newPassword: String = ""
    @Published var checkNewPassword: String = ""
    @Published var isPresentedSuccessView: Bool = false

    private let changePasswordUseCase: any ChangePasswordUseCase

    init(changePasswordUseCase: any ChangePasswordUseCase) {
        self.changePasswordUseCase = changePasswordUseCase
    }

    func updateIsPresentedSuccessView(isPresented: Bool) {
        isPresentedSuccessView = isPresented
    }

    @MainActor
    func changePasswordButtonDidTap() {
        guard newPassword == checkNewPassword else {
            errorMessage = "비밀번호를 다시 입력해 주세요!"
            return isErrorOccurred = true
        }

        Task {
            do {
                try await changePasswordUseCase(
                    req: ChangePasswordRequestDTO(
                        currentPassword: currentPassword,
                        newPassword: newPassword
                    )
                )

                updateIsPresentedSuccessView(isPresented: true)
            } catch {
                errorMessage = error.userDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
