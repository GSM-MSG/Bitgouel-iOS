import Foundation

public final class SceneState: ObservableObject {
    @Published public var sceneFlow: SceneFlow

    public init(sceneFlow: SceneFlow) {
        self.sceneFlow = sceneFlow
    }
}
