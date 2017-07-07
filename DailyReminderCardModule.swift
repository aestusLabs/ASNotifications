//
//  DailyReminderCardModule.swift
//  breathe by aestus.health
//
//  Created by Ian Kohlert on 2017-07-07.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation
import UIKit

class DailyReminderCard: UIView {
    
    var helperBackground = UIView()
    var helperText = UILabel()
    var mondayCircle = Circle()
    var tuesdayCircle = Circle()
    var wednesdayCircle = Circle()
    var thursdayCircle = Circle()
    var fridayCircle = Circle()
    var saturdayCircle = Circle()
    var sundayCircle = Circle()
    var changeTimeButton = ASButton()
    var m = UILabel()
    var t = UILabel()
    var w = UILabel()
    var th = UILabel()
    var f = UILabel()
    var s = UILabel()
    var su = UILabel()
    
    var unselectedCircledColour = UIColor(red: 0.925490196, green: 0.925490196, blue: 0.925490196, alpha: 1.0)
    var circleActiveColour = UIColor.black
    var textActiveColour = UIColor.white
    
    var arrayOfCircles: [Circle] = []
    var arrayOfLetters: [UILabel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = appColours.getHelperSuggestionColour()
        self.layer.cornerRadius = 3
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowRadius = 4
        
        helperBackground = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 35))
        helperBackground.backgroundColor = appColours.getBehindHelperTextHomeBackground()
        self.addSubview(helperBackground)
        
        let helperCircle = HelperCircle(frame: CGRect(x: 15, y: 5, width: 20, height: 20))
        self.addSubview(helperCircle)
        
        helperText = UILabel(frame: CGRect(x: 50, y: 10, width: self.frame.width - 60, height: 30))
        helperText.font = UIFont.monospacedDigitSystemFont(ofSize: 18, weight: UIFontWeightMedium)
        self.addSubview(helperText)
        
        helperCircle.center.y = helperBackground.center.y
        helperText.center.y = helperBackground.center.y

        arrayOfCircles = [mondayCircle, tuesdayCircle, wednesdayCircle, thursdayCircle, fridayCircle, saturdayCircle, sundayCircle]
         arrayOfLetters = [m, t, w, th, f, s, su]
        let arrayOfText = ["m", "t", "w", "t", "f", "s", "s"]

        var count = 0
        
        let cardWidth = self.frame.width
        let incrementNumber = cardWidth / 8
        var amountToIncrement = incrementNumber
        for _ in arrayOfCircles {
            arrayOfLetters[count] = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 15))
            arrayOfLetters[count].text = arrayOfText[count]
            arrayOfLetters[count].textAlignment = .center
            arrayOfLetters[count].textColor = UIColor.darkGray
            
            arrayOfCircles[count] = Circle(frame: CGRect(x: 0, y: helperBackground.frame.maxY + 16, width: 30, height: 30))
            
            arrayOfCircles[count].backgroundColor = unselectedCircledColour
            arrayOfCircles[count].center.x = amountToIncrement
            self.addSubview(arrayOfCircles[count])
            arrayOfLetters[count].center = arrayOfCircles[count].center
            self.addSubview(arrayOfLetters[count])
            amountToIncrement += incrementNumber
            count += 1
        }
        
        let buttonWidth = getWidthOfButton(text: "change time")
        changeTimeButton = ASButton(frame: CGRect(x: 0, y: arrayOfCircles[0].frame.maxY + 18, width: buttonWidth, height: 40))
        changeTimeButton.changeLabel(labelText: "change time")
        changeTimeButton.center.x = helperBackground.center.x
        
        self.addSubview(changeTimeButton)
        
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func changeHelperText(text: String) {
        helperText.text = text
    }
    
    func changeCircleToActive(day: daysOfWeek) {
        if day == .mon {
            arrayOfCircles[0].changeColour(colour: circleActiveColour)
            arrayOfLetters[0].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightSemibold)
            arrayOfLetters[0].textColor = textActiveColour
        } else if day == .tue {
            arrayOfCircles[1].changeColour(colour: circleActiveColour)
            arrayOfLetters[1].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightSemibold)
            arrayOfLetters[1].textColor = textActiveColour
        } else if day == .wed {
            arrayOfCircles[2].changeColour(colour: circleActiveColour)
            arrayOfLetters[2].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightSemibold)
            arrayOfLetters[2].textColor = textActiveColour
        } else if day == .thu {
            arrayOfCircles[3].changeColour(colour: circleActiveColour)
            arrayOfLetters[3].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightSemibold)
            arrayOfLetters[3].textColor = textActiveColour
        } else if day == .fri {
            arrayOfCircles[4].changeColour(colour: circleActiveColour)
            arrayOfLetters[4].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightSemibold)
            arrayOfLetters[4].textColor = textActiveColour
        } else if day == .sat {
            arrayOfCircles[5].changeColour(colour: circleActiveColour)
            arrayOfLetters[5].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightSemibold)
            arrayOfLetters[5].textColor = textActiveColour
        } else if day == .sun {
            arrayOfCircles[6].changeColour(colour: circleActiveColour)
            arrayOfLetters[6].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightSemibold)
            arrayOfLetters[6].textColor = textActiveColour
        } 
    }
    func changeCircleToInactive(day: daysOfWeek) {
        if day == .mon {
            arrayOfCircles[0].changeColour(colour: unselectedCircledColour)
            arrayOfLetters[0].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)
            arrayOfLetters[0].textColor =  UIColor.darkGray
        } else if day == .tue {
            arrayOfCircles[1].changeColour(colour: unselectedCircledColour)
            arrayOfLetters[1].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)
            arrayOfLetters[1].textColor =  UIColor.darkGray
        } else if day == .wed {
            arrayOfCircles[2].changeColour(colour: unselectedCircledColour)
            arrayOfLetters[2].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)
            arrayOfLetters[2].textColor =  UIColor.darkGray
        } else if day == .thu {
            arrayOfCircles[3].changeColour(colour: unselectedCircledColour)
            arrayOfLetters[3].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)
            arrayOfLetters[3].textColor =  UIColor.darkGray
        } else if day == .fri {
            arrayOfCircles[4].changeColour(colour: unselectedCircledColour)
            arrayOfLetters[4].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)
            arrayOfLetters[4].textColor =  UIColor.darkGray
        } else if day == .sat {
            arrayOfCircles[5].changeColour(colour: unselectedCircledColour)
            arrayOfLetters[5].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)
            arrayOfLetters[5].textColor =  UIColor.darkGray
        } else if day == .sun {
            arrayOfCircles[6].changeColour(colour: unselectedCircledColour)
            arrayOfLetters[6].font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)
            arrayOfLetters[6].textColor =  UIColor.darkGray
        }
    }
}

func setUpDailyReminderCard(screenWidth: CGFloat) -> DailyReminderCard {
    let view = DailyReminderCard(frame: CGRect(x: 20, y: 0, width: screenWidth - 40, height: 150))
    return view
    
}
