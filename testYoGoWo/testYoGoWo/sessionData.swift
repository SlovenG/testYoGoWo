//
//  sessionData.swift
//  testYoGoWo
//
//  Created by Sloven GRACIET on 4/24/18.
//  Copyright © 2018 Sloven GRACIET. All rights reserved.
//

import Foundation


struct sessionData{
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    
    static let sessions : [Session] = [
        Session(date: formatter.date(from: "2018/04/27 18:31"), comments: "comments1", coordinates: (48.852518, 2.299230))
        Session(date: formatter.date(from: "2018/04/28 17:31"), comments: "comments2", coordinates: (48.852518, 2.299230))
        Session(date: formatter.date(from: "2018/04/29 16:31"), comments: "comments3", coordinates: (48.852518, 2.299230))
        Session(date: formatter.date(from: "2018/04/26 15:31"), comments: "comments4", coordinates: (48.852518, 2.299230))
        Session(date: formatter.date(from: "2018/04/25 19:31"), comments: "comments5", coordinates: (48.852518, 2.299230))
    ]
}


struct locationData {
    
    static let locations: [PinAnnotation] = [
        PinAnnotation(title: "42", subtitle: "ecole de OUF", coordinate: CLLocationCoordinate2DMake(48.8966088, 2.3174067)),
        PinAnnotation(title: "StOuen", subtitle: "Drog Cartel", coordinate: CLLocationCoordinate2DMake(48.9118187, 2.3153474)),
        PinAnnotation(title: "Tokyo", subtitle: "Japan Capital", coordinate: CLLocationCoordinate2DMake(35.6693077, 139.6713414)),
        PinAnnotation(title: "Moscou", subtitle: "Russian Capital", coordinate: CLLocationCoordinate2DMake(55.6856898, 37.5608168)),
        ]
}
