import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.StudentInfoFeature.rawValue,
    targets: [
        .interface(module: .feature(.StudentInfoFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.StudentInfoFeature), dependencies: [
            .feature(target: .StudentInfoFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.StudentInfoFeature), dependencies: [
            .feature(target: .StudentInfoFeature)
        ])
    ]
)
