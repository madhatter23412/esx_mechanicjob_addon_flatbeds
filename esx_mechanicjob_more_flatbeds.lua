Wrote by Madhatter23412 5/18/2020

--------------ADDON FLATBEDS FOR ESX_MECHANICJOB--------------
Follow the Instructions carefully and you will have a working SCRIPT. Remember to push Delete to activate
NPCJOB. IF YOU DO NOT RECHECK WORK!!!
IF you need further help do what I did and use the internet. This file will include everything you need 
to add more flatbeds. Will with any flatbed ELS or NON. You can get flatbeds from the internet DO NOT ASK
what FLATBEDS I used in the script. 

----------------ADD THE BELOW TO CLIENT/MAIN.LUA/OpenMechanicActionsMenu---------


local elements = {
					{label = _U('flat_bed_0'),  value = 'flatbed'},
					{label = _U('flat_bed_1'),  value = 'REPLACE_WITH_ADDON'},
					{label = _U('flat_bed_2'),  value = 'REPLACE_WITH_ADDON'},
					{label = _U('flat_bed_3'),  value = 'REPLACE_WITH_ADDON'}
				}


----------------ADD THE BELOW TO CLIENT/MAIN.LUA/OpenMobileMechanicActionsMenu---------
Below will add up to three extra FLATBEDS to ESX_Mechanicjob. You edit to fit your needs.

            {label = _U('flat_bed_0'),      value = 'dep_vehicle_0'},
			{label = _U('flat_bed_1'),     value = 'dep_vehicle_1'},
			{label = _U('flat_bed_2'),     value = 'dep_vehicle_2'},
			{label = _U('flat_bed_3'),     value = 'dep_vehicle_3'},

In the below with have places where you need to edit for the Flatbed_Addon of your choice. (---Replace_BODY_X_Y_Z---- corresponds
with the Flatbed position. You will be doing a lot of restart esx_mechanicjob in the console to get the cooridents right
for the vehicle to fit. You will need to edit the lines below ---Replace_BODY_X_Y_Z---- to fit the vehicle on and off the flatbed.)
Replace 'REPLACE_WITH_ADDON' with the model name. Before you ask you can APPLY the Same LOGIC to replace the Stock Flatbed. 

	---GTA_Stock_Flatbed---
elseif data.current.value == 'dep_vehicle_0' then  
			local playerPed = PlayerPedId()
			local vehicle = GetVehiclePedIsIn(playerPed, true)

			local towmodel = GetHashKey('flatbed')
			local isVehicleTow = IsVehicleModel(vehicle, towmodel)

			if isVehicleTow then
				local targetVehicle = ESX.Game.GetVehicleInDirection()

				if CurrentlyTowedVehicle == nil then
					if targetVehicle ~= 0 then
						if not IsPedInAnyVehicle(playerPed, true) then
							if vehicle ~= targetVehicle then ---Replace_____BODY__X______Y____Z----PUTTING VEHICLE ON----- 
								AttachEntityToEntity(targetVehicle, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
								CurrentlyTowedVehicle = targetVehicle
								ESX.ShowNotification(_U('vehicle_success_attached'))

								if NPCOnJob then
									if NPCTargetTowable == targetVehicle then
										ESX.ShowNotification(_U('please_drop_off'))
										Config.Zones.VehicleDelivery.Type = 1

										if Blips['NPCTargetTowableZone'] then
											RemoveBlip(Blips['NPCTargetTowableZone'])
											Blips['NPCTargetTowableZone'] = nil
										end

										Blips['NPCDelivery'] = AddBlipForCoord(Config.Zones.VehicleDelivery.Pos.x, Config.Zones.VehicleDelivery.Pos.y, Config.Zones.VehicleDelivery.Pos.z)
										SetBlipRoute(Blips['NPCDelivery'], true)
									end
								end
							else
								ESX.ShowNotification(_U('cant_attach_own_tt'))
							end
						end
					else
						ESX.ShowNotification(_U('no_veh_att'))
					end
				else                                     ---Replace_____BODY__X______Y______Z--------TAKING VEHICLE OFF------
					AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -13.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
					DetachEntity(CurrentlyTowedVehicle, true, true)

					if NPCOnJob then
						if NPCTargetDeleterZone then

							if CurrentlyTowedVehicle == NPCTargetTowable then
								ESX.Game.DeleteVehicle(NPCTargetTowable)
								TriggerServerEvent('esx_mechanicjob:onNPCJobMissionCompleted')
								StopNPCJob()
								NPCTargetDeleterZone = false
							else
								ESX.ShowNotification(_U('not_right_veh'))
							end

						else
							ESX.ShowNotification(_U('not_right_place'))
						end
					end

					CurrentlyTowedVehicle = nil
					ESX.ShowNotification(_U('veh_det_succ'))
				end
			else
				ESX.ShowNotification(_U('imp_flatbed'))
			end
		elseif data.current.value == 'object_spawner' then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification(_U('inside_vehicle'))
				return
			end
		------Flatbed_1_ADDON-----
			elseif data.current.value == 'dep_vehicle_1' then    
			local playerPed = PlayerPedId()
			local vehicle = GetVehiclePedIsIn(playerPed, true)

			local towmodel = GetHashKey('REPLACE_WITH_ADDON')
			local isVehicleTow = IsVehicleModel(vehicle, towmodel)

			if isVehicleTow then
				local targetVehicle = ESX.Game.GetVehicleInDirection()

				if CurrentlyTowedVehicle == nil then
					if targetVehicle ~= 0 then
						if not IsPedInAnyVehicle(playerPed, true) then
							if vehicle ~= targetVehicle then ---Replace_____BODY__X______Y____Z----PUTTING VEHICLE ON-----  
								AttachEntityToEntity(targetVehicle, vehicle, 20, -1.1, -7.0, 0.3, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
								CurrentlyTowedVehicle = targetVehicle
								ESX.ShowNotification(_U('vehicle_success_attached'))

								if NPCOnJob then
									if NPCTargetTowable == targetVehicle then
										ESX.ShowNotification(_U('please_drop_off'))
										Config.Zones.VehicleDelivery.Type = 1

										if Blips['NPCTargetTowableZone'] then
											RemoveBlip(Blips['NPCTargetTowableZone'])
											Blips['NPCTargetTowableZone'] = nil
										end

										Blips['NPCDelivery'] = AddBlipForCoord(Config.Zones.VehicleDelivery.Pos.x, Config.Zones.VehicleDelivery.Pos.y, Config.Zones.VehicleDelivery.Pos.z)
										SetBlipRoute(Blips['NPCDelivery'], true)
									end
								end
							else
								ESX.ShowNotification(_U('cant_attach_own_tt'))
							end
						end
					else
						ESX.ShowNotification(_U('no_veh_att'))
					end
				else                                     ---Replace_____BODY__X______Y______Z--------TAKING VEHICLE OFF------   
					AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -1.1, -14.5, 0.3, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
					DetachEntity(CurrentlyTowedVehicle, true, true)

					if NPCOnJob then
						if NPCTargetDeleterZone then

							if CurrentlyTowedVehicle == NPCTargetTowable then
								ESX.Game.DeleteVehicle(NPCTargetTowable)
								TriggerServerEvent('esx_mechanicjob:onNPCJobMissionCompleted')
								StopNPCJob()
								NPCTargetDeleterZone = false
							else
								ESX.ShowNotification(_U('not_right_veh'))
							end

						else
							ESX.ShowNotification(_U('not_right_place'))
						end
					end

					CurrentlyTowedVehicle = nil
					ESX.ShowNotification(_U('veh_det_succ'))
				end
			else
				ESX.ShowNotification(_U('imp_flatbed'))
			end
		elseif data.current.value == 'object_spawner' then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification(_U('inside_vehicle'))
				return
			end
        --------Flatbed_2_ADDON-------
elseif data.current.value == 'dep_vehicle_2' then                
			local playerPed = PlayerPedId()
			local vehicle = GetVehiclePedIsIn(playerPed, true)

			local towmodel = GetHashKey('REPLACE_WITH_ADDON')
			local isVehicleTow = IsVehicleModel(vehicle, towmodel)

			if isVehicleTow then
				local targetVehicle = ESX.Game.GetVehicleInDirection()

				if CurrentlyTowedVehicle == nil then
					if targetVehicle ~= 0 then
						if not IsPedInAnyVehicle(playerPed, true) then
							if vehicle ~= targetVehicle then ---Replace_____BODY__X_____Y_____Z----PUTTING VEHICLE ON-----  
								AttachEntityToEntity(targetVehicle, vehicle, 10, 0.025, -4.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
								CurrentlyTowedVehicle = targetVehicle
								ESX.ShowNotification(_U('vehicle_success_attached'))

								if NPCOnJob then
									if NPCTargetTowable == targetVehicle then
										ESX.ShowNotification(_U('please_drop_off'))
										Config.Zones.VehicleDelivery.Type = 1

										if Blips['NPCTargetTowableZone'] then
											RemoveBlip(Blips['NPCTargetTowableZone'])
											Blips['NPCTargetTowableZone'] = nil
										end

										Blips['NPCDelivery'] = AddBlipForCoord(Config.Zones.VehicleDelivery.Pos.x, Config.Zones.VehicleDelivery.Pos.y, Config.Zones.VehicleDelivery.Pos.z)
										SetBlipRoute(Blips['NPCDelivery'], true)
									end
								end
							else
								ESX.ShowNotification(_U('cant_attach_own_tt'))
							end
						end
					else
						ESX.ShowNotification(_U('no_veh_att'))
					end
				else                                    ---Replace_____BODY___X______Y______Z--------TAKING VEHICLE OFF------  
					AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 10, 0.025, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
					DetachEntity(CurrentlyTowedVehicle, true, true)

					if NPCOnJob then
						if NPCTargetDeleterZone then

							if CurrentlyTowedVehicle == NPCTargetTowable then
								ESX.Game.DeleteVehicle(NPCTargetTowable)
								TriggerServerEvent('esx_mechanicjob:onNPCJobMissionCompleted')
								StopNPCJob()
								NPCTargetDeleterZone = false
							else
								ESX.ShowNotification(_U('not_right_veh'))
							end

						else
							ESX.ShowNotification(_U('not_right_place'))
						end
					end

					CurrentlyTowedVehicle = nil
					ESX.ShowNotification(_U('veh_det_succ'))
				end
			else
				ESX.ShowNotification(_U('imp_flatbed'))
			end
		elseif data.current.value == 'object_spawner' then
			local playerPed = PlayerPedId()

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification(_U('inside_vehicle'))
				return
			end
        --------Flatbed_3_ADDON-------
elseif data.current.value == 'dep_vehicle_3' then                  
			local playerPed = PlayerPedId()
			local vehicle = GetVehiclePedIsIn(playerPed, true)

			local towmodel = GetHashKey('REPLACE_WITH_ADDON')
			local isVehicleTow = IsVehicleModel(vehicle, towmodel)

			if isVehicleTow then
				local targetVehicle = ESX.Game.GetVehicleInDirection()

				if CurrentlyTowedVehicle == nil then
					if targetVehicle ~= 0 then
						if not IsPedInAnyVehicle(playerPed, true) then
							if vehicle ~= targetVehicle then ---Replace_____BODY___X____ Y____Z----PUTTING VEHICLE ON-----  
								AttachEntityToEntity(targetVehicle, vehicle, 20, 0.05, -3.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
								CurrentlyTowedVehicle = targetVehicle
								ESX.ShowNotification(_U('vehicle_success_attached'))

								if NPCOnJob then
									if NPCTargetTowable == targetVehicle then
										ESX.ShowNotification(_U('please_drop_off'))
										Config.Zones.VehicleDelivery.Type = 1

										if Blips['NPCTargetTowableZone'] then
											RemoveBlip(Blips['NPCTargetTowableZone'])
											Blips['NPCTargetTowableZone'] = nil
										end

										Blips['NPCDelivery'] = AddBlipForCoord(Config.Zones.VehicleDelivery.Pos.x, Config.Zones.VehicleDelivery.Pos.y, Config.Zones.VehicleDelivery.Pos.z)
										SetBlipRoute(Blips['NPCDelivery'], true)
									end
								end
							else
								ESX.ShowNotification(_U('cant_attach_own_tt'))
							end
						end
					else
						ESX.ShowNotification(_U('no_veh_att'))
					end
				else                                     ---Replace_____BODY_X______Y______Z----TAKING VEHICLE OFF------ 
					AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, 0.05, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
					DetachEntity(CurrentlyTowedVehicle, true, true)

					if NPCOnJob then
						if NPCTargetDeleterZone then

							if CurrentlyTowedVehicle == NPCTargetTowable then
								ESX.Game.DeleteVehicle(NPCTargetTowable)
								TriggerServerEvent('esx_mechanicjob:onNPCJobMissionCompleted')
								StopNPCJob()
								NPCTargetDeleterZone = false
							else
								ESX.ShowNotification(_U('not_right_veh'))
							end

						else
							ESX.ShowNotification(_U('not_right_place'))
						end
					end

					CurrentlyTowedVehicle = nil
					ESX.ShowNotification(_U('veh_det_succ'))
				end
			else
				ESX.ShowNotification(_U('imp_flatbed'))
			end
			
----------------ADD THE BELOW TO CLIENT/MAIN.LUA/Citizen.CreateThread_Key Controls---------

                        if
						    GetEntityModel(vehicle) == GetHashKey('flatbed') or
							GetEntityModel(vehicle) == GetHashKey('REPLACE_WITH_ADDON') or
							GetEntityModel(vehicle) == GetHashKey('REPLACE_WITH_ADDON') or
							GetEntityModel(vehicle) == GetHashKey('REPLACE_WITH_ADDON') or
							GetEntityModel(vehicle) == GetHashKey('slamvan3')
						then

                if IsPedInAnyVehicle(playerPed, false) and IsVehicleModel(GetVehiclePedIsIn(playerPed, false), GetHashKey('flatbed')) then
					StartNPCJob()
				elseif IsPedInAnyVehicle(playerPed, false) and IsVehicleModel(GetVehiclePedIsIn(playerPed, false), GetHashKey('REPLACE_WITH_ADDON')) then
				    StartNPCJob()
				elseif IsPedInAnyVehicle(playerPed, false) and IsVehicleModel(GetVehiclePedIsIn(playerPed, false), GetHashKey('REPLACE_WITH_ADDON')) then
				    StartNPCJob()
                elseif IsPedInAnyVehicle(playerPed, false) and IsVehicleModel(GetVehiclePedIsIn(playerPed, false), GetHashKey('REPLACE_WITH_ADDON')) then
				    StartNPCJob()			
			
----------------ADD THE BELOW TO LOCALES/EN.LUA---------
If you are using a different langauge then replace appropiately.
			
  ['flat_bed_0']                = 'Flatbed',
  ['flat_bed_1']                = 'Flatbed 1',
  ['flat_bed_2']                = 'Flatbed 2',
  ['flat_bed_3']                = 'Flatbed 3',			
			
