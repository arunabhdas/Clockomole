//

import SwiftUI

@main
struct CodeLabsProApp: App {
    
    @StateObject private var store = ScrumStore()
    var body: some Scene {
        WindowGroup {
            // MeetingView()
            // CardView(scrum: DailyScrum.sampleData[0]).background(DailyScrum.sampleData[0].theme.mainColor)
            
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums)
                            
                        } catch {
                            fatalError("Error saving scrums.")
                            
                        }
                    }
                }
            }
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    fatalError("Error loading scrums.")
                }
            }
        }
    }
}
