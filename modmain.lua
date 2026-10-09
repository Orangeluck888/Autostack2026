--代码可以学习，但别一模一样复制粘贴，最痛恨抄袭行为。
GLOBAL = GLOBAL or _G
local STACK_INTERVAL = GetModConfigData("STACK_INTERVAL")
local STACK_RADIUS = GetModConfigData("STACK_RADIUS")
local START_DELAY = GetModConfigData("START_DELAY")
local SORT_METHOD = GetModConfigData("SORT_METHOD")
local ENABLE_STACK_DELAY = GetModConfigData("STACK_DELAY")
local ALLOW_MOB_STACK = GetModConfigData("ALLOW_MOB_STACK")
local STACK_MODE = GetModConfigData("STACK_MODE")
local EXCLUDE_TRAPS = GetModConfigData("EXCLUDE_TRAPS")
local PROTECT_RARE = GetModConfigData("PROTECT_RARE")
local SMOKE_PUFF_ON_STACKING = GetModConfigData("SMOKE_PUFF_ON_STACKING")
local SMOKE_PUFF_TYPE = GetModConfigData("SMOKE_PUFF_TYPE") or "small_puff"
local FIX_POOP_BUG = GetModConfigData("FIX_POOP_BUG")
local AUTO_CLEAN = GetModConfigData("AUTO_CLEAN")
local CLEAN_INTERVAL = GetModConfigData("CLEAN_INTERVAL") or 10
local CLEAN_TYPE = GetModConfigData("CLEAN_TYPE") or "all"
local CLEAN_NOTICE = GetModConfigData("CLEAN_NOTICE")
local CLEAN_NOTICE_ADVANCE = GetModConfigData("CLEAN_NOTICE_ADVANCE") or 120
local CLEAN_NOTICE_STYLE = GetModConfigData("CLEAN_NOTICE_STYLE") or "formal"
local ENABLE_SOUND = GetModConfigData("ENABLE_SOUND")
local SOUND_TYPE = GetModConfigData("SOUND_TYPE") or "pop"

local BASIC_RESOURCES = {
    -- 基础资源
    "log",           -- 木头
    "rocks",         -- 石头
    "cutgrass",      -- 草
    "twigs",         -- 树枝
    "flint",         -- 燧石
    
    -- 可以根据需要添加更多基础资源

    "rock_avocado_fruit", --石果
    "rock_avocado_fruit_ripe", --熟石果

    "nitre",         -- 硝石
    "goldnugget",    -- 金块
    "cutreeds",      -- 芦苇
    "charcoal",      -- 木炭
    "petals",        -- 花瓣
    "foliage",       -- 蕨叶
    "rope",          -- 绳子
    "boards",        -- 木板
    "cutstone",      -- 石砖
    "papyrus",       -- 莎草纸
    "houndstooth",   -- 狗牙
    "stinger",       -- 蜂刺
    "silk",          -- 蜘蛛丝
    "ash",           -- 灰烬
    "pinecone",      -- 松果
    "acorn",         -- 橡果
    "twiggy_nut",    -- 树枝树种
    "seeds",         -- 种子
    "ice",           -- 冰
    "moonrocknugget" -- 月岩
}

-- 定义冬季盛宴物品列表
local WINTER_FEAST_ITEMS = {
    "winter_food1",      -- 姜饼人
    "winter_food2",      -- 糖果手杖
    "winter_food3",      -- 永恒水果蛋糕
    "winter_food4",      -- 巧克力饼干
    "winter_food5",      -- 冬季浆果塔
    "winter_food6",      -- 胡萝卜蛋糕
    "winter_food7",      -- 布丁
    "winter_food8",      -- 甜甜圈
    "winter_food9",      -- 薄荷糖
    "festive_plant",     -- 节日植物
    "festive_tree_item", -- 节日树
    "festive_tree_planter", -- 节日树盆栽
    "winter_ornament_plain1", -- 普通装饰品1
    "winter_ornament_plain2", -- 普通装饰品2
    "winter_ornament_plain3", -- 普通装饰品3
    "winter_ornament_plain4", -- 普通装饰品4
    "winter_ornament_plain5", -- 普通装饰品5
    "winter_ornament_plain6", -- 普通装饰品6
    "winter_ornament_fancy1", -- 精美装饰品1
    "winter_ornament_fancy2", -- 精美装饰品2
    "winter_ornament_fancy3", -- 精美装饰品3
    "winter_ornament_fancy4", -- 精美装饰品4
    "winter_ornament_fancy5", -- 精美装饰品5
    "winter_ornament_fancy6", -- 精美装饰品6
    "winter_ornament_light1", -- 节日灯1
    "winter_ornament_light2", -- 节日灯2
    "winter_ornament_light3", -- 节日灯3
    "winter_ornament_light4", -- 节日灯4
    "winter_ornament_light5", -- 节日灯5
    "winter_ornament_light6", -- 节日灯6
    "winter_ornament_light7", -- 节日灯7
    "winter_ornament_light8", -- 节日灯8
    "gift",              -- 礼物
    "giftwrap",          -- 礼物包装
    "winter_gingerbreadcookie", -- 姜饼饼干
    "winter_ornamentstar",      -- 星星装饰
    "winter_ornamentbutterfly", -- 蝴蝶装饰
    "winter_ornamentdeerhead",  -- 鹿头装饰
    -- 添加所有boss装饰品
    "winter_ornament_boss_bearger",
    "winter_ornament_boss_deerclops",
    "winter_ornament_boss_moose",
    "winter_ornament_boss_dragonfly",
    "winter_ornament_boss_beequeen",
    "winter_ornament_boss_toadstool",
    "winter_ornament_boss_antlion",
    "winter_ornament_boss_klaus",
    "winter_ornament_boss_fuelweaver",
    "winter_ornament_boss_malbatross",
    "winter_ornament_boss_crabking",
    "winter_ornament_boss_eyeofterror",
    "winter_ornament_boss_twinofterror",
    "winter_ornament_boss_wagstaff",
    "winter_ornament_boss_daywalker",
    "winter_ornament_boss_krampus",
    "winter_ornament_boss_minotaur",
    "winter_ornament_boss_pearl",
    "winter_ornament_boss_celestialchampion",
    "winter_ornament_boss_alterguardian",
    "winter_ornament_boss_stalker"
}

-- 定义稀有物品列表
local RARE_ITEMS = {
    "deerclops_eyeball",    -- 巨鹿眼球
    "dragon_scales",        -- 龙鳞
    "bearger_fur",          -- 熊皮
    "thulecite",           -- 铥矿
    "thulecite_pieces",    -- 铥矿碎片
    "purebrilliance",      -- 纯粹辉煌
    "purehorror",          -- 纯粹恐惧
    "purelight",           -- 纯粹光芒
    "walrus_tusk",         -- 海象牙
    "malbatross_beak",     -- 邪天翁喙
}

-- 将基础资源转换为查找表，以便快速检查
local BASIC_RESOURCES_LOOKUP = {}
for _, prefab in ipairs(BASIC_RESOURCES) do
    BASIC_RESOURCES_LOOKUP[prefab] = true
end

-- 将冬季盛宴物品转换为查找表
local WINTER_FEAST_ITEMS_LOOKUP = {}
for _, prefab in ipairs(WINTER_FEAST_ITEMS) do
    WINTER_FEAST_ITEMS_LOOKUP[prefab] = true
end

-- 将稀有物品转换为查找表
local RARE_ITEMS_LOOKUP = {}
for _, prefab in ipairs(RARE_ITEMS) do
    RARE_ITEMS_LOOKUP[prefab] = true
end

-- 在文件开头添加物品生成时间记录
-- 添加到AddPrefabPostInit之前
local function RecordSpawnTime(inst)
    if inst.components and inst.components.stackable then
        inst.spawn_time = GLOBAL.GetTime()
    end
end

AddPrefabPostInit("", RecordSpawnTime)
-- ========== 定期清理垃圾 ==========
local CLEAN_BASIC_LIST = {
    log = true, rocks = true, cutgrass = true, twigs = true, flint = true,
}

local CLEAN_ROT_FOOD_LIST = {
    seeds = true, petals = true, petals_evil = true,
    spoiled_food = true, spoiled_fish = true,spoiled_fish_small = true,
}

local CLEAN_EVENT_LIST = {
    -- 糖果零食
    winter_food1 = true, winter_food2 = true, winter_food3 = true,
    winter_food4 = true, winter_food5 = true, winter_food6 = true,
    winter_food7 = true, winter_food8 = true, winter_food9 = true,
    halloweencandy_1 = true, halloweencandy_2 = true, halloweencandy_3 = true,
    halloweencandy_4 = true, halloweencandy_5 = true, halloweencandy_6 = true,
    halloweencandy_7 = true, halloweencandy_8 = true, halloweencandy_9 = true,
    halloweencandy_10 = true, halloweencandy_11 = true, halloweencandy_12 = true,
    halloweencandy_13 = true, halloweencandy_14 = true,
    crumbs = true,

    -- 冬季盛宴装饰
    winter_ornament_plain1 = true, winter_ornament_plain2 = true,
    winter_ornament_plain3 = true, winter_ornament_plain4 = true,
    winter_ornament_plain5 = true, winter_ornament_plain6 = true,
    winter_ornament_plain7 = true, winter_ornament_plain8 = true,
    winter_ornament_plain9 = true, winter_ornament_plain10 = true,
    winter_ornament_plain11 = true, winter_ornament_plain12 = true,
    winter_ornament_fancy1 = true, winter_ornament_fancy2 = true,
    winter_ornament_fancy3 = true, winter_ornament_fancy4 = true,
    winter_ornament_fancy5 = true, winter_ornament_fancy6 = true,
    winter_ornament_fancy7 = true, winter_ornament_fancy8 = true,
    winter_ornament_boss_antlion = true,
    winter_ornament_boss_bearger = true,
    winter_ornament_boss_beequeen = true,
    winter_ornament_boss_deerclops = true,
    winter_ornament_boss_dragonfly = true,
    winter_ornament_boss_fuelweaver = true,
    winter_ornament_boss_klaus = true,
    winter_ornament_boss_krampus = true,
    winter_ornament_boss_moose = true,
    winter_ornament_boss_noeyeblue = true,
    winter_ornament_boss_noeyered = true,
    winter_ornament_boss_toadstool = true,
    winter_ornament_boss_toadstool_misery = true,
    winter_ornament_boss_minotaur = true,
    winter_ornament_boss_crabking = true,
    winter_ornament_boss_crabkingpearl = true,
    winter_ornament_boss_hermithouse = true,
    winter_ornament_boss_pearl = true,
    winter_ornament_boss_celestialchampion1 = true,
    winter_ornament_boss_celestialchampion2 = true,
    winter_ornament_boss_celestialchampion3 = true,
    winter_ornament_boss_celestialchampion4 = true,
    winter_ornament_boss_eyeofterror1 = true,
    winter_ornament_boss_eyeofterror2 = true,
    winter_ornament_boss_wagstaff = true,
    winter_ornament_boss_malbatross = true,
    winter_ornament_boss_wormboss = true,
    winter_ornament_boss_sharkboi = true,
    winter_ornament_boss_daywalker = true,
    winter_ornament_boss_daywalker2 = true,
    winter_ornament_boss_mutateddeerclops = true,
    winter_ornament_boss_mutatedbearger = true,
    winter_ornament_boss_mutatedwarg = true,
    winter_ornament_shadowthralls = true,
    winter_ornament_festivalevents1 = true, winter_ornament_festivalevents2 = true,
    winter_ornament_festivalevents3 = true, winter_ornament_festivalevents4 = true,
    winter_ornament_festivalevents5 = true,

    -- 万圣夜装饰
    halloween_ornament_1 = true, halloween_ornament_2 = true,
    halloween_ornament_3 = true, halloween_ornament_4 = true,
    halloween_ornament_5 = true, halloween_ornament_6 = true,

    -- 万圣夜小玩具
    trinket_32 = true, trinket_33 = true, trinket_34 = true,
    trinket_35 = true, trinket_36 = true, trinket_37 = true,
    trinket_38 = true, trinket_39 = true, trinket_40 = true,
    trinket_41 = true, trinket_42 = true, trinket_43 = true,
    trinket_44 = true, trinket_45 = true, trinket_46 = true,
    pumpkincarver1 = true, pumpkincarver2 = true, pumpkincarver3 = true,
}

-- 清理通知文本
local CLEAN_NOTICE_TEXTS = {
    formal = {
        "系统将在 %d 秒后清理地面垃圾，请及时收起您的物品。",
    },
    humor = {
        "喂！地上的破烂要没啦！%d 秒后大扫除，快点捡！",
        "扫地机器人已启动，%d 秒后吞掉地上的所有东西！",
        "%d 秒后地板要干净了，你的宝贝还在外面的快点捡回来！",
        "叮咚！垃圾回收车 %d 秒后到达，请把有用的东西抱紧。",
    },
}

-- 清理完成公告文本
local CLEAN_DONE_TEXTS = {
    formal = {
        "地面垃圾清理完成。",
    },
    humor = {
        "大扫除完毕，地板干净得能照镜子了！",
        "扫地机器人收工，地上的宝贝都进异次元了。",
        "垃圾回收车已离场，地上啥也没剩。",
        "地面清理完毕，下次记得把东西收好哦。",
    },
}

local function GetCleanDoneText()
    local style = CLEAN_NOTICE_STYLE == "humor" and "humor" or "formal"
    local pool = CLEAN_DONE_TEXTS[style]
    return pool[math.random(1, #pool)]
end

local function GetCleanNoticeText()
    local style = CLEAN_NOTICE_STYLE == "humor" and "humor" or "formal"
    local pool = CLEAN_NOTICE_TEXTS[style]
    local text = pool[math.random(1, #pool)]
    return string.format(text, CLEAN_NOTICE_ADVANCE)
end


local function AutoCleanGarbage() --自动清理垃圾
    if not AUTO_CLEAN then return end

    for _, ent in pairs(GLOBAL.Ents) do
        if ent.prefab then
            local should_clean = false
            if CLEAN_TYPE == "basic" then
                should_clean = CLEAN_BASIC_LIST[ent.prefab] == true
            elseif CLEAN_TYPE == "rotfood" then
                should_clean = CLEAN_ROT_FOOD_LIST[ent.prefab] == true
            elseif CLEAN_TYPE == "event" then
                should_clean = CLEAN_EVENT_LIST[ent.prefab] == true
            else
                should_clean = ent.components.inventoryitem ~= nil
            end

            if should_clean then
                local inv = ent.components.inventoryitem
                if inv and not inv:IsHeld() and inv.owner == nil
                   and not ent:HasTag("INLIMBO") then
                    if not ((ent.components.hunger and ent.components.hunger.current > 0)
                            or (ent.components.domesticatable
                                and ent.components.domesticatable.domestication > 0)) then
                        ent:Remove()
                    end
                end
            end
            
        end
    end

    if CLEAN_NOTICE then
       GLOBAL.TheNet:Announce(GetCleanDoneText())
    end

end

-- 修复：自动堆叠便便导致牛无限拉屎
--FixBeefaloPoop 里 ps.spawntestfn 覆盖后，没有保存原 spawntestfn 的返回值语义。现在这样其实也没问题，只是提醒一下别的地方别再去改 spawntestfn。
local function FixBeefaloPoop(inst)
    if not inst.components.periodicspawner then return end

    local ps = inst.components.periodicspawner
    local old_test = ps.spawntestfn

    ps.spawntestfn = function(owner)
        -- 先跑原版 CanSpawnPoop，不通过就直接拒绝
        if old_test and not old_test(owner) then
            return false
        end

        -- 再做一次包含 stacksize 的密度检测
        local x, y, z = owner.Transform:GetWorldPosition()
        local range = ps.range or 20
        local density = ps.density or 2
        local target = ps.prefab or "poop"

        local total = 0
        local ents = GLOBAL.TheSim:FindEntities(x, y, z, range)
        for _, ent in ipairs(ents) do
            if ent.prefab == target then
                if ent.components.stackable then
                    total = total + ent.components.stackable.stacksize
                else
                    total = total + 1
                end
            end
        end

        -- 堆叠数量加起来达到上限，就拒绝本次生成
        return total < density
    end
end

if FIX_POOP_BUG then
    AddPrefabPostInit("beefalo", FixBeefaloPoop)
end

-- 堆叠成功时在物品位置生成烟雾特效
local function SpawnStackSmoke(inst)
    if not SMOKE_PUFF_ON_STACKING then return end
    if not inst or not inst:IsValid() then return end
    local x, y, z = inst.Transform:GetWorldPosition()
    local fx = GLOBAL.SpawnPrefab(SMOKE_PUFF_TYPE)
    if fx then
        fx.Transform:SetPosition(x, y, z)
        -- 只有默认小白烟需要缩放，其他特效保持原生大小
        if SMOKE_PUFF_TYPE == "small_puff" then
            fx.Transform:SetScale(0.5, 0.5, 0.5)
        end
    end
end

-- 堆叠成功时在物品位置播放音效
local STACK_SOUND_MAP = {
    pop    = "dontstarve/common/destroy_wood",           -- 啵
    ding   = "dontstarve/wilson/pickup_reeds",           -- 叮
    whoosh = "dontstarve/common/teleportworm/swallow",   -- 嗖
    click  = "dontstarve/common/together/packaged",      -- 咔
}

local function PlayStackSound(inst)
    if not ENABLE_SOUND then return end
    if not inst or not inst:IsValid() then return end
    local sound = STACK_SOUND_MAP[SOUND_TYPE] or STACK_SOUND_MAP.pop
    inst.SoundEmitter:PlaySound(sound)
end

-- 执行堆叠的优化函数
local function EnhancedStackItems()
    -- 获取世界实例
    local world = GLOBAL.TheWorld
    if not world then return end

    -- 获取所有玩家
    local players = GLOBAL.AllPlayers
    if not players or #players == 0 then return end

    -- 对每个玩家周围的物品进行堆叠
    for _, player in ipairs(players) do
        if player and player:IsValid() then
            -- 获取玩家位置
            local x, y, z = player.Transform:GetWorldPosition()

            -- 修改查找条件，明确只查找掉落物
            local items = GLOBAL.TheSim:FindEntities(x, y, z, STACK_RADIUS,
                {"_inventoryitem"}, -- 必须是物品
                {"INLIMBO", "NOCLICK", "catchable", "fire"} -- 排除这些标签
            )

            -- 分组
            local grouped = {}
            for _, item in ipairs(items) do
                -- 在陷阱里当诱饵的物品不参与堆叠
                local is_trap_bait = false
                if item and item:IsValid() and item.components.bait then
                    if not item.components.bait:IsFree() then
                        is_trap_bait = true
                    end
                end

                -- 增加更多安全检查
                if item and item:IsValid() and item.prefab and
                   item.components and item.components.stackable and
                   not item.components.stackable:IsFull() and
                   item.components.inventoryitem and
                   not item.components.inventoryitem:IsHeld() and
                   not item:HasTag("INLIMBO") and
                   not is_trap_bait and
                   -- 检查是否排除陷阱诱饵
                   (not EXCLUDE_TRAPS or not item:HasTag("trap")) and
                   -- 检查是否保护稀有物品
                   (not PROTECT_RARE or not RARE_ITEMS_LOOKUP[item.prefab]) and
                   -- 根据配置决定是否检查生物相关的条件
                   (ALLOW_MOB_STACK or (
                       not item:HasTag("mob") and
                       not item:HasTag("firefly") and
                       not item.components.health and
                       not item.components.locomotor
                   )) and
                   -- 根据堆叠模式决定是否堆叠该物品
                   (STACK_MODE == "all" or
                    (STACK_MODE == "basic" and BASIC_RESOURCES_LOOKUP[item.prefab]) or
                    (STACK_MODE == "basic_winter" and (BASIC_RESOURCES_LOOKUP[item.prefab] or WINTER_FEAST_ITEMS_LOOKUP[item.prefab]))) then

                    if not grouped[item.prefab] then
                        grouped[item.prefab] = {}
                    end
                    table.insert(grouped[item.prefab], item)
                end
            end

            -- 对每种物品类型进行堆叠
            for prefab, group in pairs(grouped) do
                if #group > 1 then
                    -- 根据配置的排序方法进行排序
                    if SORT_METHOD == "most_first" then
                        -- 从多到少排序
                        table.sort(group, function(a, b)
                            return a.components.stackable.stacksize > b.components.stackable.stacksize
                        end)
                    elseif SORT_METHOD == "least_first" then
                        -- 从少到多排序
                        table.sort(group, function(a, b)
                            return a.components.stackable.stacksize < b.components.stackable.stacksize
                        end)
                    elseif SORT_METHOD == "balanced" then
                        -- 平均分配，先计算平均值
                        local total = 0
                        for _, item in ipairs(group) do
                            total = total + item.components.stackable.stacksize
                        end
                        local average = total / #group

                        -- 按照与平均值的差距排序
                        table.sort(group, function(a, b)
                            return math.abs(a.components.stackable.stacksize - average) <
                                   math.abs(b.components.stackable.stacksize - average)
                        end)
                    elseif SORT_METHOD == "old_to_new" then
                        -- 从老到新排序，使用实体的创建时间
                        table.sort(group, function(a, b)
                            local a_time = a.spawn_time or 0
                            local b_time = b.spawn_time or 0
                            if a_time == b_time then
                                return false
                            end
                            return b_time < a_time
                        end)
                    elseif SORT_METHOD == "new_to_old" then
                        -- 从新到老排序，使用实体的创建时间
                        table.sort(group, function(a, b)
                            local a_time = a.spawn_time or 0
                            local b_time = b.spawn_time or 0
                            if a_time == b_time then
                                return false
                            end
                            return a_time < b_time
                        end)
                    elseif SORT_METHOD == "near_to_far" then
                        -- 近到远排序，优先堆到离玩家最近的物品
                        table.sort(group, function(a, b)
                            local ax, _, az = a.Transform:GetWorldPosition()
                            local bx, _, bz = b.Transform:GetWorldPosition()
                            local da = (ax - x)^2 + (az - z)^2
                            local db = (bx - x)^2 + (bz - z)^2
                            return da < db
                        end)
                    elseif SORT_METHOD == "far_to_near" then
                        -- 远到近排序，优先堆到离玩家最远的物品
                        table.sort(group, function(a, b)
                            local ax, _, az = a.Transform:GetWorldPosition()
                            local bx, _, bz = b.Transform:GetWorldPosition()
                            local da = (ax - x)^2 + (az - z)^2
                            local db = (bx - x)^2 + (bz - z)^2
                            return da > db
                        end)
                    end

                    -- 从第一个物品开始，尝试将其他物品堆叠到它上面
                    local target = group[1]
                    for i = 2, #group do
                        local item = group[i]
                        -- 增加额外的安全检查
                        if target and target:IsValid() and item and item:IsValid() then
                            -- 确保目标和物品都有必要的组件
                            if target.components and target.components.stackable and
                               item.components and item.components.stackable then

                                if ENABLE_STACK_DELAY then
                                    -- 启用延迟堆叠
                                    player:DoTaskInTime(0.1 * (i-2), function()
                                        -- 再次检查物品是否有效
                                        if target and target:IsValid() and item and item:IsValid() then
                                            if target.components.stackable and
                                               not target.components.stackable:IsFull() then
                                                target.components.stackable:Put(item)
                                                SpawnStackSmoke(target)
                                                PlayStackSound(target)
                                            end
                                        end
                                    end)
                                else
                                    -- 直接堆叠
                                    if not target.components.stackable:IsFull() then
                                        target.components.stackable:Put(item)
                                        SpawnStackSmoke(target)
                                        PlayStackSound(target)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

-- 延迟启动定时器
AddSimPostInit(function()
    -- 使用配置的延迟时间
    GLOBAL.TheWorld:DoTaskInTime(START_DELAY, function()
        -- 处理0秒间隔的特殊情况
        if STACK_INTERVAL <= 0 then
            -- 每帧执行一次堆叠
            GLOBAL.TheWorld:DoPeriodicTask(0, EnhancedStackItems)
        else
            -- 使用配置的间隔时间
            GLOBAL.TheWorld:DoPeriodicTask(STACK_INTERVAL, EnhancedStackItems)
        end
            -- 定期清理
        if AUTO_CLEAN then
            local interval = CLEAN_INTERVAL * 60
            -- 清理前的通知（提前 N 秒公告）
            if CLEAN_NOTICE and CLEAN_NOTICE_ADVANCE > 0 
               and CLEAN_NOTICE_ADVANCE < interval then
                GLOBAL.TheWorld:DoPeriodicTask(interval,
                    function()
                        GLOBAL.TheNet:Announce(GetCleanNoticeText())
                    end,
                    interval - CLEAN_NOTICE_ADVANCE)
            end
            -- 清理本体
            GLOBAL.TheWorld:DoPeriodicTask(CLEAN_INTERVAL * 60, AutoCleanGarbage)
        end
    end)
end) 

