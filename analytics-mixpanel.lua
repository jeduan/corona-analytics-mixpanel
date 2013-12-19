local M = {}
local cacharro = require 'vendor.cacharro.cacharro'
local mixpanel = require 'vendor.mixpanel.mixpanel'
local log = require 'vendor.log.log'
local logging = false

M.debug = false
function M.init(key, params)
	assert(key and key ~= '', 'There is no analyticsToken set up')
	mixpanel.initMixpanel(key, params)
	logging = true
end

function M.logEvent(name, params)
	assert(logging, 'You have not inited the analytics module. Please call init(KEY) before')

	if M.debug then
		log('logging event ' .. name, params or '')
	end

	if not cacharro.isSimulator then
		mixpanel.track(name, params)
	end
end

return setmetatable(M, {__index = mixpanel})
