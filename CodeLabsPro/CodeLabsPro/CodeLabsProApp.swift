//

import SwiftUI

@main
struct CodeLabsProApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            // MeetingView()
            // CardView(scrum: DailyScrum.sampleData[0]).background(DailyScrum.sampleData[0].theme.mainColor)
            
            NavigationView {
                ScrumsView(scrums: $scrums)
                    .background(DailyScrum.sampleData[0].theme.mainColor)
            }
        }
    }
}
