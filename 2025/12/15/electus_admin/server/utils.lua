function Notify(src, text, type)
	TriggerClientEvent("ox_lib:notify", src, {
		title = L("gangs"),
		description = text,
		type = type,
	})
end

function Split(str, delimiter)
	local returnTable = {}
	for k, v in string.gmatch(str, "([^" .. delimiter .. "]+)") do
		returnTable[#returnTable + 1] = k
	end
	return returnTable
end

function GetUtils()
	if not Config.apiUrl then
		local weburl = ("https://%s/%s"):format(GetConvar("web_baseUrl", ""), GetCurrentResourceName())

		Config.apiUrl = weburl
	end

	return {
		config = Config,
		locale = GetAllLocales(),
	}
end

exports("GetUtils", GetUtils)

-- SetHttpHandler(function(request, response)
-- 	if request.method == "GET" and request.path == "/ping" then -- if a GET request was sent to the `/ping` path
-- 		response.writeHead(200, { ["Content-Type"] = "text/plain" }) -- set the response status code to `200 OK` and the body content type to plain text
-- 		response.send("pong") -- respond to the request with `pong`
-- 	else -- otherwise
-- 		response.writeHead(404) -- set the response status code to `404 Not Found`
-- 		response.send() -- respond to the request with no data
-- 	end
-- end)
