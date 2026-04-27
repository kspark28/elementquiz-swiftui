import SwiftUI

struct ElementQuizView: View {
    // MARK: - State Properties
    // In SwiftUI, we don't use @IBOutlet. Instead, we use @State. 
    // When these values change, the UI re-renders automatically.
    let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    
    @State private var currentElementIndex = 0
    @State private var isAnswerVisible = false
    
    // MARK: - Computed Properties
    private var currentElementName: String {
        elementList[currentElementIndex]
    }
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Element Quiz")
                .font(.largeTitle)
                .fontWeight(.black)
            
            // Image View Replacement
            // We use the element name directly to fetch the image
            Image(currentElementName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 140)
                .cornerRadius(12)
                .shadow(radius: 5)
            
            // Answer Label Replacement
            // Instead of manually setting .text, we use a conditional expression
            Text(isAnswerVisible ? currentElementName : "?")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.primary)
            
            HStack(spacing: 30) {
                // Show Answer Button
                Button(action: showAnswer) {
                    Text("Show Answer")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                // Next Element Button
                Button(action: nextElement) {
                    Text("Next Element")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
    
    // MARK: - Logic Methods
    // These replace the @IBActions from the old ViewController
    
    func showAnswer() {
        isAnswerVisible = true
    }
    
    func nextElement() {
        isAnswerVisible = false // Reset answer visibility for the next item
        currentElementIndex = (currentElementIndex + 1) % elementList.count
    }
}

// MARK: - Preview
struct ElementQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ElementQuizView()
    }
}
