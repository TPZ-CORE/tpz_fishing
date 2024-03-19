
FishData = { 
    Weight = 0, 
    RodWeight = 0 
}

Prompts = {

    Prepare = { 
        Group      = GetRandomIntInRange(0, 0xffffff),
        ChangeBait = nil,
        ThrowHook  = nil,
    },

    Waiting = { 
        Group      = GetRandomIntInRange(0, 0xffffff),

        HookFish   = nil,
        ReelLure   = nil,
        Cancel     = nil 
    },

    Hook = { 
        Group      = GetRandomIntInRange(0, 0xffffff),

        Reel       = nil, 
        Cancel     = nil 
    },

    Finish = { 
        Group      = GetRandomIntInRange(0, 0xffffff),
        Keep       = nil,
        Throw      = nil, 
    }

}

--[[-------------------------------------------------------
 Basic Events
]]---------------------------------------------------------

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    PromptDelete(Prompts.Prepare.ChangeBait)
    PromptDelete(Prompts.Prepare.ThrowHook)

    PromptDelete(Prompts.Waiting.HookFish)
    PromptDelete(Prompts.Waiting.ReelLure)
    PromptDelete(Prompts.Waiting.Cancel)

    PromptDelete(Prompts.Hook.Reel)
    PromptDelete(Prompts.Hook.Cancel)

    PromptDelete(Prompts.Finish.Keep)
    PromptDelete(Prompts.Finish.Throw)
end)


--[[-------------------------------------------------------
 Local Functions
]]---------------------------------------------------------

local function CreateNewPromptWithParameters(key, locale, group)

    local prompt = PromptRegisterBegin()
    PromptSetControlAction(prompt, key)

    PromptSetText(prompt, CreateVarString(10, "LITERAL_STRING", locale ))

    PromptSetEnabled(prompt, true)
    PromptSetVisible(prompt, true)
    PromptSetHoldMode(prompt, false)

    PromptSetGroup(prompt, group)
    PromptRegisterEnd(prompt)

    return prompt

end

function RegisterAllPrompts()
    RegisterPrepareFishingPrompts()
    RegisterHookWaitingPrompts()
    RegisterHookPrompts()
    RegisterFinishPrompts()
end


--[[-------------------------------------------------------
 Prompts
]]---------------------------------------------------------

function RegisterPrepareFishingPrompts()
    local key1, key2 = joaat("INPUT_AIM"), 0x07CE1E61

    local changeBaitPrompt = CreateNewPromptWithParameters(key1, Locales['PREPARE_FISHING_ROD'], Prompts.Prepare.Group)
    Prompts.Prepare.ChangeBait = changeBaitPrompt

    local throwHookPrompt = CreateNewPromptWithParameters(key2, Locales['THROW_HOOK'], Prompts.Prepare.Group)
    Prompts.Prepare.ThrowHook = throwHookPrompt
end

function RegisterHookWaitingPrompts()

    local key1, key2, key3 = joaat("INPUT_ATTACK"), 0xDB096B85, 0x8FFC75D6

    local hookFishPrompt = CreateNewPromptWithParameters(key1, Locales['HOOK_FISH'], Prompts.Waiting.Group)
    Prompts.Waiting.HookFish = hookFishPrompt

    local reelLurePrompt = CreateNewPromptWithParameters(key2, Locales['REEL_LURE'], Prompts.Waiting.Group)
    Prompts.Waiting.ReelLure = reelLurePrompt

    local cancelPrompt = CreateNewPromptWithParameters(key3, Locales['RESET_CAST'], Prompts.Waiting.Group)
    Prompts.Waiting.Cancel = cancelPrompt
end

function RegisterHookPrompts()

    local key1, key2 = 0xFBD7B3E6, 0x8FFC75D6

    local reelInPrompt = CreateNewPromptWithParameters(key1, Locales['REEL_IN'], Prompts.Hook.Group)
    Prompts.Hook.Reel = reelInPrompt

    local cancelPrompt = CreateNewPromptWithParameters(key2, Locales['RESET_CAST'], Prompts.Hook.Group)
    Prompts.Hook.Cancel = cancelPrompt
end

function RegisterFinishPrompts()

    local key1, key2 = joaat("INPUT_ATTACK"), joaat("INPUT_AIM")

    local keepPrompt = CreateNewPromptWithParameters(key1, Locales['KEEP_FISH'], Prompts.Finish.Group)
    Prompts.Finish.Keep = keepPrompt

    local throwPrompt = CreateNewPromptWithParameters(key2, Locales['THROW_FISH'], Prompts.Finish.Group)
    Prompts.Finish.Throw = throwPrompt
end

