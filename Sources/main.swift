import Cocoa

@main
struct LazyVGridApp: App {
    var body: some Scene {
        Window("LazyVGrid 网格布局", id: "main") {
            ContentView()
        }
        .defaultSize(width: 500, height: 500)
    }
}
