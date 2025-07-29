import Foundation
import SwiftUI
import Vision


struct TextRecognizer {
    var recognizedText = ""
    var observations: [RecognizedTextObservation] = []


    init(imageResource: ImageResource) async {
        var request = RecognizeTextRequest()
        request.recognitionLevel = .accurate


        let image = UIImage(resource: imageResource)


        if let imageData = image.pngData(),
           let results = try? await request.perform(on: imageData) {
            observations = results
        }


        for observation in observations {
            let candidate = observation.topCandidates(1)


            if let observedText = candidate.first?.string {
                recognizedText += "\(observedText) "
            }
        }
    }
}


struct BoundsRect: Shape {
    let normalizedRect: NormalizedRect


    func path(in rect: CGRect) -> Path {
        let imageCoordinatesRect = normalizedRect.toImageCoordinates(rect.size, origin: .upperLeft)
        return Path(imageCoordinatesRect)
    }
}


struct TrailTheme: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            VStack {
                Image(.background)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxHeight: 250, alignment: .top)
                Spacer()
            }
            content
        }
    }
}


extension View {
    func trailTheme() -> some View {
        modifier(TrailTheme())
    }
}
