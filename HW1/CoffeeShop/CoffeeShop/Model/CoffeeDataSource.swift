//
//  CoffeeDataSource.swift
//  CoffeeShop
//
//  Created by BURAK on 16.11.2022.
//

import Foundation

struct CoffeeDataSource {
    private let coffeeArray: [Coffee]
        
        init() {
            coffeeArray = [
                Coffee(
                    imageName: "espresso",
                    coffeeName: "Espresso",
                    bitterness: "9.5 / 10",
                    flavor: "Sweet and acidic",
                    benefits: "Gives you instant high energy boost",
                    price: "$1.5"
                ),
                Coffee(
                    imageName: "ristretto",
                    coffeeName: "Ristretto",
                    bitterness: "9.9 / 10",
                    flavor: "Intense aroma by being concentrated espresso",
                    benefits: "Gives you instant extremely high energy boost",
                    price: "$1.75"
                ),
                Coffee(
                    imageName: "mocha",
                    coffeeName: "Mocha",
                    bitterness: "5 / 10",
                    flavor: "Basically just chocolate and coffee",
                    benefits: "Healthly liver, fighting depression",
                    price: "$2"
                ),
                Coffee(
                    imageName: "latte",
                    coffeeName: "Latte",
                    bitterness: "3 / 10",
                    flavor: "Basically just milk and coffee",
                    benefits: "Burning fat and prevent cardiovascular disorders",
                    price: "$2"
                ),
                Coffee(
                    imageName: "irish",
                    coffeeName: "Irish Coffee",
                    bitterness: "7 / 10",
                    flavor: "Sugar, Irish whiskey, and cream",
                    benefits: "Reduce heart risks",
                    price: "$3"
                ),
                Coffee(
                    imageName: "cappuccino",
                    coffeeName: "Cappuccino",
                    bitterness: "4 / 10",
                    flavor: "Basically just milk foam and coffee",
                    benefits: "Prevent stroke risk",
                    price: "$2"
                ),
                Coffee(
                    imageName: "greenbean",
                    coffeeName: "Green Bean Coffee",
                    bitterness: "4 / 10",
                    flavor: "Sugar, cardamom, honey, and water",
                    benefits: "Rich in antioxidants",
                    price: "$2.75"
                ),
                Coffee(
                    imageName: "arabica",
                    coffeeName: "Arabica Bean Coffee",
                    bitterness: "8 / 10",
                    flavor: "Sugar, cardamom, honey, and water",
                    benefits: "Regulates blood pressure",
                    price: "$1.5"
                ),
                Coffee(
                    imageName: "flatwhite",
                    coffeeName: "Flat White",
                    bitterness: "6 / 10",
                    flavor: "Steamed milk and medium level of espresso",
                    benefits: "Anti-ageing",
                    price: "$1.75"
                ),
                Coffee(
                    imageName: "cortado",
                    coffeeName: "Cortado",
                    bitterness: "5 / 10",
                    flavor: "Equal amount of Steamed milk and espresso",
                    benefits: "Prevents dizziness",
                    price: "$1.75"
                )
            ]
        }
        
        func getCoffee(with imageName: String) -> Coffee? {
            return coffeeArray.first { $0.imageName == imageName }
        }
    
        func getNumberOfCoffees() -> Int{
            return coffeeArray.count
        }
    
        func getCoffee(for index: Int) -> Coffee? {
            guard index < coffeeArray.count else {
                return nil
            }
            return coffeeArray[index]
        }
}
