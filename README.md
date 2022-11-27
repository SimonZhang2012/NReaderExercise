## Notes for Review/Test

- Xcode 14.1 and latest SDK, no 3rd party library
- Project name is NReader - to avoid exposing the company name since this is a public repo


## Technical Discussions
- This App use MVP+I (interactor)
	- The reason for choosing MVP over MVVM is to avoid using any binding framework
	- Could be easily transformed to MVVM since VM and presenter do similar things
	
## Finished features
- Get articles from API endpoints
	- Module decoding
	- Error handling when decoding
- Display error alert if internet connection is off
- Display articles in UICollectionViewController
- Articles are sorted by timeStamp, display timeStamp in human readable string
- Custom cell design -  Briefly working on iPhone and iPad, a little bit tuned UI - not perfect
- Display articles in SafariViewController if user tap the cell
- Display the  smallest image, 
	- load image asynchronously 
	- image ached
- Unit test for presenter and interactor
- two UITests for demo

## Could be improved, but not done here due to the time limitation
- cell layout is not perfect tuned for all device classes
- could have more test cases
- some properties are ignored when decoding the json
- can improve the image cache to save to file directory


