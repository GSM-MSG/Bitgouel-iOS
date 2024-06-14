import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Shared.DateUtil.rawValue,
    targets: [
        .implements(module: .shared(.DateUtil)),
        .tests(module: .shared(.DateUtil), dependencies: [
            .shared(target: .DateUtil)
        ])
    ]
)
