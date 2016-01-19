music = {
	thread = love.thread.newThread("musicloader_thread.lua"),
	toload = {},
	loaded = {},
	list = {},
	list_fast = {},
	pitch = 1,
}

music.stringlist = table.concat(music.toload, ";")

--adaptation for the channel API
love.thread.getChannel("musiclist")
love.thread.getChannel("sources")


function music:init()
	self.thread:start()
end

function music:load(musicfile) -- can take a single file string or an array of file strings
	if type(musicfile) == "table" then
		for i,v in ipairs(musicfile) do
			self:preload(v)
		end
	else
		self:preload(musicfile)
	end
	self.stringlist = table.concat(self.toload, ";")
	love.thread.getChannel("musiclist"):push(self.stringlist)
end

function music:preload(musicfile)
	if self.loaded[musicfile] == nil then
		self.loaded[musicfile] = false
		table.insert(self.toload, musicfile)
	end
end

function music:play(name)
	print("play")
	if name and soundenabled then
		if self.loaded[name] == false then
			local source = love.thread.getChannel("sources"):pop()
			self:onLoad(source.name, source.source)
			while(name ~= source.name) do
				source = love.thread.getChannel("sources"):pop()
				self:onLoad(source.name, source.source)
			end
		end
		if self.loaded[name] then
			playsound(self.loaded[name])
		end
	end
end

function music:playIndex(index, isfast)
	local name = isfast and self.list_fast[index] or self.list[index]
	self:play(name)
end

function music:stop(name)
	if name and self.loaded[name] then
		love.audio.stop(self.loaded[name])
	end
end

function music:stopIndex(index, isfast)
	local name = isfast and self.list_fast[index] or self.list[index]
	self:stop(name)
end

function music:update()
	for i,v in ipairs(self.toload) do
		local source = love.thread.getChannel("sources"):pop()
		if source then
			self:onLoad(source.name, source.source)
		end
	end
	for name, source in pairs(self.loaded) do
		if source ~= false then
			source:setPitch(self.pitch)
		end
	end
	local err = self.thread:getError()
	if err then print(err) end
end

function music:onLoad(name, source)
	self.loaded[name] = source
	source:setLooping(true)
	source:setPitch(self.pitch)
end


music:load{
	"overworld",
	"overworld-fast",
	"underground",
	"underground-fast",
	"castle",
	"castle-fast",
	"underwater",
	"underwater-fast",
	"starmusic",
	"starmusic-fast",
	"princessmusic",
}

-- the original/default music needs to be put in the correct lists
for i,v in ipairs(music.toload) do
	if v:match("fast") then
		table.insert(music.list_fast, v)
	elseif not v:match("princessmusic") then
		table.insert(music.list, v)
	end
end

music:init()
