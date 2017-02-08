//
//  ViewController.swift
//  PokemonTypeChecker
//
//  Created by 清水 嶺 on 2017/02/07.
//  Copyright © 2017年 清水 嶺. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pokemonTypeArray :[String] = ["なし", "ノーマル", "ほのお", "みず", "でんき", "くさ", "こおり", "かくとう", "どく", "じめん", "ひこう", "エスパー", "むし", "いわ", "ゴースト", "ドラゴン", "あく", "はがね", "フェアリー"]
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var attackView: UIPickerView!
    @IBOutlet weak var enemyTypeView: UIPickerView!
    @IBOutlet weak var enemyTypeView2: UIPickerView!
    
    var aType :String = ""
    var eType1 :String = ""
    var eType2 :String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        attackView.dataSource = self
        attackView.delegate = self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // こうかばつぐん 3, なにもなし 2, いまひとつ 1, こうかなし 0
    func typeEvalTables(atk :String, def :String) -> Int{
        switch atk {
        case "ノーマル":
            switch def{
            case "はがね":
                return 1
            case "ゴースト":
                return 0
            default:
                return 2
            }
        case "ほのお":
            switch def{
            case "ほのお", "いわ", "みず", "ドラゴン":
                return 1
            case "くさ", "こおり", "むし", "はがね":
                return 3
            default:
                return 2
            }
        case "みず":
            switch def{
            case "くさ", "みず", "ドラゴン":
                return 1
            case "ほのお", "じめん", "いわ":
                return 3
            default:
                return 2
            }
        case "でんき":
            switch def{
            case "くさ", "でんき", "ドラゴン":
                return 1
            case "みず", "ひこう":
                return 3
            default:
                return 2
            }
        case "くさ":
            switch def{
            case "ほのお", "はがね", "くさ", "どく", "むし", "ドラゴン":
                return 1
            case "みず", "じめん", "いわ":
                return 3
            default:
                return 2
            }
        case "こおり":
            switch def{
            case "ほのお", "みず", "こおり", "はがね":
                return 1
            case "くさ", "じめん", "ひこう", "ドラゴン":
                return 3
            default:
                return 2
            }
        case "かくとう":
            switch def{
            case "いわ", "はがね", "ノーマル", "こおり", "あく":
                return 3
            case "どく", "ひこう", "エスパー", "むし", "フェアリー":
                return 1
            default:
                return 2
            }
        case "どく":
            switch def{
                case "くさ", "フェアリー":
                    return 3
                case "どく", "じめん", "いわ", "ゴースト":
                    return 1
                default:
                    return 2
            }
        case "じめん":
            switch def{
            case "ほのお", "でんき", "どく", "いわ", "はがね":
                return 3
            case "くさ", "むし":
                return 1
            case "ひこう":
                return 0
            default:
                return 2
            }
        case "ひこう":
            switch def{
            case "くさ", "かくとう", "むし":
                return 3
            case "でんき", "いわ", "はがね":
                return 1
            default:
                return 2
            }
        case "エスパー":
            switch def{
            case "かくとう", "どく":
                return 3
            case "エスパー", "はがね":
                return 1
            case "あく":
                return 0
            default:
                return 2
            }
        case "むし":
            switch def{
            case "くさ", "エスパー", "あく":
                return 3
            case "かくとう", "ほのお", "はがね", "どく", "ひこう", "ゴースト", "フェアリー":
                return 1
            default:
                return 2
            }
        case "いわ":
            switch def{
            case "ほのお", "こおり", "ひこう", "むし":
                return 3
            case "かくとう", "じめん", "はがね":
                return 1
            default:
                return 2
            }
        case "ゴースト":
            switch def{
            case "エスパー", "ゴースト":
                return 3
            case "あく":
                return 1
            case "ノーマル":
                return 0
            default:
                return 2
            }
        case "ドラゴン":
            switch def{
            case "ドラゴン":
                return 3
            case "はがね":
                return 1
            case "フェアリー":
                return 0
            default:
                return 2
            }
        case "あく":
            switch def{
            case "エスパー", "ゴースト":
                return 3
            case "かくとう", "あく", "フェアリー":
                return 1
            default:
                return 2
            }
        case "はがね":
            switch def{
            case "こおり", "いわ", "フェアリー":
                return 3
            case "ほのお", "みず", "くさ", "はがね":
                return 1
            default:
                return 2
            }
        case "フェアリー":
            switch def{
            case "ドラゴン", "かくとう", "あく":
                return 3
            case "ほのお", "どく", "はがね":
                return 1
            default:
                return 2
            }
        case "なし":
            return 0
        default:
            return 0
        }
    }
    
    func typeEval() -> String{
        //タイプ比較
        let r = typeEvalTables(atk: aType, def: eType1) + typeEvalTables(atk: aType, def: eType2)
        
        switch r {
        case 6, 5:
            return "こうかばつぐん"
        case 4, 3:
            return "こうかあり"
        case 2:
            return "いまひとつ"
        default:
            return "こうかなし"
        }
        
    }
    
    @IBAction func typeEvalButton(_ sender: Any) {
        result.text = typeEval()
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ attackView :UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pokemonTypeArray.count
    }
    
    func pickerView(namePickerview: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String! {
        return pokemonTypeArray[row]
    }
    
    func pickerView(namePickerview: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        aType = pokemonTypeArray[row]
    }
    
}

