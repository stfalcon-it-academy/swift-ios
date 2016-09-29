//: Playground - noun: a place where people can play
//: [NSTimeZone](https://littlebitesofcocoa.com/66-nstimezone)


import UIKit

let input = "2015-08-24T09:42:00" // came from HTTP API
var timesTempLabel = UILabel()

let formatter = NSDateFormatter()
let GMTTZ = NSTimeZone(forSecondsFromGMT: 0)

let localTZ = NSTimeZone.localTimeZone()
localTZ.secondsFromGMT // -25200
localTZ.abbreviation // "PDT"
localTZ.name

localTZ.localizedName(.DaylightSaving, locale: NSLocale.currentLocale())

formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
formatter.timeZone = GMTTZ

if let date = formatter.dateFromString(input) {
    formatter.timeZone = localTZ
    formatter.dateFormat = "MMMM d, H:mm a"
    
    timesTempLabel.text = formatter.stringFromDate(date)
    print(timesTempLabel.text!)
}
