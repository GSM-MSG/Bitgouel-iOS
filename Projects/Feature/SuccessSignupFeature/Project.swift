import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.SuccessSignupFeature.rawValue,
    targets: [
        .interface(module: .feature(.SuccessSignupFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.SuccessSignupFeature), dependencies: [
            .feature(target: .SuccessSignupFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.SuccessSignupFeature), dependencies: [
            .feature(target: .SuccessSignupFeature)
        ])
    ]
)
