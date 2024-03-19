
HasMinigameOn = false

MinigameStructure = {}

FishList = {
    [`A_C_FISHBLUEGIL_01_MS`]        = { Config.FishData.A_C_FISHBLUEGIL_01_MS[1], 6 },
    [`A_C_FISHBLUEGIL_01_SM`]        = { Config.FishData.A_C_FISHBLUEGIL_01_SM[1], 0 },
    [`A_C_FISHBULLHEADCAT_01_MS`]    = { Config.FishData.A_C_FISHBULLHEADCAT_01_MS[1], 7 },
    [`A_C_FISHBULLHEADCAT_01_SM`]    = { Config.FishData.A_C_FISHBULLHEADCAT_01_SM[1], 1 },
    [`A_C_FISHCHAINPICKEREL_01_MS`]  = { Config.FishData.A_C_FISHCHAINPICKEREL_01_MS[1], 8 },
    [`A_C_FISHCHAINPICKEREL_01_SM`]  = { Config.FishData.A_C_FISHCHAINPICKEREL_01_SM[1], 4},
    [`A_C_FISHCHANNELCATFISH_01_LG`] = { Config.FishData.A_C_FISHCHANNELCATFISH_01_LG[1], 17 },
    [`A_C_FISHCHANNELCATFISH_01_XL`] = { Config.FishData.A_C_FISHCHANNELCATFISH_01_XL[1], 17 },
    [`A_C_FISHLAKESTURGEON_01_LG`]   = { Config.FishData.A_C_FISHLAKESTURGEON_01_LG[1], 18 },
    [`A_C_FISHLARGEMOUTHBASS_01_LG`] = { Config.FishData.A_C_FISHLARGEMOUTHBASS_01_LG[1], 19 },
    [`A_C_FISHLARGEMOUTHBASS_01_MS`] = { Config.FishData.A_C_FISHLARGEMOUTHBASS_01_MS[1], 10 },
    [`A_C_FISHLONGNOSEGAR_01_LG`]    = { Config.FishData.A_C_FISHLONGNOSEGAR_01_LG[1], 20 },
    [`A_C_FISHMUSKIE_01_LG`]         = { Config.FishData.A_C_FISHMUSKIE_01_LG[1], 21 },
    [`A_C_FISHNORTHERNPIKE_01_LG`]   = { Config.FishData.A_C_FISHNORTHERNPIKE_01_LG[1], 22 },
    [`A_C_FISHPERCH_01_MS`]          = { Config.FishData.A_C_FISHPERCH_01_MS[1], 9 },
    [`A_C_FISHPERCH_01_SM`]          = { Config.FishData.A_C_FISHPERCH_01_SM[1], 3 },
    [`A_C_FISHRAINBOWTROUT_01_LG`]   = { Config.FishData.A_C_FISHRAINBOWTROUT_01_LG[1], 23 },
    [`A_C_FISHRAINBOWTROUT_01_MS`]   = { Config.FishData.A_C_FISHRAINBOWTROUT_01_MS[1], 12 },
    [`A_C_FISHREDFINPICKEREL_01_MS`] = { Config.FishData.A_C_FISHREDFINPICKEREL_01_MS[1], 11 },
    [`A_C_FISHREDFINPICKEREL_01_SM`] = { Config.FishData.A_C_FISHREDFINPICKEREL_01_SM[1], 2 },
    [`A_C_FISHROCKBASS_01_MS`]       = { Config.FishData.A_C_FISHROCKBASS_01_MS[1], 13 },
    [`A_C_FISHROCKBASS_01_SM`]       = { Config.FishData.A_C_FISHROCKBASS_01_SM[1], 5 },
    [`A_C_FISHSALMONSOCKEYE_01_LG`]  = { Config.FishData.A_C_FISHSALMONSOCKEYE_01_LG[1], 24 },
    [`A_C_FISHSALMONSOCKEYE_01_ML`]  = { Config.FishData.A_C_FISHSALMONSOCKEYE_01_ML[1], 16 },
    [`A_C_FISHSALMONSOCKEYE_01_MS`]  = { Config.FishData.A_C_FISHSALMONSOCKEYE_01_MS[1], 14 },
    [`A_C_FISHSMALLMOUTHBASS_01_LG`] = { Config.FishData.A_C_FISHSMALLMOUTHBASS_01_LG[1], 25 },
    [`A_C_FISHSMALLMOUTHBASS_01_MS`] = { Config.FishData.A_C_FISHSMALLMOUTHBASS_01_MS[1], 15 },
}

function GET_TASK_FISHING_DATA()
    
    local r = exports["tpz_fishing"]:GET_TASK_FISHING_DATA_EXTRA()

    HasMinigameOn = r[1]

    local outAsInt, outAsFloat = r[2], r[3]

    MinigameStructure = {}

    MinigameStructure = {
        f_0  = outAsInt["0"],
        f_1  = outAsFloat["2"],
        f_2  = outAsFloat["4"],
        f_3  = outAsFloat["6"],
        f_4  = outAsFloat["8"],
        f_5  = outAsInt["10"],
        f_6  = outAsInt["12"],
        f_7  = outAsInt["14"],
        f_8  = outAsFloat["16"],
        f_9  = outAsFloat["18"],
        f_10 = outAsInt["20"],
        f_11 = outAsInt["22"],
        f_12 = outAsInt["24"],
        f_13 = outAsFloat["26"],
        f_14 = outAsFloat["28"],
        f_15 = outAsFloat["30"],
        f_16 = outAsInt["32"],
        f_17 = outAsFloat["34"],
        f_18 = outAsInt["36"],
        f_19 = outAsInt["38"],
        f_20 = outAsFloat["40"],
        f_21 = outAsFloat["42"],
        f_22 = outAsFloat["44"],
        f_23 = outAsFloat["46"],
        f_24 = outAsFloat["48"],
        f_25 = outAsFloat["50"],
        f_26 = outAsFloat["52"],
        f_27 = outAsFloat["54"]
    }
end



function SET_TASK_FISHING_DATA()
    if MinigameStructure.f_0 then
        exports["tpz_fishing"]:SET_TASK_FISHING_DATA_EXTRA(MinigameStructure)
    end
end

function FISHING_HAS_MINIGAME_ON()
    return HasMinigameOn
end

function FISHING_GET_F_(f)
    return MinigameStructure["f_" .. f]
end

function FISHING_GET_MINIGAME_STATE()
    return FISHING_GET_F_(0)
end

function FISHING_GET_MAX_THROWING_DISTANCE()
    return FISHING_GET_F_(1)
end

function FISHING_GET_LINE_DISTANCE()
    return FISHING_GET_F_(2)
end

function FISHING_GET_TRANSITION_FLAG()
    return FISHING_GET_F_(6)
end

function FISHING_GET_FISH_HANDLE()
    return FISHING_GET_F_(7)
end

function FISHING_GET_CALCULATED_FISH_WEIGHT()
    return FISHING_GET_F_(8)
end

function FISHING_GET_F_9()
    return FISHING_GET_F_(9)
end

function FISHING_GET_SCRIPT_TIMER()
    return FISHING_GET_F_(10)
end

function FISHING_GET_BOBBER_HANDLE()
    return FISHING_GET_F_(11)
end

function FISHING_GET_HOOK_HANDLE()
    return FISHING_GET_F_(12)
end

function FISHING_SET_F_(f, v)
    MinigameStructure["f_" .. f] = v
    SET_TASK_FISHING_DATA()
end

function FISHING_SET_LINE_DISTANCE(v)
    FISHING_SET_F_(2, v)
end

function FISHING_SET_TRANSITION_FLAG(v)
    FISHING_SET_F_(6, v)
end

function FISHING_SET_FISH_HANDLE(v)
    FISHING_SET_F_(7, v)
    local weight_index = FishModelToSomeSortOfWeightIndex(GetEntityModel(v))

    FISHING_SET_CALCULATED_FISH_WEIGHT(GetRandomFishWeightForWeightIndex(weight_index) / 54.25)

    FishData.RodWeight = 2
    FISHING_SET_ROD_WEIGHT(FishData.RodWeight)
end

function FISHING_SET_CALCULATED_FISH_WEIGHT(v)
    FishData.Weight = v * 54.25

    FISHING_SET_F_(8, v)
end

function FISHING_SET_ROD_WEIGHT(v)
    FISHING_SET_F_(18, v)
end

function FISHING_SET_ROD_POSITION_LR(v)
    FISHING_SET_F_(22, v)
end

function FISHING_SET_ROD_POSITION_UD(v)
    FISHING_SET_F_(23, v)
end

--[[-------------------------------------------------------
 Getter Functions
]]---------------------------------------------------------

function IsFishInterested(fishModel)
    local baits = Config.BaitsPerFish[currentLure]

    if baits then

        for _, fish in pairs(baits) do

            if FishList[fishModel] == fish then
                return true
            end

        end

    end

    return false
end


function GetNearbyFishs(coords, radius)
    local r = {}

    local itemSet = CreateItemset(true)
    local size = Citizen.InvokeNative(0x59B57C4B06531E1E, coords, radius, itemSet, 1, Citizen.ResultAsInteger())

    if size > 0 then
        for index = 0, size - 1 do
            local entity = GetIndexedItemInItemset(index, itemSet)
            local populationType = GetEntityPopulationType(entity)
            if (populationType == 6 or populationType == 8) and not IsPedDeadOrDying(entity, 0) then
                table.insert(r, entity)
            end
        end
    end

    if IsItemsetValid(itemSet) then
        DestroyItemset(itemSet)
    end

    return r
end

function FishModelToSomeSortOfWeightIndex(fishModel)
    
    if FishList[fishModel] and FishList[fishModel][2] then
        return FishList[fishModel][2]
    end
    
    return 0
end

function GetMinMaxWeightForWeightIndex(index)
    local min = 0.0
    local max = 0.0

    if index == 0 or index == 1 or index == 2 or index == 3 or index == 4 or index == 5 then -----small fish
        min = 0.5
        max = 5.0
    elseif index == 17 or index == 18 or index == 20 or index == 21 or index == 22 or index == 16 then ----Large
        min = 14.0
        max = 20.0
    elseif index == 19 or index == 23 or index == 24 or index == 25 then ----Legendary large
        min = 20.0
        max = 25.0
    elseif index == 6 or index == 7 or index == 8 or index == 9 or index == 10 or index == 11 or index == 12 or index == 13 or index == 14 or index == 15 then  ---- Med and Legend med
        min = 6.0
        max = 10.0
    end

    min = min
    max = max

    return min, max
end

function GetRandomFishWeightForWeightIndex(index)
    local min, max = GetMinMaxWeightForWeightIndex(index)
    local weight = math.random() * (max - min) + min

    return weight
end
