## Build tools & versions used
I built the project with Xcode Version 13.4.1 (13F100)

## Steps to run the app
- Unzip the zipped folder
- Open the BlockTakeHomeProject folder
- Ensure you have Xcode Version 13.4.1 or above to run the project
- Double click on the BlockTakeHomeProject.xcworkspace file to open the project
- Select either a simulator or connect your device to your MacBook to see how the project runs on a device
- Click the play button at the top of the Xcode interface to run the project
- To refresh the collection view, pull the view downwards to reload the data.

## What areas of the app did you focus on?
I focused on the code architecture (MVVM), repository method for network call and programmatically used UIKit to build the interface. To display the data, I used a collection view.

## What was the reason for your focus? What problems were you trying to solve?
I focused on the areas because I wanted to build to clean code with easy unit testing and enhance reusability.

## How long did you spend on this project?
I spent roughly 8 hours on this project.

## Did you make any trade-offs for this project? What would you have done differently with more time?
I only wrote one unit test to ascertain that the network call was successful for this project. With more time I would have written more unit tests to cover all case scenarios.

## What do you think is the weakest part of your project?
I think the weakest parts of the project is that I didn't unit test my code and I didn't handle the error cases from the network call.

## Did you copy any code or dependencies? Please make sure to attribute them here!
For Dependencies, I used the following
-Alamofire (version 5.4.3) for asynchronous network call(s)
-SnapKit (version 5.0.1) to set constraints for the views
-Kingfisher (version 7.2.4) to asynchronously load the image into the image view

## Is there any other information you’d like us to know?
This is a good take home project. :)
