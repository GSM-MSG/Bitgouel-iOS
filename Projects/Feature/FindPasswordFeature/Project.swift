import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.FindPasswordFeature.rawValue,
    targets: [
        .interface(module: .feature(.FindPasswordFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.FindPasswordFeature), dependencies: [
            .feature(target: .FindPasswordFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.FindPasswordFeature), dependencies: [
            .feature(target: .FindPasswordFeature)
        ])
    ]
)
