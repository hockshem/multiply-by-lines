/*:
 # Welcome to Math class!
 Hey, don't fall asleep yet! This is no ordinary Math class! I promise you will find some fun here! 😜
 
 I'm going to show you the **Japanese Multiplication Method**, where you can solve multiplication problems by just drawing.
 
 Yes, you read it correctly, you really just need to draw and count the lines that you have drawn.
 
 ## Let's get started!
 Say the math problem that you are given is `12 x 13`, you will need to draw sets of parallel lines representing each digit in the multiplicand and the multiplier, which is `12` and `13` respectively in this case.
 
 Let's start by representing the multiplicand in lines. For the `1` in `12`, you will need to draw **one** slanted line.
 
 ![Step 1](PageOneStepOne.jpeg)
 
 Leave some space and for the `2` in `12`, draw **two** more lines parallel to line that you have just drawn.
 
 ![Step 2](PageOneStepTwo.jpeg)
 
 And you are done with the multiplicand. Now, time to draw the multiplier.
 
 For the `1` in `13`, draw **one** slanted line **perpendicular** to the lines representing the multiplicand.
 
 ![Step 3](PageOneStepThree.jpeg)
 
 Again, leave some space and draw **three** more lines parallel to the line that you have just drawn. You will get a figure like this:
 
 ![Step 4](PageOneStepFour.jpeg)
 
 ## Solution
 As you may have already noticed, the solution to the question has already been generated!
 
 Group the intesection points vertically. You will get three groups here.
 
 ![Step 5](PageOneStepFive.jpeg)
 
 Count the total intersections in each group and jot down the number that you get.
 
 ![Step 6](PageOneStepSix.jpeg)
 
 Read the numbers from left to right... Hurray! 🎉🎉🎉 That's the answer! 🤩
 
 It's your turn now to try out this method!
 
 * Callout(Exercise):
 Use the Japanese Multiplication Method to solve the question given. You will have to:
    1. Draw the solution on the drawing area. For readability, you are suggested to use a ruler.
    2. Assign the answer that you get to `answer`.
 
 - Note: 🗒
    * Tap and hold the drawing area to clear the drawings.
 */

let question = "13 x 13"
var answer: Int = /*#-editable-code*/<#Your answer goes here!#>/*#-end-editable-code*/

//#-hidden-code
import PlaygroundSupport
guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
    fatalError("Always-on live view not configured in this page's LiveView.swift.")
}
remoteView.send(.string(String(answer)))
//#-end-hidden-code




