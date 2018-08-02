# Weather
📱 | Project Stub | (Swift 4.1/Xcode 9.4.1) - Weather App

## Resources
https://github.com/SwiftyJSON/SwiftyJSON

https://github.com/Alamofire/Alamofire





#API https://openweathermap.org/

-----------


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



