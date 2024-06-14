import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.InquiryListFeature.rawValue,
    targets: [
        .interface(module: .feature(.InquiryListFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.InquiryListFeature), dependencies: [
            .feature(target: .InquiryListFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.InquiryListFeature), dependencies: [
            .feature(target: .InquiryListFeature)
        ])
    ]
)
