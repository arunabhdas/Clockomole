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
                    ScrumStore.save(scrums: store.scrums) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            .onAppear {
                ScrumStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let scrums):
                        store.scrums = scrums
                    }
                }
            }
        }
    }
}
