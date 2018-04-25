//
//  ViewController.swift
//  testYoGoWo
//
//  Created by Sloven GRACIET on 4/24/18.
//  Copyright © 2018 Sloven GRACIET. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {

    var currentSession : Session?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 48.857193, longitude: 2.351859, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        view = mapView
        
        
        addSession()
        for session in sessionData.sessions{
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: (session.coordinates?.latitude)!, longitude: (session.coordinates?.longitude)!)
            marker.title = session.serverId
            marker.map = mapView
            if session.type?.name == "Pulse"{
                marker.icon = self.imageWithImage(image: UIImage(named: "pulse")!, scaledToSize: CGSize(width: 30.0, height: 30.0))
            }else if session.type?.name == "Burn"{
                marker.icon = self.imageWithImage(image: UIImage(named: "burn")!, scaledToSize: CGSize(width: 30.0, height: 30.0))
            }else if session.type?.name == "Pump"{
                marker.icon = self.imageWithImage(image: UIImage(named: "pump")!, scaledToSize: CGSize(width: 30.0, height: 30.0))
            }
        }

    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        for session in sessionData.sessions{
            if session.serverId == marker.title{
                self.currentSession = session
                performSegue(withIdentifier: "currentSessionSegue", sender: self)
            }
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "currentSessionSegue"{
            if let vc = segue.destination as? DataViewController {
                if let current = currentSession{
                  vc.currentSession = current
                }
            }
        }
    }
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    func init_session(session: Session, n: Int){
        
        let formatter = DateFormatter()
        let coach = Coach()
        let type = SessionType()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        switch n {
            case 0:
                session.serverId = "01"
                session.comments = "Seance cardio en fractionné"
                session.date = formatter.date(from: "2018/04/26 19:31")
                session.maximumPersons = 15
                session.coordinates = (2.311557, 48.854095)
                type.name = "Pulse"
                session.type = type
                coach.firstname = "Nadia"
                session.coach = coach
            case 1:
                session.serverId = "02"
                session.comments = "Renforcement musculaire"
                session.date = formatter.date(from: "2018/05/01 19:31")
                session.maximumPersons = 15
                session.coordinates = (2.327693, 48.863919)
                type.name = "Burn"
                session.type = type
                coach.firstname = "Alexis"
                session.coach = coach
            case 2:
                session.serverId = "03"
                session.comments = "Circuit training"
                session.date = formatter.date(from: "2018/04/26 18:31")
                session.maximumPersons = 15
                session.coordinates = (2.358789, 48.863360)
                type.name = "Pump"
                session.type = type
                coach.firstname = "Nadia"
                session.coach = coach
            case 3:
                session.serverId = "04"
                session.comments = "Circuit training"
                session.date = formatter.date(from: "2018/04/28 11:00")
                session.maximumPersons = 15
                session.coordinates = (2.319706, 48.891918)
                type.name = "Pump"
                session.type = type
                coach.firstname = "Pierre-Clement"
                session.coach = coach
            case 4:
                session.serverId = "05"
                session.comments = "Seance cardio en fractionné"
                session.date = formatter.date(from: "2018/04/29 18:31")
                session.maximumPersons = 15
                session.coordinates = (2.380903, 48.836074)
                type.name = "Pulse"
                session.type = type
                coach.firstname = "Lydia"
                session.coach = coach
            default:
                session.serverId = "00"
                session.comments = "Lorem ipsum parabellum"
                session.date = formatter.date(from: "2018/04/29 00:00")
                session.maximumPersons = 15
                session.coordinates = (2.294986, 48.856858)
                type.name = "Pulse"
                session.type = type
                coach.firstname = "YoGoWo"
                session.coach = coach
        }
    }
   
    func addSession(){
        init_session(session: sessionData.sessions[0], n: 0)
        init_session(session: sessionData.sessions[1], n: 1)
        init_session(session: sessionData.sessions[2], n: 2)
        init_session(session: sessionData.sessions[3], n: 3)
        init_session(session: sessionData.sessions[4], n: 4)
    }
    
   
}


