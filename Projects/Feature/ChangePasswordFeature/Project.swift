import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.ChangePasswordFeature.rawValue,
    targets: [
        .interface(module: .feature(.ChangePasswordFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.ChangePasswordFeature), dependencies: [
            .feature(target: .ChangePasswordFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.ChangePasswordFeature), dependencies: [
            .feature(target: .ChangePasswordFeature)
        ])
    ]
)
