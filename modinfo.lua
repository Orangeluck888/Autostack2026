
local function GetLanguage()
    return locale ~= nil and locale or "zh"
end

local is_chinese = GetLanguage():find("zh") ~= nil


name = is_chinese and "自动堆叠掉落物 2026" or "Auto Stack Items 2026"
description = is_chinese and "自动将附近的同类掉落物堆叠在一起，极致的简单极致的性能。" or "Automatically stack nearby similar items,The ultimate simplicity and the ultimate performance."
author = "Salt510"
version = "2026.1.4"


dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
hamlet_compatible = true


client_only_mod = false
all_clients_require_mod = true


api_version = 10


icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {
    "自动堆叠",
    "Auto Stack",
    "SALT510",
}


local config_labels = {
    stack_interval = is_chinese and "堆叠间隔" or "Stack Interval",
    stack_interval_hover = is_chinese and "多久执行一次堆叠操作（秒）" or "How often to perform stacking (seconds)",
    stack_radius = is_chinese and "堆叠范围" or "Stack Radius",
    stack_radius_hover = is_chinese and "检查多大范围内的物品进行堆叠（格子）" or "How far to check for items to stack (tiles)",
    start_delay = is_chinese and "启动延迟" or "Start Delay",
    start_delay_hover = is_chinese and "游戏开始后多久开始第一次堆叠（秒）" or "How long to wait before first stack after game starts (seconds)",
    sort_method = is_chinese and "堆叠顺序" or "Stack Order",
    sort_method_hover = is_chinese and "决定如何选择堆叠目标" or "Determines how to choose stacking targets",
    most_first = is_chinese and "多到少" or "Most to Least",
    most_first_hover = is_chinese and "优先堆叠到数量最多的物品" or "Stack to items with the most quantity first",
    least_first = is_chinese and "少到多" or "Least to Most",
    least_first_hover = is_chinese and "优先堆叠到数量最少的物品" or "Stack to items with the least quantity first",
    balanced = is_chinese and "平均分配" or "Balanced",
    balanced_hover = is_chinese and "尝试平均分配物品数量" or "Try to distribute items evenly",
    recommended = is_chinese and "推荐" or "Recommended",
    seconds = function(n) return is_chinese and n.."秒" or n.." seconds" end,
    zero_seconds = is_chinese and "0秒" or "0 seconds",
    instant = is_chinese and "立即" or "Instant",
    tiles = function(n) return is_chinese and n.."格" or n.." tiles" end,
    stack_delay = is_chinese and "延迟堆叠" or "Stack Delay",
    stack_delay_hover = is_chinese and "开启后物品会逐个堆叠，确保特殊效果能正确触发，比如恶魔人的灵魂治疗。" or "Items will stack one by one to ensure special effects trigger correctly,for example, the soul healing of the demonic beings",
    stack_delay_on = is_chinese and "开启" or "Enable",
    stack_delay_off = is_chinese and "关闭" or "Disable",
    stack_delay_on_hover = is_chinese and "物品会逐个堆叠" or "Items will stack one by one",
    stack_delay_off_hover = is_chinese and "物品会立即堆叠" or "Items will stack instantly",
    allow_mob_stack = is_chinese and "允许小型生物堆叠" or "Allow Mob Stacking",
    allow_mob_stack_hover = is_chinese and "是否允许小型生物（如萤火虫等）进行堆叠" or "Whether to allow stacking of creatures (like fireflies)",
    allow_mob_stack_on = is_chinese and "允许" or "Allow",
    allow_mob_stack_off = is_chinese and "禁止" or "Disallow",
    allow_mob_stack_on_hover = is_chinese and "小型生物可以堆叠" or "Creatures can be stacked",
    allow_mob_stack_off_hover = is_chinese and "小型生物不会堆叠" or "Creatures will not be stacked",
    old_to_new = is_chinese and "老到新" or "Old to New",
    old_to_new_hover = is_chinese and "优先将旧物品堆叠到新物品上" or "Stack older items onto newer items",
    new_to_old = is_chinese and "新到老" or "New to Old",
    new_to_old_hover = is_chinese and "优先将新物品堆叠到旧物品上" or "Stack newer items onto older items",
    stack_mode = is_chinese and "堆叠模式" or "Stack Mode",
    stack_mode_hover = is_chinese and "选择哪些物品可以堆叠" or "Choose which items can be stacked",
    stack_all = is_chinese and "堆叠所有物品" or "Stack All Items",
    stack_all_hover = is_chinese and "堆叠所有可堆叠的物品" or "Stack all stackable items",
    stack_basic = is_chinese and "仅堆叠基础资源" or "Stack Basic Resources Only",
    stack_basic_hover = is_chinese and "只堆叠木头、石头、草、树枝和石果等基础资源" or "Only stack logs, rocks, grass, twigs, and flint etc.",
    stack_basic_winter = is_chinese and "基础资源+冬季盛宴物品" or "Basic Resources + Winter Feast Items",
    stack_basic_winter_hover = is_chinese and "堆叠基础资源和冬季盛宴的物品" or "Stack basic resources and Winter Feast items",
    exclude_traps = is_chinese and "排除陷阱" or "Exclude Traps",
    exclude_traps_hover = is_chinese and "是否排除陷阱类物品的堆叠" or "Whether to exclude traps from stacking",
    exclude_traps_on = is_chinese and "排除" or "Exclude",
    exclude_traps_off = is_chinese and "不排除" or "Don't Exclude",
    exclude_traps_on_hover = is_chinese and "陷阱不会被堆叠" or "Traps will not be stacked",
    exclude_traps_off_hover = is_chinese and "陷阱可以被堆叠" or "Traps can be stacked",
    protect_rare = is_chinese and "保护稀有物品" or "Protect Rare Items",
    protect_rare_hover = is_chinese and "是否保护稀有物品不被堆叠" or "Whether to protect rare items from stacking",
    protect_rare_on = is_chinese and "保护" or "Protect",
    protect_rare_off = is_chinese and "不保护" or "Don't Protect",
    protect_rare_on_hover = is_chinese and "（巨鹿眼球，熊皮，龙蝇皮等）稀有物品不会被堆叠" or "Rare items will not be stacked",
    protect_rare_off_hover = is_chinese and "（巨鹿眼球，熊皮，龙蝇皮等）稀有物品可以被堆叠" or "Rare items can be stacked",
    smoke_puff = is_chinese and "堆叠时冒烟" or "Smoke Puff on Stacking",
    smoke_puff_hover = is_chinese and "在堆叠发生的位置显示一团烟雾，让自动堆叠看得见。" or "Show a smoke puff at the stacking location so auto-stacking are visible.",
    smoke_puff_on = is_chinese and "是" or "Yes",
    smoke_puff_off = is_chinese and "否" or "No",
    smoke_puff_on_hover = is_chinese and "堆叠时显示烟雾" or "Show smoke when stacking",
    smoke_puff_off_hover = is_chinese and "堆叠时不显示烟雾" or "No smoke when stacking",
    smoke_puff_type = is_chinese and "烟雾样式" or "Smoke Puff Style",
    smoke_puff_type_hover = is_chinese and "选择堆叠时冒出的烟雾特效样式。" or "Choose the smoke puff effect style when stacking.",
    smoke_puff_small = is_chinese and "小白烟（默认）" or "Small Puff (Default)",
    smoke_puff_sand = is_chinese and "沙尘烟" or "Sand Puff",
    smoke_puff_slide = is_chinese and "滑行烟" or "Slide Puff",
    smoke_puff_round = is_chinese and "圆烟" or "Round Puff",
    smoke_puff_puffin = is_chinese and "海雀水花" or "Puffin Water",
}


configuration_options = {
    {
        name = "STACK_INTERVAL",
        label = config_labels.stack_interval,
        hover = config_labels.stack_interval_hover,
        options = {
            {description = config_labels.instant, data = 0, hover = config_labels.recommended},
            {description = config_labels.seconds(0.1), data = 0.1},
            {description = config_labels.seconds(0.25), data = 0.25},
            {description = config_labels.seconds(0.5), data = 0.5},
            {description = config_labels.seconds(0.75), data = 0.75},
            {description = config_labels.seconds(1), data = 1},
            {description = config_labels.seconds(2), data = 2},
            {description = config_labels.seconds(5), data = 5},
            {description = config_labels.seconds(10), data = 10},
            {description = config_labels.seconds(20), data = 20},
            {description = config_labels.seconds(30), data = 30},
            {description = config_labels.seconds(60), data = 60},
            {description = config_labels.seconds(120), data = 120}
        },
        default = 0.1
    },
    {
        name = "STACK_RADIUS",
        label = config_labels.stack_radius,
        hover = config_labels.stack_radius_hover,
        options = {
            {description = config_labels.tiles(3), data = 3},
            {description = config_labels.tiles(5), data = 5},
            {description = config_labels.tiles(8), data = 8},
            {description = config_labels.tiles(10), data = 10},
            {description = config_labels.tiles(15), data = 15},
            {description = config_labels.tiles(20), data = 20},
            {description = config_labels.tiles(30), data = 30},
            {description = config_labels.tiles(50), data = 50},
            {description = config_labels.tiles(100), data = 100, hover = config_labels.recommended},
            {description = config_labels.tiles(200), data = 200},
            {description = config_labels.tiles(500), data = 500},
        },
        default = 100
    },
    {
        name = "START_DELAY",
        label = config_labels.start_delay,
        hover = config_labels.start_delay_hover,
        options = {
            {description = config_labels.seconds(5), data = 5, hover = config_labels.recommended},
            {description = config_labels.seconds(10), data = 10},
            {description = config_labels.seconds(20), data = 20},
            {description = config_labels.seconds(30), data = 30},
            {description = config_labels.seconds(60), data = 60}
        },
        default = 5
    },
    {
        name = "SORT_METHOD",
        label = config_labels.sort_method,
        hover = config_labels.sort_method_hover,
        options = {
            {description = config_labels.most_first, data = "most_first", hover = config_labels.most_first_hover},
            {description = config_labels.least_first, data = "least_first", hover = config_labels.least_first_hover},
            {description = config_labels.balanced, data = "balanced", hover = config_labels.balanced_hover},
            {description = config_labels.old_to_new, data = "old_to_new", hover = config_labels.old_to_new_hover},
            {description = config_labels.new_to_old, data = "new_to_old", hover = config_labels.new_to_old_hover}   
        },
        default = "balanced",
    },
    {
        name = "STACK_DELAY",
        label = config_labels.stack_delay,
        hover = config_labels.stack_delay_hover,
        options = {
            {description = config_labels.stack_delay_on, data = true, hover = config_labels.stack_delay_on_hover},
            {description = config_labels.stack_delay_off, data = false, hover = config_labels.stack_delay_off_hover},
        },
        default = false,
    },
    {
        name = "ALLOW_MOB_STACK",
        label = config_labels.allow_mob_stack,
        hover = config_labels.allow_mob_stack_hover,
        options = {
            {description = config_labels.allow_mob_stack_on, data = true, hover = config_labels.allow_mob_stack_on_hover},
            {description = config_labels.allow_mob_stack_off, data = false, hover = config_labels.allow_mob_stack_off_hover},
        },
        default = false,
    },
    {
        name = "STACK_MODE",
        label = config_labels.stack_mode,
        hover = config_labels.stack_mode_hover,
        options = {
            {description = config_labels.stack_all, data = "all", hover = config_labels.stack_all_hover},
            {description = config_labels.stack_basic, data = "basic", hover = config_labels.stack_basic_hover},
            {description = config_labels.stack_basic_winter, data = "basic_winter", hover = config_labels.stack_basic_winter_hover},
        },
        default = "all",
    },
    {
        name = "EXCLUDE_TRAPS",
        label = config_labels.exclude_traps,
        hover = config_labels.exclude_traps_hover,
        options = {
            {description = config_labels.exclude_traps_on, data = true, hover = config_labels.exclude_traps_on_hover},
            {description = config_labels.exclude_traps_off, data = false, hover = config_labels.exclude_traps_off_hover},
        },
        default = true,
    },
    {
        name = "PROTECT_RARE",
        label = config_labels.protect_rare,
        hover = config_labels.protect_rare_hover,
        options = {
            {description = config_labels.protect_rare_on, data = true, hover = config_labels.protect_rare_on_hover},
            {description = config_labels.protect_rare_off, data = false, hover = config_labels.protect_rare_off_hover},
        },
        default = false,
    },
    {
        name = "SMOKE_PUFF_ON_STACKING",
        label = config_labels.smoke_puff,
        hover = config_labels.smoke_puff_hover,
        options = {
            {description = config_labels.smoke_puff_on, data = true, hover = config_labels.smoke_puff_on_hover},
            {description = config_labels.smoke_puff_off, data = false, hover = config_labels.smoke_puff_off_hover},
        },
        default = true,
    },
    {
        name = "SMOKE_PUFF_TYPE",
        label = config_labels.smoke_puff_type,
        hover = config_labels.smoke_puff_type_hover,
        options = {
            {description = config_labels.smoke_puff_small, data = "small_puff"},
            {description = config_labels.smoke_puff_sand, data = "sand_puff"},
            {description = config_labels.smoke_puff_slide, data = "slide_puff"},
            {description = config_labels.smoke_puff_round, data = "round_puff_fx"},
            {description = config_labels.smoke_puff_puffin, data = "puffin_water"},
        },
        default = "small_puff",
    },
} 