# corona-mixpanel-analytics

Drop-in replacement to use Mixpanel with Corona's [analytics](http://docs.coronalabs.com/api/library/analytics/index.html) API

## Installation
Ensure the bower registry is `https://yogome-bower.herokuapp.com` and then `bower install analytics-mixpanel`

## Usage

```lua
local analytics = require 'mixpanel-analytics'

analytics.init("YOUR_MIXPANEL_TOKEN")
analytics.logEvent('eventID')
analytics.logEvent('eventID', {
	params = ''
})
```

## Replacing the default identifier

Just override analytics.distinctId

```lua
local analytics = require 'mixpanel-analytics'

analytics.distinctId = function()
	return os.time()
end
```

### TODO

 * Test it actually takes distinctId