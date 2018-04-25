//
//  DataViewController.swift
//  testYoGoWo
//
//  Created by Sloven GRACIET on 4/25/18.
//  Copyright © 2018 Sloven GRACIET. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var CommentLabel: UILabel!
    @IBOutlet weak var coachLabel: UILabel!
    @IBOutlet weak var NumberParticipationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var currentSession : Session!
    var temperature : Double!
    var weather : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        typeLabel.text = currentSession.type?.name
        CommentLabel.text = currentSession.comments
        coachLabel.text = "coach: " + currentSession.coach.firstname!
        NumberParticipationLabel.text = String(currentSession.maximumPersons) + " participants maximum"
        dateLabel.text = formatter.string(from: currentSession.date)
        if currentSession.type?.name == "Pulse"{
            imageView.image = UIImage(named: "pulse")
        }
        else if currentSession.type?.name == "Pump"{
            imageView.image = UIImage(named: "pump")
        }
        else if currentSession.type?.name == "Burn"{
            imageView.image = UIImage(named: "burn")
        }
        weatherRequest()
    }

    
    func weatherRequest(){
        let lat = String(describing: currentSession.coordinates!.latitude!)
        let lon = String(describing: currentSession.coordinates!.longitude!)
        print(lat)
        print(lon)
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=6cdf02cc8752e0773876842e95606369")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            (data, responce, error) in
            if let err = error {
                print(err)
            }
            else if let d = data {
                do {
                    if let dic = try JSONSerialization.jsonObject(with: d, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any]{
                        print(dic)
                        print("=============================")
                        if let main = dic["main"] as? [String: Any] {
                            if let t = main["temp"]as? Double{
                                self.temperature = t - 273.15
                            }
                        }
                        if let w = dic["weather"] as? [Any] {
                            if let y = w[0] as? [String:Any]{
                                if let desc = y["description"] as? String{
                                    self.weather = desc
                                }
                            }
                        }
                        DispatchQueue.main.async {
                            self.temperatureLabel.text = "Temperature: " + String(describing: self.temperature!) + " C"
                            self.weatherLabel.text = "Weather : " + self.weather
                        }
                    }
                }
                catch (let err){
                    print(err)
                }
            }
        }
        task.resume()
    }
    
}
