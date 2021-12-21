//
//  detailVC.swift
//  Pogoda
//
//  Created by user on 12.10.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class detailVC: UIViewController {

    var cityName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        currentWeather(city: cityName)

        let colorTop = UIColor(red: 89/255, green: 156/255, blue: 169/255, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        self.view.layer.addSublayer(gradientLayer)
    }
    func currentWeather(city: String){
       let url = " http://api.weatherapi.com/v1/current.json?key=052bcd78a5d746fcb9172243211210&q=\(city)"
       
        AF.request(url, method: .get).validate().responseJSON { response in switch response.result {
        case .success(let value):
            let json = JSON(value)
            let name = json["location"]["name"].stringValue
            let temp = json["current"]["temp_c"].doubleValue
            let country = json["location"]["country"].stringValue
            let weatherURLString = "http:\(json["location"][0]["icon"].stringValue)"
            
            self.cityNameLabel.text = name
            self.temp_c.text = String(temp)
            self.countryLabel.text = country
            
            let  weatherURL = URL(string: weatherURLString)
            if let data = try? Data(contentsOf: weatherURL!) {
                self.imageWeater.image = UIImage(data: data)
            }
           
        case .failure(let error):
            print(error)
        }
            
        }
    }
   
    

}
