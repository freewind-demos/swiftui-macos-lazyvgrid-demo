# SwiftUI macOS LazyVGrid 网格布局

## 简介

演示 SwiftUI 中 LazyVGrid 的用法，创建网格布局。

## 快速开始

```bash
cd swiftui-macos-lazyvgrid-demo
xcodegen generate
open SwiftUILazyVGridDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### GridItem 类型

```swift
GridItem(.flexible())      // 自适应
GridItem(.fixed(100))     // 固定宽度
GridItem(.adaptive(80))    // 自适应最小宽度
```

### LazyVGrid 用法

```swift
let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
]

LazyVGrid(columns: columns, spacing: 16) {
    ForEach(items) { item in
        ItemView()
    }
}
```

## 完整示例

```swift
struct ContentView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0..<10) { i in
                Text("项 \(i)")
                    .frame(height: 50)
                    .background(Color.gray.opacity(0.2))
            }
        }
    }
}
```

## 完整讲解（中文）

### GridItem 选项

- `.flexible()` - 占用可用空间的一等份
- `.fixed(100)` - 固定 100 点宽度
- `.adaptive(80)` - 自适应，最小 80 点

### LazyVGrid vs VStack + HStack

- LazyVGrid 按需加载，性能更好
- 适合大量网格项
- VStack + HStack 适合简单布局
