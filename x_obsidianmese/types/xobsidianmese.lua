---@diagnostic disable: codestyle-check
---Base class XObsidianmese
---@class XObsidianmese
---@field damage_calculator fun(player: ObjectRef, puncher: ObjectRef, tflp: number, caps: ToolCapabilitiesDef, direction: Vector, attacker: any): number
---@field add_effects fun(pos: Vector): number | nil
---@field check_around_radius fun(pos: Vector): boolean
---@field within_limits fun(pos: Vector, radius): boolean
---@field sync_fired_table fun(owner: ObjectRef): nil
---@field fire_sword fun(itemstack: ItemStack, user: ObjectRef, pointed_thing: PointedThingDef): ItemStack | nil
---@field add_wear fun(itemstack: ItemStack, pos: Vector): ItemStack
---@field pick_engraved_place fun(itemstack: ItemStack, placer: ObjectRef, pointed_thing: PointedThingDef): ItemStack
---@field shovel_place fun(itemstack: ItemStack, placer: ObjectRef, pointed_thing: PointedThingDef): ItemStack | nil
---@field dig_up fun(pos: Vector, node: NodeDef, digger: ObjectRef): nil
---@field register_capitator fun(): nil
---@field player_axis fun(player: ObjectRef): string, number
---@field hoe_on_use fun(itemstack: ItemStack, user: ObjectRef, pointed_thing: PointedThingDef): nil
---@field get_chest_formspec fun(): string
---@field register_chest fun(name: string, d: table): nil
