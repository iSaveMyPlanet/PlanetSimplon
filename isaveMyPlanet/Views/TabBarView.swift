import SwiftUI

struct ContentView: View {
    var body: some View {
     // Text("on test")
       Tabs()
}
}
struct Tabs: View {

    @State private var selected = 0
   init() {
    UITabBar.appearance().barTintColor = .systemGreen
    UITabBar.appearance().unselectedItemTintColor = UIColor.white
      }
    var body: some View {
        TabView(selection: $selected) {

            FilActualiteesView().tabItem {
                Image(systemName: "book")
                Text("Actualités")
            }.tag(0)
            ListEventView().navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
                .tabItem {
                    Image(systemName: "mappin.circle")
                    Text("Evénement")

                }.tag(1)
            MapView().navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
                .tabItem {
                    Image(systemName: "location")
                    Text("Carte")
            }.tag(2)
            FavorisView()
            .tabItem {
                 Image(systemName:  "star.fill")
                Text("Favoris")

            }.tag(3)

            QuizzView()
            .tabItem {
               Image(systemName: "gamecontroller")
                Text("Quizz")

            }.tag(4)


        }.accentColor(.blue)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
