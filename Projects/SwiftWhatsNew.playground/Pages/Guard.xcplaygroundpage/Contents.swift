import Foundation

/*: ## Introducing Guard */

struct Article {
    var title: String?
    var description: String?
    var author: String?
    var totalWords: Int?
}

func printInfoOld(article: Article) {
    if let totalWords = article.totalWords where totalWords > 1000 {
        if let title = article.title {
            print("1. Title: \(title)")
        } else {
            print("1. Error: Couldn't print the title of the article!")
        }
    } else {
        print("1. Error: Couldn't print the total word count!")
    }
}

func printInfoNew(article: Article) {
    guard let totalWords = article.totalWords where totalWords > 1000 else {
        print("2. Error: Couldn't print the total word count!")
        
        return
    }
    
    guard let title = article.title else {
        print("2. Error: Couldn't print the title of the article!")
    
        return
    }
    
    print("2. Title: \(title)")
}

let sampleArticle = Article(title: "Swift Guide", description: "A beginner's guide to Swift 2", author: "Simon Ng", totalWords: 1500)
printInfoOld(sampleArticle)
printInfoNew(sampleArticle)
