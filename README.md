# Weather
📱 | Project Stub | (Swift 4.0/Xcode 9) - Weather App

## used resources ----------
https://github.com/SwiftyJSON/SwiftyJSON
https://github.com/Alamofire/Alamofire



## Fix for App Transport Security Override

```XML
	<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSExceptionDomains</key>
		<dict>
			<key>openweathermap.org</key>
			<dict>
				<key>NSIncludesSubdomains</key>
				<true/>
				<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
				<true/>
			</dict>
		</dict>
	</dict>
```




# Weather-Swift-
