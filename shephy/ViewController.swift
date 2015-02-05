//
//  ViewController.swift
//  shephy
//
//  Created by Ryo on 2015/02/05.
//  Copyright (c) 2015年 Ryo. All rights reserved.
//

import UIKit

class Sheep{
    let mountnumber:[Int] = [1, 3, 10, 30, 100, 300, 1000]
    var mountrest:[Int] = [6, 7, 7, 7, 7, 7, 7]
    var field:[Int] = [0, -1, -1, -1, -1, -1, -1]
    var sheepnum:Int = 1
    
    func back(fieldnum:Int){
        var tmp:Int = field[fieldnum]
        field[fieldnum] = -1
        mountrest[tmp]++
        sheepnum--
    }
    
    func put(fieldnumrank:(Int, Int)){
        var (fieldnum, rank) = fieldnumrank
        var tmp:Int = field[fieldnum]
        field[fieldnum] = rank
        mountrest[rank]--
        sheepnum++
    }
    
    func rankup(fieldnum:Int){
        mountrest[field[fieldnum]]++
        field[fieldnum]++
        mountrest[field[fieldnum]]--
    }
    
    func rankdown(fieldnum:Int){
        mountrest[field[fieldnum]]++
        field[fieldnum]--
        if field[fieldnum]>0 {
            mountrest[field[fieldnum]]--
        }
        else {
            sheepnum--
        }
    }
    
    func showfield(){
        println("field")
        for i in 0...6 {
            println(String(i) + " : " + String(field[i]))
        }
    }
}

//アクションカードに関するクラス。山札と手札
class Actioncard{
    var deck:[Int] = [Int](count:22, repeatedValue:1)
    var hand:[Int] = [-1, -1, -1, -1, -1]
    var handnum:Int = 0
    var deckrest:Int = 22
    var deckmax:Int = 22
    
    func refresh(){
        for i in 0...21{
            if deck[i]==0 {
                deck[i] = 1
            }
        }
        deckrest = deckmax
    }
    
    func draw(){
        for i in 0...4{
            if deckrest == 0 {
                break
            }
            if hand[i] == -1{
                var drawcard = Int(arc4random()) % deckrest + 1
                var (idx,one) = (0,0)
                while one != drawcard {
                    if deck[idx] == 1 {
                        one++
                    }
                    idx++
                }
                
                hand[i] = idx - 1
                deck[idx - 1] = 0
                handnum++
                deckrest--
            }
        }
    }
    
    func trash(trashcard:Int){
        hand[trashcard] = -1
        handnum--
    }
    
    func expulsion(expcard:Int){
        deck[hand[expcard]] = -1
        hand[expcard] = -1
        handnum--
    }
    
    func choose(handcardchocard:(Int, Int)){
        var (handcard, chocard) = handcardchocard
        deck[chocard] = 0
        hand[handcard] = chocard
        deckrest--
    }
}

class GameManager{
    var deathflag:Bool = false
    var enemysheep:Int = 1
    var usehandcard:Int = -1
    var usecard:Int = -1
    var usecardmem:Int = -1
    var plaguenum:Int = -1
    var slumpnum:Int = -1
    var putnum:Int = -1
    var selnum:Int = -1
    var domsum:Int = -1
    
}

var gameManager:GameManager = GameManager()
var sheep:Sheep = Sheep()
var actcard:Actioncard = Actioncard()

class ViewController: UIViewController {
    
    let sheepButton0 :UIButton = UIButton()
    let sheepButton1 :UIButton = UIButton()
    let sheepButton2 :UIButton = UIButton()
    let sheepButton3 :UIButton = UIButton()
    let sheepButton4 :UIButton = UIButton()
    let sheepButton5 :UIButton = UIButton()
    let sheepButton6 :UIButton = UIButton()
    
    let fieldButton0 :UIButton = UIButton()
    let fieldButton1 :UIButton = UIButton()
    let fieldButton2 :UIButton = UIButton()
    let fieldButton3 :UIButton = UIButton()
    let fieldButton4 :UIButton = UIButton()
    let fieldButton5 :UIButton = UIButton()
    let fieldButton6 :UIButton = UIButton()
    
    let handButton0 :UIButton = UIButton()
    let handButton1 :UIButton = UIButton()
    let handButton2 :UIButton = UIButton()
    let handButton3 :UIButton = UIButton()
    let handButton4 :UIButton = UIButton()
    
    let inspButton0 :UIButton = UIButton()
    let inspButton1 :UIButton = UIButton()
    let inspButton2 :UIButton = UIButton()
    let inspButton3 :UIButton = UIButton()
    let inspButton4 :UIButton = UIButton()
    let inspButton5 :UIButton = UIButton()
    let inspButton6 :UIButton = UIButton()
    let inspButton7 :UIButton = UIButton()
    let inspButton8 :UIButton = UIButton()
    let inspButton9 :UIButton = UIButton()
    let inspButton10 :UIButton = UIButton()
    let inspButton11 :UIButton = UIButton()
    let inspButton12 :UIButton = UIButton()
    let inspButton13 :UIButton = UIButton()
    let inspButton14 :UIButton = UIButton()
    let inspButton15 :UIButton = UIButton()
    let inspButton16 :UIButton = UIButton()
    let inspButton17 :UIButton = UIButton()
    let inspButton18 :UIButton = UIButton()
    let inspButton19 :UIButton = UIButton()
    let inspButton20 :UIButton = UIButton()
    let inspButton21 :UIButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        actcard.draw()
        
        // サイズを設定する.
        sheepButton0.frame = CGRectMake(0,0,80,100)
        sheepButton1.frame = CGRectMake(0,0,80,100)
        sheepButton2.frame = CGRectMake(0,0,80,100)
        sheepButton3.frame = CGRectMake(0,0,80,100)
        sheepButton4.frame = CGRectMake(0,0,80,100)
        sheepButton5.frame = CGRectMake(0,0,80,100)
        sheepButton6.frame = CGRectMake(0,0,80,100)
        
        fieldButton0.frame = CGRectMake(0,0,80,100)
        fieldButton1.frame = CGRectMake(0,0,80,100)
        fieldButton2.frame = CGRectMake(0,0,80,100)
        fieldButton3.frame = CGRectMake(0,0,80,100)
        fieldButton4.frame = CGRectMake(0,0,80,100)
        fieldButton5.frame = CGRectMake(0,0,80,100)
        fieldButton6.frame = CGRectMake(0,0,80,100)
        
        handButton0.frame = CGRectMake(0,0,60,70)
        handButton1.frame = CGRectMake(0,0,60,70)
        handButton2.frame = CGRectMake(0,0,60,70)
        handButton3.frame = CGRectMake(0,0,60,70)
        handButton4.frame = CGRectMake(0,0,60,70)
        
        inspButton0.frame = CGRectMake(0,0,30,35)
        inspButton1.frame = CGRectMake(0,0,30,35)
        inspButton2.frame = CGRectMake(0,0,30,35)
        inspButton3.frame = CGRectMake(0,0,30,35)
        inspButton4.frame = CGRectMake(0,0,30,35)
        inspButton5.frame = CGRectMake(0,0,30,35)
        inspButton6.frame = CGRectMake(0,0,30,35)
        inspButton7.frame = CGRectMake(0,0,30,35)
        inspButton8.frame = CGRectMake(0,0,30,35)
        inspButton9.frame = CGRectMake(0,0,30,35)
        inspButton10.frame = CGRectMake(0,0,30,35)
        inspButton11.frame = CGRectMake(0,0,30,35)
        inspButton12.frame = CGRectMake(0,0,30,35)
        inspButton13.frame = CGRectMake(0,0,30,35)
        inspButton14.frame = CGRectMake(0,0,30,35)
        inspButton15.frame = CGRectMake(0,0,30,35)
        inspButton16.frame = CGRectMake(0,0,30,35)
        inspButton17.frame = CGRectMake(0,0,30,35)
        inspButton18.frame = CGRectMake(0,0,30,35)
        inspButton19.frame = CGRectMake(0,0,30,35)
        inspButton20.frame = CGRectMake(0,0,30,35)
        inspButton21.frame = CGRectMake(0,0,30,35)
        
        // 背景色を設定する.
        sheepButton0.backgroundColor = UIColor(red:0.0,green:1.0,blue:0.0,alpha:1.0)
        sheepButton1.backgroundColor = UIColor(red:0.0,green:0.9,blue:0.0,alpha:1.0)
        sheepButton2.backgroundColor = UIColor(red:0.0,green:0.8,blue:0.0,alpha:1.0)
        sheepButton3.backgroundColor = UIColor(red:0.0,green:0.7,blue:0.0,alpha:1.0)
        sheepButton4.backgroundColor = UIColor(red:0.0,green:0.6,blue:0.0,alpha:1.0)
        sheepButton5.backgroundColor = UIColor(red:0.0,green:0.5,blue:0.0,alpha:1.0)
        sheepButton6.backgroundColor = UIColor(red:0.0,green:0.4,blue:0.0,alpha:1.0)
        
        fieldButton0.backgroundColor = UIColor(red:0.8,green:0.8,blue:0.8,alpha:1.0)
        fieldButton1.backgroundColor = UIColor(red:0.8,green:0.8,blue:0.8,alpha:1.0)
        fieldButton2.backgroundColor = UIColor(red:0.8,green:0.8,blue:0.8,alpha:1.0)
        fieldButton3.backgroundColor = UIColor(red:0.8,green:0.8,blue:0.8,alpha:1.0)
        fieldButton4.backgroundColor = UIColor(red:0.8,green:0.8,blue:0.8,alpha:1.0)
        fieldButton5.backgroundColor = UIColor(red:0.8,green:0.8,blue:0.8,alpha:1.0)
        fieldButton6.backgroundColor = UIColor(red:0.8,green:0.8,blue:0.8,alpha:1.0)
        
        handButton0.backgroundColor = UIColor(red:0.8,green:0.8,blue:0.4,alpha:1.0)
        handButton1.backgroundColor = UIColor(red:0.8,green:0.8,blue:0.4,alpha:1.0)
        handButton2.backgroundColor = UIColor(red:0.8,green:0.8,blue:0.4,alpha:1.0)
        handButton3.backgroundColor = UIColor(red:0.8,green:0.8,blue:0.4,alpha:1.0)
        handButton4.backgroundColor = UIColor(red:0.8,green:0.8,blue:0.4,alpha:1.0)
        
        inspButton0.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton1.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton2.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton3.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton4.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton5.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton6.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton7.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton8.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton9.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton10.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton11.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton12.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton13.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton14.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton15.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton16.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton17.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton18.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton19.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton20.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        inspButton21.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.1,alpha:1.0)
        
        // 枠を丸くする.
        sheepButton0.layer.masksToBounds = true
        sheepButton1.layer.masksToBounds = true
        sheepButton2.layer.masksToBounds = true
        sheepButton3.layer.masksToBounds = true
        sheepButton4.layer.masksToBounds = true
        sheepButton5.layer.masksToBounds = true
        sheepButton6.layer.masksToBounds = true
        
        fieldButton0.layer.masksToBounds = true
        fieldButton1.layer.masksToBounds = true
        fieldButton2.layer.masksToBounds = true
        fieldButton3.layer.masksToBounds = true
        fieldButton4.layer.masksToBounds = true
        fieldButton5.layer.masksToBounds = true
        fieldButton6.layer.masksToBounds = true
        
        // タイトルを設定する(通常時).
        sheepButton0.setTitle("1羊", forState: UIControlState.Normal)
        sheepButton0.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        sheepButton1.setTitle("3羊", forState: UIControlState.Normal)
        sheepButton1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        sheepButton2.setTitle("10羊", forState: UIControlState.Normal)
        sheepButton2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        sheepButton3.setTitle("30羊", forState: UIControlState.Normal)
        sheepButton3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        sheepButton4.setTitle("100羊", forState: UIControlState.Normal)
        sheepButton4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        sheepButton5.setTitle("300羊", forState: UIControlState.Normal)
        sheepButton5.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        sheepButton6.setTitle("1000羊", forState: UIControlState.Normal)
        sheepButton6.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        fieldButton0.setTitle(String(sheep.field[0]), forState: UIControlState.Normal)
        fieldButton0.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        fieldButton1.setTitle(String(sheep.field[1]), forState: UIControlState.Normal)
        fieldButton1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        fieldButton2.setTitle(String(sheep.field[2]), forState: UIControlState.Normal)
        fieldButton2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        fieldButton3.setTitle(String(sheep.field[3]), forState: UIControlState.Normal)
        fieldButton3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        fieldButton4.setTitle(String(sheep.field[4]), forState: UIControlState.Normal)
        fieldButton4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        fieldButton5.setTitle(String(sheep.field[5]), forState: UIControlState.Normal)
        fieldButton5.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        fieldButton6.setTitle(String(sheep.field[6]), forState: UIControlState.Normal)
        fieldButton6.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        handButton0.setTitle(String(actcard.hand[0]), forState: UIControlState.Normal)
        handButton0.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        handButton1.setTitle(String(actcard.hand[1]), forState: UIControlState.Normal)
        handButton1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        handButton2.setTitle(String(actcard.hand[2]), forState: UIControlState.Normal)
        handButton2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        handButton3.setTitle(String(actcard.hand[3]), forState: UIControlState.Normal)
        handButton3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        handButton4.setTitle(String(actcard.hand[4]), forState: UIControlState.Normal)
        handButton4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        
        // タイトルを設定する(ボタンがハイライトされた時).
        //sheepButton0.setTitle("１ひつじ", forState: UIControlState.Highlighted)
        //sheepButton0.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        
        // コーナーの半径を設定する.
        sheepButton0.layer.cornerRadius = 10.0
        sheepButton1.layer.cornerRadius = 10.0
        sheepButton2.layer.cornerRadius = 10.0
        sheepButton3.layer.cornerRadius = 10.0
        sheepButton4.layer.cornerRadius = 10.0
        sheepButton5.layer.cornerRadius = 10.0
        sheepButton6.layer.cornerRadius = 10.0
        
        fieldButton0.layer.cornerRadius = 10.0
        fieldButton1.layer.cornerRadius = 10.0
        fieldButton2.layer.cornerRadius = 10.0
        fieldButton3.layer.cornerRadius = 10.0
        fieldButton4.layer.cornerRadius = 10.0
        fieldButton5.layer.cornerRadius = 10.0
        fieldButton6.layer.cornerRadius = 10.0
        
        // ボタンの位置を指定する.
        sheepButton0.layer.position = CGPoint(x: 50, y:70)
        sheepButton1.layer.position = CGPoint(x: 140, y:70)
        sheepButton2.layer.position = CGPoint(x: 230, y:70)
        sheepButton3.layer.position = CGPoint(x: 320, y:70)
        sheepButton4.layer.position = CGPoint(x: 95, y:180)
        sheepButton5.layer.position = CGPoint(x: 185, y:180)
        sheepButton6.layer.position = CGPoint(x: 275, y:180)
        
        fieldButton0.layer.position = CGPoint(x: 50, y:290)
        fieldButton1.layer.position = CGPoint(x: 140, y:290)
        fieldButton2.layer.position = CGPoint(x: 230, y:290)
        fieldButton3.layer.position = CGPoint(x: 320, y:290)
        fieldButton4.layer.position = CGPoint(x: 95, y:400)
        fieldButton5.layer.position = CGPoint(x: 185, y:400)
        fieldButton6.layer.position = CGPoint(x: 275, y:400)
        
        handButton0.layer.position = CGPoint(x: 50, y:620)
        handButton1.layer.position = CGPoint(x: 120, y:620)
        handButton2.layer.position = CGPoint(x: 190, y:620)
        handButton3.layer.position = CGPoint(x: 260, y:620)
        handButton4.layer.position = CGPoint(x: 330, y:620)
        
        inspButton0.layer.position = CGPoint(x: 28, y:475)
        inspButton1.layer.position = CGPoint(x: 74, y:475)
        inspButton2.layer.position = CGPoint(x: 120, y:475)
        inspButton3.layer.position = CGPoint(x: 166, y:475)
        inspButton4.layer.position = CGPoint(x: 212, y:475)
        inspButton5.layer.position = CGPoint(x: 258, y:475)
        inspButton6.layer.position = CGPoint(x: 304, y:475)
        inspButton7.layer.position = CGPoint(x: 28, y:515)
        inspButton8.layer.position = CGPoint(x: 74, y:515)
        inspButton9.layer.position = CGPoint(x: 120, y:515)
        inspButton10.layer.position = CGPoint(x: 166, y:515)
        inspButton11.layer.position = CGPoint(x: 212, y:515)
        inspButton12.layer.position = CGPoint(x: 258, y:515)
        inspButton13.layer.position = CGPoint(x: 304, y:515)
        inspButton14.layer.position = CGPoint(x: 28, y:555)
        inspButton15.layer.position = CGPoint(x: 74, y:555)
        inspButton16.layer.position = CGPoint(x: 120, y:555)
        inspButton17.layer.position = CGPoint(x: 166, y:555)
        inspButton18.layer.position = CGPoint(x: 212, y:555)
        inspButton19.layer.position = CGPoint(x: 258, y:555)
        inspButton20.layer.position = CGPoint(x: 304, y:555)
        inspButton21.layer.position = CGPoint(x: 350, y:555)
        
        // タグを設定する.
        sheepButton0.tag = 0
        sheepButton1.tag = 1
        sheepButton2.tag = 2
        sheepButton3.tag = 3
        sheepButton4.tag = 4
        sheepButton5.tag = 5
        sheepButton6.tag = 6
        
        fieldButton0.tag = 7
        fieldButton1.tag = 8
        fieldButton2.tag = 9
        fieldButton3.tag = 10
        fieldButton4.tag = 11
        fieldButton5.tag = 12
        fieldButton6.tag = 13
        
        handButton0.tag = 14
        handButton1.tag = 15
        handButton2.tag = 16
        handButton3.tag = 17
        handButton4.tag = 18
        
        inspButton0.tag = 19
        inspButton1.tag = 20
        inspButton2.tag = 21
        inspButton3.tag = 22
        inspButton4.tag = 23
        inspButton5.tag = 24
        inspButton6.tag = 25
        inspButton7.tag = 26
        inspButton8.tag = 27
        inspButton9.tag = 28
        inspButton10.tag = 29
        inspButton11.tag = 30
        inspButton12.tag = 31
        inspButton13.tag = 32
        inspButton14.tag = 33
        inspButton15.tag = 34
        inspButton16.tag = 35
        inspButton17.tag = 36
        inspButton18.tag = 37
        inspButton19.tag = 38
        inspButton20.tag = 39
        inspButton21.tag = 40
        
        // イベントを追加する.
        sheepButton0.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        sheepButton1.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        sheepButton2.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        sheepButton3.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        sheepButton4.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        sheepButton5.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        sheepButton6.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        fieldButton0.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        fieldButton1.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        fieldButton2.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        fieldButton3.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        fieldButton4.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        fieldButton5.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        fieldButton6.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        handButton0.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        handButton1.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        handButton2.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        handButton3.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        handButton4.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        inspButton0.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton1.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton2.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton3.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton4.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton5.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton6.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton7.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton8.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton9.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton10.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton11.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton12.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton13.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton14.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton15.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton16.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton17.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton18.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton19.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton20.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        inspButton21.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        // ボタンをViewに追加する.
        self.view.addSubview(sheepButton0)
        self.view.addSubview(sheepButton1)
        self.view.addSubview(sheepButton2)
        self.view.addSubview(sheepButton3)
        self.view.addSubview(sheepButton4)
        self.view.addSubview(sheepButton5)
        self.view.addSubview(sheepButton6)
        
        self.view.addSubview(fieldButton0)
        self.view.addSubview(fieldButton1)
        self.view.addSubview(fieldButton2)
        self.view.addSubview(fieldButton3)
        self.view.addSubview(fieldButton4)
        self.view.addSubview(fieldButton5)
        self.view.addSubview(fieldButton6)
        
        self.view.addSubview(handButton0)
        self.view.addSubview(handButton1)
        self.view.addSubview(handButton2)
        self.view.addSubview(handButton3)
        self.view.addSubview(handButton4)
        
        self.view.addSubview(inspButton0)
        self.view.addSubview(inspButton1)
        self.view.addSubview(inspButton2)
        self.view.addSubview(inspButton3)
        self.view.addSubview(inspButton4)
        self.view.addSubview(inspButton5)
        self.view.addSubview(inspButton6)
        self.view.addSubview(inspButton7)
        self.view.addSubview(inspButton8)
        self.view.addSubview(inspButton9)
        self.view.addSubview(inspButton10)
        self.view.addSubview(inspButton11)
        self.view.addSubview(inspButton12)
        self.view.addSubview(inspButton13)
        self.view.addSubview(inspButton14)
        self.view.addSubview(inspButton15)
        self.view.addSubview(inspButton16)
        self.view.addSubview(inspButton17)
        self.view.addSubview(inspButton18)
        self.view.addSubview(inspButton19)
        self.view.addSubview(inspButton20)
        self.view.addSubview(inspButton21)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    ボタンイベント.
    */
    func onClickMyButton(sender: UIButton){
        switch sender.tag {
        case 14...18:
            UseCard(sender.tag - 14)
            actcard.draw()
            handButton0.setTitle(String(actcard.hand[0]), forState: UIControlState.Normal)
            handButton1.setTitle(String(actcard.hand[1]), forState: UIControlState.Normal)
            handButton2.setTitle(String(actcard.hand[2]), forState: UIControlState.Normal)
            handButton3.setTitle(String(actcard.hand[3]), forState: UIControlState.Normal)
            handButton4.setTitle(String(actcard.hand[4]), forState: UIControlState.Normal)
        default:
            println("error")
        }
        println("onClickMyButton:")
        println("sender.currentTitile: \(sender.currentTitle)")
        println("sender.tag:\(sender.tag)")
    }
    
}


func UseCard(num:Int){
    gameManager.usehandcard = num
    gameManager.usecard = actcard.hand[gameManager.usehandcard]
    gameManager.usecardmem = gameManager.usecard
    actcard.hand[gameManager.usehandcard] = -1
    actcard.handnum--
    
}




