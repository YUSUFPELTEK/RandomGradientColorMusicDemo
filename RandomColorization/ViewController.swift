

import UIKit
import AVFoundation




class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var audioPlayerr = AVAudioPlayer()
    var audioPlayerrr = AVAudioPlayer()
    
    let gradientLayer = CAGradientLayer()

    var timer : Timer?
    
    var listMusic: [AVAudioPlayer] = []
    var value=0;


    var backgroundColor: (red: CGFloat, green: CGFloat,blue: CGFloat,alpha: CGFloat)! {
        didSet {
            let color1 = UIColor(red: backgroundColor.blue,
                                 green: backgroundColor.green,
                                 blue: 0,
                                 alpha: backgroundColor.alpha).cgColor
            let color2 = UIColor(red: backgroundColor.red,
                                 green: backgroundColor.green,
                                 blue: backgroundColor.blue,
                                 alpha: backgroundColor.alpha).cgColor
            gradientLayer.colors = [color1, color2]
        }
    }
    
    
    
    @IBAction func changeMusicButton(_ sender: Any) {
//        var listMusic: [AVAudioPlayer] = []
        let bgMusicc = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        let bgMusic = URL(fileURLWithPath: Bundle.main.path(forResource: "Ezhel", ofType: "mp3")!)
        let bgMusiccc = URL(fileURLWithPath: Bundle.main.path(forResource: "Ezhell", ofType: "mp3")!)

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayerrr = AVAudioPlayer(contentsOf: bgMusiccc)
            try audioPlayer = AVAudioPlayer(contentsOf: bgMusic)
            try audioPlayerr = AVAudioPlayer(contentsOf: bgMusicc)
            
            listMusic.append(audioPlayer)
            listMusic.append(audioPlayerr)
            listMusic.append(audioPlayerrr)
            
           
            
            
            print("***********************************")
            if(value<=3){
                value = value+1
                listMusic[value].prepareToPlay()
                listMusic[value].play()
                
            }
            if(value==3){
                value=0
                
            }
            
            print(value)
            print("***********************************")
            if(value==0){
                listMusic[value].stop()

            }
            
            if(value>0){
                listMusic[value-1].stop()

            }

            

            
                
        

                

            
        }
        catch let audioError as NSError {
            print(audioError)
        }
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func playMusicButtonDidTouch(_ sender: AnyObject) {
        let bgMusicc = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        let bgMusic = URL(fileURLWithPath: Bundle.main.path(forResource: "Ezhel", ofType: "mp3")!)
        let bgMusiccc = URL(fileURLWithPath: Bundle.main.path(forResource: "Ezhell", ofType: "mp3")!)

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: bgMusiccc)
            try audioPlayer = AVAudioPlayer(contentsOf: bgMusic)
            try audioPlayer = AVAudioPlayer(contentsOf: bgMusicc)

            
           
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
        }
        catch let audioError as NSError {
            print(audioError)
        }
        
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(ViewController.randomColor), userInfo: nil, repeats: true)
        }
        
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        //graditent color
        gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
      
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    @objc func randomColor() {
        
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        
        backgroundColor = (redValue, blueValue, greenValue, 1)
        
    }

}

