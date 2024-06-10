import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.SuccessChangePasswordFeature.rawValue,
    targets: [
        .interface(module: .feature(.SuccessChangePasswordFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.SuccessChangePasswordFeature), dependencies: [
            .feature(target: .SuccessChangePasswordFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.SuccessChangePasswordFeature), dependencies: [
            .feature(target: .SuccessChangePasswordFeature)
        ])
    ]
)
