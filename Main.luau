--[[
Basically tricks exploiters into Banning themselves extremely effective

Made by z3ck200
]]
local FakeRE = {
	"FireMeltdown";"GiveAdmin";"Adonis_";"AdminGiver";"CallServer";"SS";"RunServerScript";"Freezedown";
	"FireServerSide";
}
-- ^^^^ The more fake remote event names added here the better it works. 

local REPath = game.ReplicatedStorage
-- ^^^^ If you have a dedicated folder for remote events specify here to make them blend in more.


for i,v in pairs(FakeRE) do
	if not REPath:FindFirstChild(v) then
		local RE = Instance.new("RemoteEvent",REPath)
		RE.Name = v
		RE.OnServerEvent:Connect(function(Player)
			if not Player:HasTag("Banned_") then
				Player:AddTag("Banned_")
				
				local function BanPlayer()
					
					local s,e = pcall(function()
						game.Players:BanAsync({
							UserIds = {Player.UserId},
							ApplyToUniverse = true,
							Duration = -1,
							DisplayReason = 'Banned for exploiting',
							PrivateReason = 'Fired fake remote event (Banned for exploiting)',
							ExcludeAltAccounts = false,
						})
					end)
					
					if not s then
						task.wait(0.2)
						BanPlayer()
					end
					
				end
			
				BanPlayer()
			end
		end)
	end
end
