/*:
 # Time for some Advanced Examples!
 Questions were too easy for you? Let's recall the first time you saw a variable in an algebraic expression, were you as perplexed as me, wondering what to do with the strange `x` and `y` in the expressions? 😵
 
 What if I tell you that the we can solve these expressions using the **Japanese Multiplication Method**? 😏
 
 We can handle the variables similar to how we substitute the `9` with a single line in different color. We just really need to be careful and consider its actual value when counting the intersections.
 
 Let's dive right into the example.
 
 If you are asked to solve the algebraic expression `(2x + y)(x + y)`, you will be representing `x` with a single line in black, and `y` in a single line in a color other than black, say, gray.
 
 Therefore, to represent `2x`, you will need to draw **two black lines**.
 
 ![Step 1](PageFourStepOne.jpeg)
 
 Leave some space, and draw **a gray line** to represent the following `y`.
 
 ![Step 2](PageFourStepTwo.jpeg)
 
 To depict the second term in the equation, `x + y`, you will have to draw **a single black line** and a **single gray line** perpendicular to the lines representing the first term that you have just drawn.
 
 ![Step 3](PageFourStepThree.jpeg)
 
 Group the points vertically. In the rightmost group, notice that there is an intersection between **two gray lines**. Recall that a single gray line holds the value of `y`, so the product of two gray lines will be `y^2`.
 
 ![Step 4](PageFourStepFour.jpeg)
 
 In the middle, there are three intersection points. All of them are formed by **a single gray line** and **a single black line**. Since each of them yields the value of `xy`, you will have `3xy` in this group.
 
 ![Step 5](PageFourStepFive.jpeg)
 
 Lastly, in the leftmost group, all two intersection points are formed by **two black lines**, each of which gives you a `x^2`. Adding them together gives you `2(x^2)`.
 
 ![Step 6](PageFourStepSix.jpeg)
 
 Voila, you've got the final answer!
 
 Come on, it's your turn to have some fun! 😜
 
 * Callout(Exercise):
 Use the Japanese Multiplication Method to solve the question given. You will have to:
    1. Draw the solution on the drawing area. For readability, you are suggested to use a ruler.
    2. Assign the answer that you get to `answer`.
 
 - Note: 🗒
    * Use different colors to represent different variables in the algebraic expression. Calculate the product of the numbers represented by the lines when there is an intersection point.
    * Your answer in this exercise will be in the **String** format.
    * Use `^2` to represent a square. You will need to wrap the variables with parentheses when they are squared. For instance, the answer to the last example would be `2(x^2)+3xy+(y^2)`.
    * Tap and hold the drawing area to clear the drawings.
 */

let question = "(2x + y)(x + 2y)"
var answer: String = /*#-editable-code*/<#T##Your answer goes here!##String#>/*#-end-editable-code*/

//#-hidden-code
import PlaygroundSupport
guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
    fatalError("Always-on live view not configured in this page's LiveView.swift.")
}
remoteView.send(.string(String(answer)))
//#-end-hidden-code
