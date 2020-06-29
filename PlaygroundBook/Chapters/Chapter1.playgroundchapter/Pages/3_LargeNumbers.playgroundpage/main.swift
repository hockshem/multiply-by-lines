/*:
 # Carrying
 Remember the first time that you were learning addition, say, `15 + 15`, and your teacher asked you to bring the ten over to the next column to the left after doing `5 + 5` in the question? 🤯
 
 That applies to this multiplication method! For the intersection points that are **more than ten** in any group, you will need to carry the ten over to the group to the left.
 
 Say the question is `13 x 14`, you finished drawing the figure and noticed that there are 12 intersection points in the rightmost group.
 
 ![Step 1](PageThreeStepOne.jpeg)
 
 You will need to carry the `1` over to the group in the middle. There are originally seven intersection points in this group, adding `1` to this number will give us an eight.
 
 ![Step 2](PageThreeStepTwo.jpeg)
 
 Finally, reading from left to right, we get the answer, `182`.
 
 ![Step 3](PageThreeStepThree.jpeg)
 
 # Handling large numbers
 You may have noticed that it gets a bit messy when you were counting the intersection points that `3 x 4` yields just now. In fact, the figure will be more unreadable as the numbers in the question get larger. 😩
 
 But don't be despair! I've got a workaround to share! 😏
 
 Say we have the question `19 x 12` here, we can substitute the `9` in `19` with a single line in another color, similar to how we have handled the zeros.
 
 ![Step 4](PageThreeStepFour.jpeg)
 
 When some other lines intersect with the line representing the nine, we consider that intersection point as **nine** instead of a one. Therefore, in the rightmost group, we have a sum of 18 and will need to carry the `1` to the group in the middle. The same rule applies to the group in the middle.
 
 ![Step 5](PageThreeStepFive.jpeg)
 
 The answer is `228`! Easy right? 🥳
 
 ![Step 6](PageThreeStepSix.jpeg)
 
 I know you are eager to try this out now, go on!
 
 * Callout(Exercise):
 Use the Japanese Multiplication Method to solve the question given. You will have to:
    1. Draw the solution on the drawing area. For readability, you are suggested to use a ruler.
    2. Assign the answer that you get to `answer`.
 
 - Note: 🗒
    * When drawing lines, use a different color to indicate a large number. Don't forget to substitute the original number back when counting intersections!
    * Tap and hold the drawing area to clear the drawings.
 */


let question = "19 x 11"
var answer: Int = /*#-editable-code*/<#T##Your answer goes here!##Int#>/*#-end-editable-code*/

//#-hidden-code
import PlaygroundSupport
guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
    fatalError("Always-on live view not configured in this page's LiveView.swift.")
}
remoteView.send(.string(String(answer)))
//#-end-hidden-code
