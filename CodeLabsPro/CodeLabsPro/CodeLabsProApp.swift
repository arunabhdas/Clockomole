//

import SwiftUI

@main
struct CodeLabsProApp: App {
    var body: some Scene {
        WindowGroup {
            // MeetingView()
            // CardView(scrum: DailyScrum.sampleData[0]).background(DailyScrum.sampleData[0].theme.mainColor)
            
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData).background(DailyScrum.sampleData[0].theme.mainColor)
            }
        }
    }
}
