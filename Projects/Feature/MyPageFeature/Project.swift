import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.MyPageFeature.rawValue,
    targets: [
        .interface(module: .feature(.MyPageFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.MyPageFeature), dependencies: [
            .feature(target: .MyPageFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.MyPageFeature), dependencies: [
            .feature(target: .MyPageFeature)
        ])
    ]
)
