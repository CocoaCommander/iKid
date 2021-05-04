//
//  ContentView.swift
//  iKid
//
//  Created by Ryan Lee on 5/3/21.
//

import SwiftUI

struct ContentView: View {
    
    struct Joke {
        var question: String
        var punchline: String
    }
    
    var jokeContainer: [String : Joke] = [
        "GoodJoke" : Joke(question: "What's red and bad for your teeth?", punchline: "A brick!"),
        "Pun" : Joke(question: "What did the lamp say after its workout?", punchline: "Geez I sure am feeling a little lighter!"),
        "DadJoke" : Joke(question: "My wife said I should do lunges to stay in shape.", punchline: "That would be a big step forward.")
    ]
    
    var body: some View {
        TabView {
            JokeView(
                question:
                    self
                    .jokeContainer["GoodJoke"]!
                    .question,
                punchline:
                    self
                    .jokeContainer["GoodJoke"]!
                    .punchline
            )
                .tabItem {
                    Label("Good", systemImage: "1.square.fill")
                }
            JokeView(
                question:
                    self
                    .jokeContainer["Pun"]!
                    .question,
                punchline:
                    self
                    .jokeContainer["Pun"]!
                    .punchline
            )

                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Pun")
                }
            JokeView(
                question:
                    self
                    .jokeContainer["DadJoke"]!
                    .question,
                punchline:
                    self
                    .jokeContainer["DadJoke"]!
                    .punchline
            )

                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Dad")
                }
        }
        .font(.headline)
    }
}

struct JokeView: View {
    @State private var nextClicked: Bool = false
    @State var question: String
    @State var punchline: String
    
    func btnNextWasClicked() {
        self.nextClicked = !self.nextClicked
    }
    
    func showPunchline() -> Text {
        return (self.nextClicked ? Text(self.punchline) : Text(self.question))
    }
    
    var body: some View {
        VStack {
            showPunchline().padding()
            Button("Next", action: btnNextWasClicked)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
