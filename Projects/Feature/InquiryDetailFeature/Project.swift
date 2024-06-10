import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.InquiryDetailFeature.rawValue,
    targets: [
        .interface(module: .feature(.InquiryDetailFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.InquiryDetailFeature), dependencies: [
            .feature(target: .InquiryDetailFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.InquiryDetailFeature), dependencies: [
            .feature(target: .InquiryDetailFeature)
        ])
    ]
)
