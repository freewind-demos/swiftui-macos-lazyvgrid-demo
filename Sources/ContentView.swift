import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let color: Color
}

struct ContentView: View {
    let items = [
        Item(name: "首页", icon: "house.fill", color: .blue),
        Item(name: "设置", icon: "gearshape.fill", color: .gray),
        Item(name: "用户", icon: "person.fill", color: .green),
        Item(name: "消息", icon: "envelope.fill", color: .orange),
        Item(name: "收藏", icon: "star.fill", color: .yellow),
        Item(name: "照片", icon: "photo.fill", color: .pink),
        Item(name: "音乐", icon: "music.note", color: .purple),
        Item(name: "电影", icon: "film.fill", color: .red),
        Item(name: "书籍", icon: "book.fill", color: .indigo),
        Item(name: "地图", icon: "map.fill", color: .teal),
        Item(name: "相机", icon: "camera.fill", color: .mint),
        Item(name: "时钟", icon: "clock.fill", color: .cyan)
    ]

    // 定义网格列
    let columns = [
        GridItem(.flexible()),  // 自适应列宽
        GridItem(.flexible()),
        GridItem(.flexible())   // 三列
    ]

    // 固定列数
    let fixedColumns = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                // 自适应网格
                Text("自适应网格 (.flexible)")
                    .font(.headline)

                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(items) { item in
                        GridItemView(item: item)
                    }
                }

                Divider()

                // 固定列网格
                Text("固定宽度网格 (.fixed)")
                    .font(.headline)

                LazyVGrid(columns: fixedColumns, spacing: 16) {
                    ForEach(items) { item in
                        GridItemView(item: item)
                    }
                }

                Divider()

                // 不同尺寸的网格项
                Text("不同尺寸 (.adaptive)")
                    .font(.headline)

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 12) {
                    ForEach(items) { item in
                        GridItemView(item: item)
                    }
                }
            }
            .padding(20)
        }
    }
}

struct GridItemView: View {
    let item: Item

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: item.icon)
                .font(.title)
                .foregroundColor(item.color)

            Text(item.name)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}
