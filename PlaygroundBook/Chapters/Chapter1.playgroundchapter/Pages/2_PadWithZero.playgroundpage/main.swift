/*:
 # Padding with Zeros
 Very often, we will need to deal with multiplication that involves different numbers of digit. Take `2 x 12` as an example: `2` has less digit than `12`.
 
 To draw the solution, you will need to pad `2` with a `0` so that their number of digits become the same. 😎
 
 ![Step 1](PageTwoStepOne.jpeg)
 
 When drawing line for a `0`, you can use another color to draw the line to remind yourself that this is indeed a 0️⃣.
 
 ![Step 2](PageTwoStepTwo.jpeg)
 
 Then, when counting the intersections, you **ignore** every intersection point where other lines cross the line representing the zero. In this question, obviously, our answer will be `24` instead of `144`.
 
 ![Step 3](PageTwoStepThree.jpeg)
 
 Go on, it's your turn now! I believe you can solve this real quick! 😊
 
 * Callout(Exercise):
 Use the Japanese Multiplication Method to solve the question given. You will have to:
    1. Draw the solution on the drawing area. For readability, you are suggested to use a ruler.
    2. Assign the answer that you get to `answer`.
 
 - Note: 🗒
    * Pad the number that has the less digits with zero.
    * Use a different color to draw the line representing the zero.
    * Ignore any intersections with this line.
    * Tap and hold the drawing area to clear the drawings.
 */

let question = "13 x 2"
var answer: Int = /*#-editable-code*/<#T##Your answer goes here!##Int#>/*#-end-editable-code*/

//#-hidden-code
import PlaygroundSupport
guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
    fatalError("Always-on live view not configured in this page's LiveView.swift.")
}
remoteView.send(.string(String(answer)))
//#-end-hidden-code
