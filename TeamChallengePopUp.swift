
import UIKit
import AVFoundation

class TeamChallengePopUp: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var teamID: Int?
    var game: Int?
    var titleNumber: Int?
    var timer = Timer()
    var seconds = 46
    var soundPlayer = AVAudioPlayer()
    var audioArray = ["airHorn"]


    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.layer.masksToBounds = true
        timeLabel.layer.cornerRadius = 25
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(WordsCharadesHum.startTimer), userInfo: nil, repeats: true)
        
        if let titleNr = titleNumber{
            subjectLabel.text = LocalDataBase().teamChallengeList[titleNr].title
            textView.text = LocalDataBase().teamChallengeList[titleNr].challenge
        }
        
    }
    

    @IBAction func doneButton(_ sender: UIButton) {
        timer.invalidate()
        
        
    }
    func playMusic(){
        do{
            soundPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: audioArray[0], ofType: "mp3")!))
            soundPlayer.prepareToPlay()
        }
        catch{
            print(error)
        }
        soundPlayer.play()
    }
    
    
    @objc func startTimer() {
        seconds=seconds-1
        timeLabel.text = String(seconds)
        
        if (seconds == 0){
            playMusic()
            timer.invalidate()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AlertView {
            if let team = teamID{
                destination.teamID = team
            }
        }
    }
}






