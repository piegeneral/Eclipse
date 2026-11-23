
import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    private let purple = Color(
        red: 0.58,
        green: 0.32,
        blue: 0.95
    )

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(purple: purple)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)

            DeviceView(purple: purple)
                .tabItem {
                    Label("Device", systemImage: "iphone")
                }
                .tag(1)

            SettingsView(purple: purple)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(2)
        }
        .tint(purple)
        .preferredColorScheme(.dark)
    }
}

struct HomeView: View {
    let purple: Color

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 22) {
                Text("ECLIPSE")
                    .font(.largeTitle.bold())
                    .foregroundStyle(purple)

                Text("Welcome to Eclipse.")
                    .font(.title2.bold())

                Text("Your device. Your dashboard.")
                    .foregroundStyle(.secondary)

                GroupBox("Eclipse Status") {
                    Label("Application ready", systemImage: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                }

                GroupBox("Device") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(UIDevice.current.model)
                        Text("iOS \(UIDevice.current.systemVersion)")
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

struct DeviceView: View {
    let purple: Color

    var body: some View {
        NavigationStack {
            List {
                Section("Device Information") {
                    LabeledContent("Model", value: UIDevice.current.model)
                    LabeledContent("System", value: UIDevice.current.systemName)
                    LabeledContent("Version", value: UIDevice.current.systemVersion)
                    LabeledContent("Name", value: UIDevice.current.name)
                }

                Section("Capabilities") {
                    Label("Device information", systemImage: "iphone")
                    Label("SwiftUI interface", systemImage: "swift")
                }
            }
            .navigationTitle("Device")
        }
    }
}

struct SettingsView: View {
    let purple: Color
    @State private var accentEnabled = true

    var body: some View {
        NavigationStack {
            Form {
                Section("Appearance") {
                    Toggle("Purple Accent", isOn: $accentEnabled)
                        .tint(purple)
                }

                Section("About") {
                    LabeledContent("Application", value: "Eclipse")
                    LabeledContent("Version", value: "1.0")
                    LabeledContent("Developer", value: "piegeneral")
                }
            }
            .navigationTitle("Settings")
        }
    }
}
