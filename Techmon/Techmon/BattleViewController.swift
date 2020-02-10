//
//  BattleViewController.swift
//  Techmon
//
//  Created by konatsu_p on 2020/02/10.
//  Copyright © 2020 konatsup. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {
    
    @IBOutlet var playerNameLabel: UILabel!
    @IBOutlet var playerImageView: UIImageView!
    @IBOutlet var playerHPLabel: UILabel!
    @IBOutlet var playerMPLabel: UILabel!
    @IBOutlet var playerTPLabel: UILabel!
    
    
    @IBOutlet var enemyNameLabel: UILabel!
    @IBOutlet var enemyImageView: UIImageView!
    @IBOutlet var enemyHPLabel: UILabel!
    @IBOutlet var enemyMPLabel: UILabel!
    
    let techMonManger = TechMonManager.shared
    
    var player: Character!
    var enemy: Character!
    
    var gameTimer: Timer!
    var isPlayerAttackAvailable: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = techMonManger.player
        enemy = techMonManger.enemy
        
        playerNameLabel.text = "勇者"
        playerImageView.image = UIImage(named: "yusya.png")
        
        enemyNameLabel.text = "龍"
        enemyImageView.image = UIImage(named: "monster.png")
        
        updateUI()
        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateGame), userInfo: nil, repeats: true)
        gameTimer.fire()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        techMonManger.playBGM(fileName: "BGM_battle001")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        techMonManger.stopBGM()
    }
    
    
    @objc
    func updateGame(){
        player.currentMP += 1
        if player.currentMP >= player.maxMP {
            isPlayerAttackAvailable = true
            player.currentMP = player.maxMP
        } else {
            isPlayerAttackAvailable = false
        }
        
        enemy.currentMP += 1
        if enemy.currentMP >= enemy.maxMP {
            enemyAttack()
            enemy.currentMP = 0
        }
        
        updateUI()
        
    }
    
    func enemyAttack() {
        techMonManger.damageAnimation(imageView: playerImageView)
        techMonManger.playSE(fileName: "SE_attack")
        
        player.currentHP -= enemy.attackPoint
                
        updateUI()
        judgeBattle()
    }
    
    func updateUI(){
        
        playerHPLabel.text = "\(player.currentHP) / \(player.maxHP)"
        playerMPLabel.text = "\(player.currentMP) / \(player.maxMP)"
        playerTPLabel.text = "\(player.currentTP) / \(player.maxTP)"
        
        
        enemyHPLabel.text = "\(enemy.currentHP) / \(enemy.maxHP)"
        enemyMPLabel.text = "\(enemy.currentMP) / \(enemy.maxMP)"
    }
    
    func judgeBattle() {
        if player.currentHP <= 0 {
            finishBattle(vanishImageView: playerImageView, isPlayerWin: false)
        } else if enemy.currentHP <= 0 {
            finishBattle(vanishImageView: enemyImageView, isPlayerWin: true)
        }
    }
    
    func finishBattle(vanishImageView: UIImageView, isPlayerWin: Bool){
        
        techMonManger.vanishAnimation(imageView: vanishImageView)
        techMonManger.stopBGM()
        gameTimer.invalidate()
        isPlayerAttackAvailable = false
        var finishMessage: String = ""
        if isPlayerWin {
            techMonManger.playSE(fileName: "SE_fanfare")
            finishMessage = "勇者の勝利!!"
        } else {
            techMonManger.playSE(fileName: "SE_gameover")
            finishMessage = "勇者の敗北..."
        }
        
        let alert = UIAlertController(title: "バトル終了", message: finishMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func attackAction(){
        if isPlayerAttackAvailable {
            techMonManger.damageAnimation(imageView: enemyImageView)
            techMonManger.playSE(fileName: "SE_attack")
            
            enemy.currentHP -= player.attackPoint
            
            player.currentTP += 10
            if player.currentTP >= player.maxTP {
                player.currentTP = player.maxTP
            }
            player.currentMP = 0
            
            updateUI()
            judgeBattle()
            
        }
    }
    
    @IBAction func tameruAction(){
        
        if isPlayerAttackAvailable {
            techMonManger.playSE(fileName: "SE_charge")
            player.currentTP += 40
            if player.currentTP >= player.maxTP {
                player.currentTP = player.maxTP
            }
            player.currentMP = 0
        }
    }
    
    @IBAction func fireAction(){
        
        if isPlayerAttackAvailable && player.currentTP >= 40 {
            
            techMonManger.damageAnimation(imageView: enemyImageView)
            techMonManger.playSE(fileName: "SE_fire")
            
            enemy.currentHP -= 100
            player.currentTP -= 40
            
            if player.currentTP <= 0 {
                player.currentTP = 0
            }
            player.currentMP = 0
            
            judgeBattle()
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
