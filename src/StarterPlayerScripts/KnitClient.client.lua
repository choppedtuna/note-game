local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

Knit.AddControllers(ReplicatedStorage.Controllers)

Knit.Start():andThen(function()
	print("KnitClient Started")
end):catch(warn)