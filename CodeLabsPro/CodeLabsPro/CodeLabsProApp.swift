//

import SwiftUI

@main
struct CodeLabsProApp: App {
    
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
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
                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                            
                        }
                    }
                }
            }
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                store.scrums = DailyScrum.sampleData
            }) { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
