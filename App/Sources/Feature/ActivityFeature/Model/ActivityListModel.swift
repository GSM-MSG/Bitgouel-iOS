import Foundation
import Service

@MainActor
final class ActivityListModel: ObservableObject {
    @Published var authority: UserAuthorityType = .user
    @Published var content: [ActivityEntity] = []
    var errorMessage: String = ""
}

extension ActivityListModel {
    func updateUserRole(authority: UserAuthorityType) {
        self.authority = authority
    }

    func updateContent(entity: [ActivityEntity]) {
        self.content = entity
    }
}
