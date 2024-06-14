import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.MainFeature.rawValue,
    targets: [
        .interface(module: .feature(.MainFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.MainFeature), dependencies: [
            .feature(target: .MainFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.MainFeature), dependencies: [
            .feature(target: .MainFeature)
        ])
    ]
)
