import UIKit
import SwiftUI // Added to support the new UI paradigm

// MARK: - LEGACY CODE (DO NOT CHANGE/DELETE)
class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    
    var currentElementIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateElement()
    }
    
    func updateElement() {
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
        
        answerLabel.text = "?"
    }

    @IBAction func showAnswer(_ sender: Any) {
        answerLabel.text = elementList[currentElementIndex]
    }
    
    @IBAction func next(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex >= elementList.count {
            currentElementIndex = 0
        }
        
        updateElement()
    }
}

// MARK: - NEW MODERN SwiftUI IMPLEMENTATION (ADDED)
/* TEACHING NOTE FOR JUNIORS: 
   Notice how the logic below mirrors the logic above, but replaces 
   manual UI updates with automatic State bindings.
*/

struct ElementQuizView: View {
    // Mirroring the original data
    let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    
    // State replaces the manual @IBOutlet updates
    @State private var currentElementIndex = 0
    @State private var isAnswerVisible = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Element Quiz")
                .font(.largeTitle.bold())
            
            // Replaces: imageView logic
            Image(elementList[currentElementIndex])
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            // Replaces: answerLabel.text logic
            Text(isAnswerVisible ? elementList[currentElementIndex] : "?")
                .font(.title)
            
            HStack {
                // Replaces: @IBAction showAnswer
                Button("Show Answer") {
                    isAnswerVisible = true
                }
                .buttonStyle(.borderedProminent)
                
                // Replaces: @IBAction next
                Button("Next Element") {
                    isAnswerVisible = false
                    currentElementIndex = (currentElementIndex + 1) % elementList.count
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
}

// MARK: - PREVIEW (ADDED)
struct ElementQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ElementQuizView()
    }
}
