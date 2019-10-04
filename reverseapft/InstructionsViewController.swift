//
//  InstructionsViewController.swift
//  acft
//
//  Created by Zachary Gorak on 10/26/18.
//  Copyright © 2018 Zachary Gorak. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation
import WebKit


// https://www.military.com/sites/default/files/2018-09/Field%20testing%20manual.pdf
let speech = [
    "YOU  ARE  ABOUT  TO  TAKE  THE  ARMY  PHYSICAL  FITNESS  TEST,  A  TEST  THAT  WILL  MEASURE  YOUR MUSCULAR ENDURANCE AND CARDIORESPIRATORY FITNESS. THE RESULTS OF THIS TEST WILL GIVE YOU AND  YOUR  COMMANDERS  AN  INDICATION  OF  YOUR  STATE OF  FITNESS  AND  WILL  ACT  AS  A  GUIDE  IN DETERMINING YOUR PHYSICAL TRAINING NEEDS. LISTEN CLOSELY TO THE TEST INSTRUCTIONS, AND DO THE BEST YOU CAN ON EACH OF THE EVENTS.",
    "THE PUSH-UP EVENT MEASURES THE ENDURANCE OF THE CHEST, SHOULDER, AND TRICEPS MUSCLES. ON THE  COMMAND  'GET  SET,'  ASSUME  THE  FRONT-LEANING REST POSITION BY PLACING YOUR HANDS WHERE  THEY  ARE  COMFORTABLE  FOR  YOU.  YOUR FEET  MAY  BE  TOGETHER  OR  UP  TO  12  INCHES APART. WHEN VIEWED FROM THE SIDE, YOUR BODY SHOULD  FORM  A  GENERALLY  STRAIGHT  LINE  FROM YOUR  SHOULDERS  TO  YOUR  ANKLES.  ON  THE COMMAND  'GO,'  BEGIN  THE  PUSH-UP  BY  BENDING YOUR ELBOWS AND LOWERING YOUR ENTIRE BODY AS A SINGLE UNIT UNTIL YOUR UPPER ARMS ARE AT LEAST  PARALLEL  TO  THE  GROUND.  THEN,  RETURN TO  THE  STARTING  POSITION  BY  RAISING  YOUR ENTIRE  BODY  UNTIL  YOUR  ARMS  ARE  FULLY EXTENDED. YOUR BODY MUST REMAIN RIGID IN A GENERALLY STRAIGHT LINE AND MOVE AS A UNIT WHILE PERFORMING EACH REPETITION. AT THE END OF  EACH  REPETITION,  THE  SCORER  WILL  STATE THE NUMBER OF REPETITIONS YOU HAVE COMPLETED CORRECTLY.  IF  YOU  FAIL  TO  KEEP  YOUR  BODY GENERALLY STRAIGHT, TO LOWER YOUR WHOLE BODY UNTIL YOUR UPPER ARMS ARE AT LEAST PARALLEL TO  THE  GROUND,  OR  TO  EXTEND  YOUR  ARMS COMPLETELY, THAT REPETITION WILL NOT COUNT, AND THE SCORER WILL REPEAT THE NUMBER OF THE LAST CORRECTLY PERFORMED REPETITION. IF YOU FAIL  TO  PERFORM  THE  FIRST  TEN  PUSH-UPS CORRECTLY, THE SCORER WILL TELL YOU TO GO TO YOUR KNEES AND WILL EXPLAIN TO YOU WHAT YOUR MISTAKES ARE. YOU WILL THEN BE SENT TO THE END  OF  THE  LINE  TO  BE  RETESTED.  AFTER  THE FIRST  10  PUSH-UPS  HAVE  BEEN  PERFORMED  AND COUNTED,  HOWEVER,  NO  RESTARTS  ARE  ALLOWED. THE TEST WILL CONTINUE, AND ANY INCORRECTLY PERFORMED  PUSH-UPS  WILL  NOT  BE  COUNTED.  AN ALTERED, FRONT-LEANING REST POSITION IS THE ONLY AUTHORIZED REST POSITION. THAT IS, YOU MAY  SAG  IN  THE  MIDDLE  OR  FLEX  YOUR  BACK. WHEN  FLEXING  YOUR  BACK,  YOU  MAY  BEND  YOUR KNEES,  BUT  NOT  TO  SUCH  AN  EXTENT  THAT  YOU ARE SUPPORTING MOST OF YOUR BODY WEIGHT WITH YOUR LEGS. IF THIS OCCURS, YOUR PERFORMANCE WILL BE TERMINATED. YOU MUST RETURN TO, AND PAUSE  IN,  THE  CORRECT  STARTING  POSITION BEFORE CONTINUING. IF YOU REST ON THE GROUND OR  RAISE  EITHER  HAND  OR  FOOT  FROM  THE GROUND, YOUR PERFORMANCE WILL BE TERMINATED. YOU  MAY  REPOSITION  YOUR  HANDS  AND/OR  FEET DURING THE EVENT AS LONG AS THEY REMAIN IN CONTACT  WITH  THE  GROUND  AT  ALL  TIMES. CORRECT  PERFORMANCE  IS  IMPORTANT.  YOU  WILL HAVE  TWO  MINUTES  IN  WHICH  TO  DO  AS  MANY PUSH-UPS    AS    YOU    CAN.    WATCH    THIS DEMONSTRATION.",
    "WHAT ARE YOUR QUESTIONS?",
    "THE SIT-UP EVENT MEASURES THE ENDURANCE OF THE ABDOMINAL AND HIP-FLEXOR MUSCLES. ON THE COMMAND  'GET  SET',  ASSUME  THE  STARTING POSITION  BY  LYING  ON  YOUR  BACK  WITH  YOUR KNEES BENT AT A 90-DEGREE ANGLE. YOUR FEET MAY  BE  TOGETHER  OR  UP  TO  12  INCHES  APART. ANOTHER  PERSON  WILL  HOLD  YOUR  ANKLES  WITH THE HANDS ONLY. NO OTHER METHOD OF BRACING OR HOLDING THE FEET IS AUTHORIZED. THE HEEL IS THE ONLY PART OF YOUR FOOT THAT MUST STAY IN  CONTACT  WITH  THE  GROUND.  YOUR  FINGERS MUST BE INTERLOCKED BEHIND YOUR HEAD AND THE BACKS OF YOUR HANDS MUST TOUCH THE GROUND. YOUR  ARMS  AND  ELBOWS  NEED  NOT  TOUCH  THE GROUND.  ON  THE  COMMAND  'GO',  BEGIN  RAISING YOUR UPPER BODY FORWARD TO, OR BEYOND, THE VERTICAL  POSITION.  THE  VERTICAL  POSITION MEANS  THAT  THE  BASE  OF  YOUR  NECK  IS  ABOVE THE  BASE  OF  YOUR  SPINE.  AFTER  YOU  HAVE REACHED OR SURPASSED THE VERTICAL POSITION, LOWER  YOUR  BODY  UNTIL  THE  BOTTOM  OF  YOUR SHOULDER BLADES TOUCH THE GROUND. YOUR HEAD, HANDS, ARMS, OR ELBOWS DO NOT HAVE TO TOUCH THE GROUND. AT THE END OF EACH REPETITION, THE SCORER WILL STATE THE NUMBER OF SIT-UPS YOU  HAVE  CORRECTLY  COMPLETED.  A  REPETITION WILL  NOT  COUNT  IF  YOU  FAIL  TO  REACH  THE VERTICAL POSITION, FAIL TO KEEP YOUR FINGERS INTERLOCKED  BEHIND  YOUR  HEAD,  ARCH  OR  BOW YOUR  BACK  AND  RAISE  YOUR  BUTTOCKS  OFF  THE GROUND TO RAISE YOUR UPPER BODY, OR LET YOUR KNEES  EXCEED  A  90-DEGREE  ANGLE.  IF  A REPETITION  DOES  NOT  COUNT,  THE  SCORER  WILL REPEAT  THE  NUMBER  OF  YOUR  LAST  CORRECTLY PERFORMED  SIT-UP.  THE  UP  POSITION  IS  THE ONLY  AUTHORIZED  REST  POSITION.  IF  YOU  STOP AND  REST  IN  THE  DOWN  (STARTING)  POSITION, THE EVENT WILL BE TERMINATED. AS LONG AS YOU MAKE A CONTINUOUS PHYSICAL EFFORT TO SIT UP, THE  EVENT  WILL  NOT  BE  TERMINATED.  YOU  MAY NOT  USE  YOUR  HANDS  OR  ANY  OTHER  MEANS  TO PULL OR PUSH YOURSELF UP TO THE UP (RESTING) POSITION  OR  TO  HOLD  YOURSELF  IN  THE  REST POSITION. IF YOU DO SO, YOUR PERFORMANCE IN THE  EVENT  WILL  BE  TERMINATED.  CORRECT PERFORMANCE IS IMPORTANT. YOU WILL HAVE TWO MINUTES  TO  PERFORM  AS  MANY  SIT-UPS  AS  YOU CAN. WATCH THIS DEMONSTRATION.",
    "WHAT ARE YOUR QUESTIONS?",
    "THE TWO-MILE RUN IS USED TO ASSESS YOUR AEROBIC FITNESS AND YOUR LEG MUSCLES' ENDURANCE. YOU MUST COMPLETE THE RUN WITHOUT ANY PHYSICAL HELP. AT THE START, ALL SOLDIERS WILL LINE UP BEHIND THE STARTING LINE. ON THE COMMAND 'GO,' THE CLOCK WILL START. YOU WILL BEGIN RUNNING AT YOUR OWN PACE.",
    "YOU ARE BEING TESTED ON YOUR ABILITY TO COMPLETE THE 2-MILE COURSE IN THE SHORTEST TIME POSSIBLE.  ALTHOUGH  WALKING  IS  AUTHORIZED,  IT  IS  STRONGLY  DISCOURAGED.  IF  YOU  ARE PHYSICALLY HELPED IN ANY WAY (FOR EXAMPLE, PULLED, PUSHED, PICKED UP, AND/OR CARRIED) OR LEAVE  THE  DESIGNATED  RUNNING  COURSE  FOR  ANY  REASON,  YOU  WILL  BE  DISQUALIFIED.  (IT  IS LEGAL TO PACE A SOLDIER DURING THE 2-MILE RUN. AS LONG AS THERE IS NO PHYSICAL CONTACT WITH THE PACED SOLDIER AND IT DOES NOT PHYSICALLY HINDER OTHER SOLDIERS TAKING THE TEST, THE  PRACTICE  OF  RUNNING  AHEAD  OF,  ALONG  SIDE  OF,  OR  BEHIND  THE  TESTED  SOLDIER,  WHILE SERVING  AS  A  PACER,  IS  PERMITTED.  CHEERING  OR  CALLING  OUT  THE  ELAPSED  TIME  IS  ALSO PERMITTED.)  THE  NUMBER  ON  YOUR  CHEST  IS  FOR  IDENTIFICATION.  YOU  MUST  MAKE  SURE  IT  IS VISIBLE AT ALL TIMES. TURN IN YOUR NUMBER WHEN YOU FINISH THE RUN. THEN, GO TO THE AREA DESIGNATED FOR THE COOL-DOWN AND STRETCH. DO NOT STAY NEAR THE SCORERS OR THE FINISH LINE AS THIS MAY INTERFERE WITH THE TESTING.",
    "WHAT ARE YOUR QUESTIONS ON THIS EVENT?"
]


// https://www.appcoda.com/text-to-speech-ios-tutorial/

class PlayPauseButton: UIButton {
    var paragraphs: [UILabel]?
    
    private let systemButton = UIButton(type: .system)
    private let playIcon = UIImage(named: "play")?.withRenderingMode(.alwaysTemplate)
    private let stopIcon = UIImage(named: "stop")?.withRenderingMode(.alwaysTemplate)
    
    init() {
        super.init(frame: CGRect.zero)
        
        self.tintColor = systemButton.tintColor
        self.setTitleColor(systemButton.titleColor(for: .normal), for: .normal)
        self.setImage(playIcon, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isPlaying: Bool = false
    {
        didSet {
            print("did set", self.isPlaying)
            if(self.isPlaying) {
                //self.setTitle("Stop", for: .normal)
                self.setImage(stopIcon, for: .normal)
            } else {
                //self.setTitle("Play", for: .normal)
                self.setImage(playIcon, for: .normal)
            }
        }
    }
}

class SpeechUtterance: AVSpeechUtterance {
    var label: UILabel?
    var controlButton: PlayPauseButton?
}

class InstructionsViewController: UIViewController, UIScrollViewDelegate, AVSpeechSynthesizerDelegate  {
    
    let label = UILabel()
    let speechSynthesizer = AVSpeechSynthesizer()
    let scrollview = UIScrollView()
    let stack = UIStackView()
    var lastPressedButton: PlayPauseButton?
    
    var request: NSBundleResourceRequest {
        willSet {
            /* this should only happen if we have an error since we can't do miltiple beginAccessingResources */
            self.request.endAccessingResources()
        }
    }
    var hasAddedVideos = false
    var shouldAddVideos = false {
        didSet {
            self.reloadView()
        }
    }
    var isLoading = false {
        didSet {
            if(self.isViewLoaded) {
                DispatchQueue.main.async {
                    if(self.isLoading) {
                        self.downloadVideosButton.isEnabled = false
                        self.downloadStatus.startAnimating()
                    } else {
                        self.downloadVideosButton.isEnabled = true
                        self.downloadStatus.stopAnimating()
                    }
                }
            }
        }
    }

    func reloadView() {
        if(self.isViewLoaded) {
            DispatchQueue.main.async {
                print("reloading view")
                
                if self.shouldAddVideos {
                    if(self.addAllVideos())
                    {
                        self.downloadStack.removeFromSuperview()
                        self.hasAddedVideos = true
                    } else {
                        let alert = UIAlertController(title: "Error", message: "Unable to add videos", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: { _ in
                            self.reloadView()
                        }))
                        self.present(alert, animated: true, completion: nil)
                        self.request = InstructionsViewController.newRequest
                        self.shouldAddVideos = false
                    }
                }
            }
        }
    }
    
    private static var newRequest: NSBundleResourceRequest {
        var s = Set(InstructionsViewController.videos)
        s.insert("video")
        return NSBundleResourceRequest(tags: s)
    }
    
    let downloadStack = UIStackView()
    let downloadVideosButton = UIButton(type: .system)
    let downloadStatus = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    static let videos = ["deadlift", "powerthrow", "pushup", "sprint", "legtuck", "run"]
    let videos = InstructionsViewController.videos
    
    init() {
        self.request = InstructionsViewController.newRequest
        
        super.init(nibName: nil, bundle: nil)
        
        /*
        self.preloadVideos()
        
        NotificationCenter.default.addObserver(self, selector: #selector(lowdisk), name: .NSBundleResourceRequestLowDiskSpace, object: nil)
 */
    }
    
    @objc func lowdisk() {
        print("low disk")
        if(self.isViewLoaded && self.isLoading) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Low disk", message: "Warning, you are running out of disk space", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: { _ in
                    self.reloadView()
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func preloadVideos() {
        print("preloading")
        self.isLoading = true
        self.request.conditionallyBeginAccessingResources(completionHandler: { resourceAvailable in
            if (resourceAvailable) {
                print("can begin access resources in preload", resourceAvailable)
                self.isLoading = false
                self.shouldAddVideos = true
            }
            else {
                self.request.beginAccessingResources(completionHandler: {error in
                    self.isLoading = false
                    if(error == nil) {
                        print("can begin to access resources in preload 2")
                        self.shouldAddVideos = true
                    } else {
                        print("failed to access resources from preload")
                        self.request = InstructionsViewController.newRequest
                    }
                })
            }
        })
    }
    
    @objc func loadVideos() {
        self.reloadView()
        
        if(!self.isLoading && !self.shouldAddVideos && !self.hasAddedVideos) {
               self.isLoading = true
                self.request.loadingPriority = NSBundleResourceRequestLoadingPriorityUrgent
            self.request.conditionallyBeginAccessingResources(completionHandler: { resourceAvailable in
                if (!resourceAvailable) {
                    self.request.beginAccessingResources(completionHandler: { error in
                        self.isLoading = false
                        if let e = error {
                            self.request = InstructionsViewController.newRequest
                            
                            let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: { _ in
                                self.reloadView()
                            }))
                            alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: {_ in self.loadVideos()}))
                            DispatchQueue.main.async {
                                self.present(alert, animated: true, completion: nil)
                            }
                        } else {
                            print("can begin to access resources 2")
                            self.shouldAddVideos = true
                        }
                    })
                }
                else{
                    self.shouldAddVideos = true
                    self.isLoading = false
                }
            })
        }
    }
    
    @objc func defaultsChanged(){
        print("defaults did change", UserDefaults.standard.bool(forKey: "loud_sound"))
        
        if UserDefaults.standard.bool(forKey: "respect_mute") {
            do {
                try AVAudioSession.sharedInstance().setActive(false)
            }
            catch let error as NSError {
                print("Error: Could not setActive to true: \(error), \(error.userInfo)")
            }
        } else {
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: .spokenAudio, options: .mixWithOthers)
            }
            catch let error as NSError {
                print("Error: Could not set audio category: \(error), \(error.userInfo)")
            }
            
            do {
                try AVAudioSession.sharedInstance().setActive(true)
            }
            catch let error as NSError {
                print("Error: Could not setActive to true: \(error), \(error.userInfo)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(defaultsChanged), name: UserDefaults.didChangeNotification, object: nil)
        
        if #available(iOS 13.0, *) {
            self.view.backgroundColor = UIColor.systemBackground
        } else {
            self.view.backgroundColor = .white
        }
        
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.delegate = self
        self.view.addSubview(scrollview)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[scrollview]-|", options: .alignAllCenterY, metrics: nil, views: ["scrollview": scrollview]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[scrollview]-|", options: .alignAllCenterY, metrics: nil, views: ["scrollview": scrollview]))
        
        stack.axis = NSLayoutConstraint.Axis.vertical
        //stack.alignment = UIStackViewAlignment.Fill
        //stack.distribution = UIStackViewDistribution.FillProportionally
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(
            item: stack,
            attribute: NSLayoutConstraint.Attribute.topMargin,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: scrollview,
            attribute: NSLayoutConstraint.Attribute.topMargin,
            multiplier: 1.0,
            constant: 0)
        let leftConstraint = NSLayoutConstraint(
            item: stack,
            attribute: NSLayoutConstraint.Attribute.leading,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: scrollview,
            attribute: NSLayoutConstraint.Attribute.leading,
            multiplier: 1.0,
            constant: 0)
        let rightConstraint = NSLayoutConstraint(
            item: stack,
            attribute: NSLayoutConstraint.Attribute.trailing,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: scrollview,
            attribute: NSLayoutConstraint.Attribute.trailing,
            multiplier: 1.0,
            constant: 0)
        let widthCon = NSLayoutConstraint(
            item: stack,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: scrollview,
            attribute: NSLayoutConstraint.Attribute.width,
            multiplier: 1.0,
            constant: 0)
        scrollview.addSubview(stack)
        scrollview.addConstraint(widthCon)
        scrollview.addConstraint(topConstraint)
        scrollview.addConstraint(leftConstraint)
        scrollview.addConstraint(rightConstraint)
        
        let playAll = PlayPauseButton()
        playAll.setTitle("All", for: .normal)
        playAll.addTarget(self, action: #selector(play), for: .touchDown)
        playAll.paragraphs = []
        stack.addArrangedSubview(playAll)

        for paragraph in speech {
            let button = PlayPauseButton()
            button.setTitle("Section", for: .normal)
            button.addTarget(self, action: #selector(play), for: .touchDown)
            stack.addArrangedSubview(button)
            let pLabel = UILabel()
            playAll.paragraphs?.append(pLabel)
            button.paragraphs = [pLabel]
            pLabel.text = paragraph
            pLabel.numberOfLines = 0
            stack.addArrangedSubview(pLabel)
        }
        /*
        if(!self.addAllVideos()) {
            print("adding download button")
            downloadStatus.hidesWhenStopped = true
            downloadVideosButton.setTitle("Download Videos (207.3 MB)", for: .normal)
            downloadVideosButton.setImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)
            downloadVideosButton.imageView?.contentMode = .scaleAspectFit
            downloadVideosButton.addTarget(self, action: #selector(loadVideos), for: .touchDown)
            downloadStack.addArrangedSubview(downloadVideosButton)
            downloadStack.addArrangedSubview(downloadStatus)
            stack.insertArrangedSubview(downloadStack, at: 0)
            
            if(self.isLoading) {
                self.downloadVideosButton.isEnabled = false
                self.downloadStatus.startAnimating()
            }
        }*/
    }
    
    func addAllVideos() -> Bool {
        var finalStatus = true
        var addedVideoControllers = [AVPlayerViewController]()
        
        if(!self.hasAddedVideos)
        {
            var videoIndex = 0
            
            for (i, subview) in self.stack.arrangedSubviews.enumerated()
            {
                if let label = subview as? UILabel
                {
                    if let labelText = label.text
                    {
                        if (labelText.hasPrefix("ACFT EVENT #") || labelText.hasPrefix("ACFT TEST EVENT #"))
                        {
                            if videoIndex < videos.count {
                                print("adding video", self.videos[videoIndex], i)
                                if let view = self.addVideo(self.videos[videoIndex], atIndex: i+videoIndex-1) {
                                    addedVideoControllers.append(view)
                                } else {
                                    print("failed to add a video")
                                    finalStatus = false
                                    break
                                }
                                videoIndex = videoIndex + 1
                            }
                        }
                    }
                }
            }
        }
        
        if(!finalStatus) {
            for controller in addedVideoControllers {
                controller.removeFromParent()
                controller.view.removeFromSuperview()
            }
        }
        
        return finalStatus
    }
    
    func addVideo(_ name: String, atIndex index: Int = -1) -> AVPlayerViewController?
    {
        guard let path = self.request.bundle.path(forResource: name, ofType:"mp4") else {
            print(name, "not found")
            return nil
        }
        
        let videoURL:URL = URL(fileURLWithPath: path)
        let avPlayer = AVPlayer(url: videoURL)
        let avPlayerController = AVPlayerViewController()
        avPlayerController.showsPlaybackControls = true
        avPlayerController.player = avPlayer
        //avPlayerController.view.frame = self.view.frame
        //avPlayerController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChild(avPlayerController)
        //avPlayer.play()
        if(index == -1) {
            stack.addArrangedSubview(avPlayerController.view)
        } else {
            stack.insertArrangedSubview(avPlayerController.view, at: index)
        }
        //avPlayerController.view.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        avPlayerController.view.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        
        return avPlayerController
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        if let su = utterance as? SpeechUtterance {
            su.controlButton?.isPlaying = true
        }
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        if let su = utterance as? SpeechUtterance {
            su.controlButton?.isPlaying = true
        }
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        if let su = utterance as? SpeechUtterance {
            su.label?.attributedText = NSAttributedString(string: utterance.speechString)
            su.controlButton?.isPlaying = false
        }
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        if let su = utterance as? SpeechUtterance {
            print("is a speech utterance")
            let mutableAttributedString = NSMutableAttributedString(string: utterance.speechString)
            mutableAttributedString.addAttribute(.foregroundColor, value: UIColor(displayP3Red: 246.0/255.0, green: 193.0/255.0, blue: 67.0/255.0, alpha: 1.0), range: characterRange)
            su.label?.attributedText = mutableAttributedString
        }
        
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        print("did cancel")
        if let su = utterance as? SpeechUtterance {
            su.label?.attributedText = NSAttributedString(string: utterance.speechString)
            su.controlButton?.isPlaying = false
        }
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("did finish")
        if let su = utterance as? SpeechUtterance {
            su.label?.attributedText = NSAttributedString(string: utterance.speechString)
            su.controlButton?.isPlaying = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //print("Laying out", self.view.frame, self.stack.frame, self.stack.frame.height)
        self.scrollview.contentSize = CGSize(width: self.stack.frame.width, height: self.stack.frame.height + (UIFont.systemFontSize * 2)) // NO idea why if I don't have extra space at the bottom things get cut off
    }
    
    @objc func play(_ sender: PlayPauseButton) {
        print("Clicked play/pause", speechSynthesizer.isSpeaking, speechSynthesizer.isPaused)
        
        speechSynthesizer.stopSpeaking(at: .immediate)
        
        if (!sender.isPlaying)
        {
            if let paragraphs = sender.paragraphs {
                for paragraph in paragraphs {
                    let speechUtterance = SpeechUtterance(string: paragraph.text ?? "")
                    speechUtterance.label = paragraph
                    speechUtterance.controlButton = sender
                    //speechUtterance.rate = AVSpeechUtteranceDefaultSpeechRate * 1.01
                    //speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                    speechSynthesizer.delegate = self
                    speechSynthesizer.speak(speechUtterance)
                }
            }
        }
        
        lastPressedButton = sender
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        //print("scrolling")
//        self.dismissKeyboard()
//    }
}
