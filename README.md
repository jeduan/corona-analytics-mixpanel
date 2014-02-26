# corona-mixpanel-analytics

Drop-in replacement to use Mixpanel with Corona's [analytics API](http://docs.coronalabs.com/api/library/analytics/index.html)

## Installation
Either install using bower or [download a release tarball](https://github.com/jeduan/corona-analytics-mixpanel/releases)

## Usage

Just require `mixpanel-analytics` whenever you would require `analytics`.

The first time you use analytics, you will need to call init with your mixpanel token.


```lua
local analytics = require 'vendor.analytics-mixpanel.analytics-mixpanel'

analytics.init("YOUR_MIXPANEL_TOKEN")
analytics.logEvent('eventID')
analytics.logEvent('eventID', {
	params = ''
})
```

## Advanced usage

You can use the underlying [mixpanel](https://github.com/jeduan/corona-mixpanel) methods by requiring it.

```lua
-- helpers/analytics.lua
local analytics = require 'vendor.analytics-mixpanel.analytics-mixpanel'
local mixpanel = require 'vendor.mixpanel.mixpanel'

analytics.init("YOUR_MIXPANEL_TOKEN")
mixpanel.registerSuperProperties({
  gameName = 'My Corona Game',
  version = '1.0'
})

return analytics
```

And then whenever you want to track an event
```lua
local analytics = require 'helpers.analytics'
analytics.logEvent('gameEnded', {level = 1, time = 20})
```

## Super properties sent by default

This library tries to mimic Mixpanel's usual properties. It gets data from Corona's `system.getInfo`

  * $os: system.getInfo('platformName')
  * $model: system.getInfo('model')
  * $os_version: system.getInfo('platformVersion')
  * $screen_height: display.pixelHeight
  * $screen_width: display.pixelWidth

on iOS

  * $ios_ifa: system.getInfo('iosAdvertisingIdentifier')
  * $ios_device_model: system.getInfo('architectureInfo')

on Android
  * $screen_dpi: system.getInfo('androidDisplayXDpi')
  * $app_version: system.getInfo('androidAppVersionCode')

### Replacing the default identifier

This is required in case you need to comply with special laws. (i.e. COPPA)

```lua
local analytics = require 'vendor.analytics-mixpanel.analytics-mixpanel'
local mixpanel = require 'vendor.mixpanel.mixpanel'

mixpanel.distinctId = function()
	return os.time()
end
```