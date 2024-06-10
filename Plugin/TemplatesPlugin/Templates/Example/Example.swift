import ProjectDescription

private let layerAttribute = Template.Attribute.required("layer")
private let nameAttribute = Template.Attribute.required("name")

private let template = Template(
    description: "A template for a new module's example target",
    attributes: [
        layerAttribute,
        nameAttribute
    ],
    items: [
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Example/Sources/AppDelegate.swift",
            templatePath: "ExampleSources.stencil"
        ),
        .file(
            path: "Projects/\(layerAttribute)/\(nameAttribute)/Example/Resources/LaunchScreen.storyboard",
            templatePath: "ExampleResources.stencil"
        )
    ]
)
