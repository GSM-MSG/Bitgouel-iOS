import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.SignupFeature.rawValue,
    targets: [
        .interface(module: .feature(.SignupFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.SignupFeature), dependencies: [
            .feature(target: .SignupFeature, type: .interface),
            .feature(target: .BaseFeature),
            .domain(target: .AuthDomain, type: .interface)
        ]),
        .tests(module: .feature(.SignupFeature), dependencies: [
            .feature(target: .SignupFeature)
        ])
    ]
)
