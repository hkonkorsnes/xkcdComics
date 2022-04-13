//
//  Comic.swift
//  xkcdComics
//
//  Created by Håkon Korsnes on 11/04/2022.
//

import Foundation

// Example response

// {
//   "month": "4",
//   "num": 2604,
//   "link": "",
//   "year": "2022",
//   "news": "",
//   "safe_title": "Frankenstein Captcha",
//   "transcript": "",
//   "alt": "The distinction between a ship and a boat is a line drawn in water.",
//   "img": "https://imgs.xkcd.com/comics/frankenstein_captcha.png",
//   "title": "Frankenstein Captcha",
//   "day": "8"
// }

struct Comic: Decodable {
    var month: String
    var num: Int
    var link: String
    var year: String
    var news: String
    var safeTitle: String
    var transcript: String
    var alt: String
    var img: URL
    var title: String
    var day: String
}
