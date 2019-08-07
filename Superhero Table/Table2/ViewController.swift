//
//  ViewController.swift
//  Table2
//
//  Created by Carly Palicz on 8/5/19.
//  Copyright © 2019 Carly Palicz. All rights reserved.
//

import UIKit
struct Superheroes: Decodable{
    let heroName: String
    let name: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var myTableView: UITableView!
    let jsonDataURL = "http://patrickhill.nyc/justiceleague.json"
    var superHeroArray = [Superheroes]()
    
    let superHeroes=["Batman", "Superman", "Flash"]
    let Age=[42, 32, 24]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getJsonFromURL()
        myTableView.delegate=self
        myTableView.dataSource=self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(superHeroArray.count)
        return superHeroArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=myTableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text=superHeroArray[indexPath.row].heroName
        cell?.detailTextLabel?.text=superHeroArray[indexPath.row].name
        //cell?.textLabel?.text=superHeroes[indexPath.row]
        //cell?.detailTextLabel?.text="\(Age[indexPath.row])"
        return cell!
    }
    
    func getJsonFromURL(){
        let url = URL(string:jsonDataURL)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                self.superHeroArray = try JSONDecoder().decode([Superheroes].self, from: data!)
            }
            catch let jsonErr{
                print("error", jsonErr)
            }
            OperationQueue.main.addOperation({
                self.showNames()
            })
        }
        .resume()
    }
    
    func showNames(){
        for hero in superHeroArray{
            print(hero.heroName)
            print(hero.name)
        }
        self.myTableView.reloadData()
    }
}

