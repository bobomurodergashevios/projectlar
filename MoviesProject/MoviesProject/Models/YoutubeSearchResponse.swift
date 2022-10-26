//
//  YoutubeSearchResponse.swift
//  MoviesProject
//
//  Created by Bobomurod Ergashev on 29/09/22.
//

import Foundation
//items =     (
//            {
//        etag = "yxwIXjTpcvIRki_cbbZYkz9CCnw";
//        id =             {
//            kind = "youtube#video";
//            videoId = 8bUvBABwNrY;
//        };
//        kind = "youtube#searchResult";
//    },

struct YoutubeSearchResults : Codable {
    let items : [VideoElement]
}


struct VideoElement : Codable {
    let id : IDVideoElement
}
struct IDVideoElement : Codable {
    let kind : String
    let videoId : String
}
