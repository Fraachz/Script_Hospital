--[[

		:::::::::: :::::::::      :::         :::      ::::::::  :::    ::: :::::::::            
		:+:        :+:    :+:   :+: :+:     :+: :+:   :+:    :+: :+:    :+:      :+:             
		+:+        +:+    +:+  +:+   +:+   +:+   +:+  +:+        +:+    +:+     +:+              
		:#::+::#   +#++:++#:  +#++:++#++: +#++:++#++: +#+        +#++:++#++    +#+               
		+#+        +#+    +#+ +#+     +#+ +#+     +#+ +#+        +#+    +#+   +#+                
		#+#        #+#    #+# #+#     #+# #+#     #+# #+#    #+# #+#    #+#  #+#                 
		###        ###    ### ###     ### ###     ###  ########  ###    ### ######### ########## 

                                    » CopyRight © 2020
                            » Script feito por » Sr. Fraachz_#9999

]]--

local marker_01 = createMarker(1177.558, -1323.772, 14.077 -1, "cylinder", 1.5, 0, 0, 255, 65)
local Blip = createBlip(1177.558, -1323.772, 14.077, 22, 2, 255, 255, 255, 255)

function pMsg(source)
    outputChatBox("#0037FF✘#ffffffINFO#0037FF✘➺ #ffffffOlá, você está no centro médico! Para ver sua saúde atual, de '#ffff00/saude#ffffff'.", source, 255, 255, 255, true)
end
addEventHandler("onMarkerHit", marker_01, pMsg)

function saudeCmd(source)
    local pLife = getElementHealth(source)
    if isElementWithinMarker(source, marker_01) then
        if pLife >= 50 then
            outputChatBox("#0037FF✘#ffffffINFO#0037FF✘➺ #ffffffVocê está com #ff0000"..pLife.."% #ffffffde saúde!", source, 255, 255, 255, true)
        else    
            outputChatBox("#0037FF✘#ffffffINFO#0037FF✘➺ #ffffffSua saúde está precária, use '#ffff00/recuperar#ffffff' e se cuide.", source, 255, 255, 255, true)
            outputChatBox("#0037FF✘#ffffffINFO#0037FF✘➺ #ffffffObs: você terá que desembolsar #00ff00R$ 1000,00 #ffffffpara a consulta!", source, 255, 255, 255, true)
        end
    else
        outputChatBox("#0037FF✘#ffffffINFO#0037FF✘➺ #ffffffVocê não está na clínica.", source, 255, 255, 255, true)
    end
end
addCommandHandler("saude", saudeCmd)

function recuperarCmd(source)
    local pLife = getElementHealth(source)
    local money = getPlayerMoney(source)
    if isElementWithinMarker(source, marker_01) then
        if pLife <= 50 then
            takePlayerMoney(source, 1000)
            setElementHealth(source, 100)
            outputChatBox("#0037FF✘#ffffffINFO#0037FF✘➺ #ffffffVocê foi recuperado, e a consulta custou #00FF00R$ 1000,00 #ffffff.", source, 255, 255, 255, true)
        else 
            outputChatBox("#0037FF✘#ffffffINFO#0037FF✘➺ #ffffffVocê não possui #00ff00dinheiro #ffffffsuficiente para pagar uma consulta!", source, 255, 255, 255, true)
        end
    else
        outputChatBox("#0037FF✘#ffffffINFO#0037FF✘➺ #ffffffVocê não está na clínica.", source, 255, 255, 255, true)
    end
end
addCommandHandler("recuperar", recuperarCmd)

function ChecarAnimo2(attacker)
	for i, player in pairs (getElementsByType("player")) do
		if not getElementData(player, "PlayerAnimo") then
			if getElementData(player, "PlayerCaido") then return end
				if getElementHealth(player) > 1 then
					if getElementHealth(player) <= 49 then 
						outputChatBox("#0037FF✘#ffffffINFO#0037FF✘➺ #ffffffVocê está doente, vá até a clínica!", player, 255, 255, 255, true)
						setElementData(player, "PlayerAnimo", true)
						  toggleControl (player, "sprint", false ) 
						toggleControl (player, "jump", false )
						toggleControl (player, "crouch", false )
						setPedWalkingStyle(player, 120)
					end
				end
		else
			setPedWalkingStyle(player,120)
			toggleControl (player, "sprint", false ) 
			toggleControl (player, "jump", false )
			toggleControl (player, "crouch", false )
		end
	end
end
setTimer(ChecarAnimo2, 200, 0)

function ChecarAnimo()
	for i, player in pairs (getElementsByType("player")) do
		if  getElementData(player, "PlayerAnimo") then
			if getElementHealth(player) >= 50 then
				setElementData(player, "PlayerAnimo", false)
				setPedAnimation(player, false)
				setPedWalkingStyle(player,0)
				toggleControl (player, "sprint", true ) 
				toggleControl (player, "crouch", true )
				toggleControl (player, "jump", true )
				setTimer ( setPedAnimation, 100, 1, player,  "GHANDS", "gsign2", 5000, false, false, false)
				setTimer ( setPedAnimation, 250, 1, player, nil)
			end
		end
	end
end
setTimer(ChecarAnimo, 200, 0)