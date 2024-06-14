import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.LoginFeature.rawValue,
    targets: [
        .interface(module: .feature(.LoginFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.LoginFeature), dependencies: [
            .feature(target: .LoginFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.LoginFeature), dependencies: [
            .feature(target: .LoginFeature)
        ])
    ]
)
