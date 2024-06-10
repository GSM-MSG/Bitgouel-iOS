import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.NewPasswordFeature.rawValue,
    targets: [
        .interface(module: .feature(.NewPasswordFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.NewPasswordFeature), dependencies: [
            .feature(target: .NewPasswordFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.NewPasswordFeature), dependencies: [
            .feature(target: .NewPasswordFeature)
        ])
    ]
)
