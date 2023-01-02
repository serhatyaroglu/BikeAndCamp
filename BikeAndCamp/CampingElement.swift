//
//  SimpleData.swift
//  BikeAndCamp
//
//  Created by serhat yaroglu on 21.11.2022.
//

import Foundation
import Alamofire

// MARK: - CampingElement

class CampingElement: Codable {
    let id: Int?
    let guidKey, languageCode, name, title: String?
    let highLightText, description, text, summary: String?
    let properties: [Property]?

    enum CodingKeys: String, CodingKey {
        case id, guidKey, languageCode, name, title, highLightText
        case description = "description"
        case text, summary, properties
    }

    init(id: Int?, guidKey: String?, languageCode: String?, name: String?, title: String?, highLightText: String?, description: String?, text: String?, summary: String?, properties: [Property]?) {
        self.id = id
        self.guidKey = guidKey
        self.languageCode = languageCode
        self.name = name
        self.title = title
        self.highLightText = highLightText
        self.description = description
        self.text = text
        self.summary = summary
        self.properties = properties
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseProperty { response in
//     if let property = response.result.value {
//       ...
//     }
//   }

// MARK: - Property
class Property: Codable {
    let id: Int?
    let guidKey, languageCode, name: String?

    init(id: Int?, guidKey: String?, languageCode: String?, name: String?) {
        self.id = id
        self.guidKey = guidKey
        self.languageCode = languageCode
        self.name = name
    }
}

typealias Camping = [CampingElement]
// MARK: - Marvel
class Marvel: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: DataClass?

    init(code: Int?, status: String?, copyright: String?, attributionText: String?, attributionHTML: String?, etag: String?, data: DataClass?) {
        self.code = code
        self.status = status
        self.copyright = copyright
        self.attributionText = attributionText
        self.attributionHTML = attributionHTML
        self.etag = etag
        self.data = data
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDataClass { response in
//     if let dataClass = response.result.value {
//       ...
//     }
//   }

// MARK: - DataClass
class DataClass: Codable {
    let offset, limit, total, count: Int?
    let results: [Result]?

    init(offset: Int?, limit: Int?, total: Int?, count: Int?, results: [Result]?) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseResult { response in
//     if let result = response.result.value {
//       ...
//     }
//   }

// MARK: - Result
class Result: Codable {
    let id: Int?
    let name, resultDescription: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics, series: Comics?
    let stories: Stories?
    let events: Comics?
    let urls: [URLElement]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }

    init(id: Int, name: String, resultDescription: String, modified: String?, thumbnail: Thumbnail, resourceURI: String, comics: Comics, series: Comics, stories: Stories, events: Comics, urls: [URLElement]) {
        self.id = id
        self.name = name
        self.resultDescription = resultDescription
        self.modified = modified
        self.thumbnail = thumbnail
        self.resourceURI = resourceURI
        self.comics = comics
        self.series = series
        self.stories = stories
        self.events = events
        self.urls = urls
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseComics { response in
//     if let comics = response.result.value {
//       ...
//     }
//   }

// MARK: - Comics
class Comics: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
    let returned: Int?

    init(available: Int?, collectionURI: String?, items: [ComicsItem]?, returned: Int?) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseComicsItem { response in
//     if let comicsItem = response.result.value {
//       ...
//     }
//   }

// MARK: - ComicsItem
class ComicsItem: Codable {
    let resourceURI: String?
    let name: String?

    init(resourceURI: String?, name: String?) {
        self.resourceURI = resourceURI
        self.name = name
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseStories { response in
//     if let stories = response.result.value {
//       ...
//     }
//   }

// MARK: - Stories
class Stories: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
    let returned: Int?

    init(available: Int?, collectionURI: String?, items: [StoriesItem]?, returned: Int?) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseStoriesItem { response in
//     if let storiesItem = response.result.value {
//       ...
//     }
//   }

// MARK: - StoriesItem
class StoriesItem: Codable {
    let resourceURI: String?
    let name: String?
    let type: ItemType?

    init(resourceURI: String?, name: String?, type: ItemType?) {
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }
}

enum ItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseThumbnail { response in
//     if let thumbnail = response.result.value {
//       ...
//     }
//   }

// MARK: - Thumbnail
class Thumbnail: Codable {
    let path: String?
    let thumbnailImageExtension : String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailImageExtension = "extension"
    }

    init(path: String?, thumbnailImageExtension:String?) {
        self.path = path
        self.thumbnailImageExtension = thumbnailImageExtension
    }
}



//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseURLElement { response in
//     if let uRLElement = response.result.value {
//       ...
//     }
//   }

// MARK: - URLElement
class URLElement: Codable {
    let type: URLType?
    let url: String?

    init(type: URLType?, url: String?) {
        self.type = type
        self.url = url
    }
}

enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}
class Yemekler :Codable{

    var  yemek_id:String?
    var  yemek_adi:String?
    var  yemek_resim_adi:String?
    var  yemek_fiyat:String?
    var  kullanici_adi:String?

    init (){}

    init(yemek_id:String,yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,kullanici_adi:String?) {
        self.yemek_id = yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
        self.kullanici_adi = kullanici_adi
    }
}
