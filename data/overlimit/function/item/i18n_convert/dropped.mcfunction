execute if items entity @s contents *[custom_data~{overlimit:{recall_watch:true}}] run return run function overlimit:item/i18n_convert/from_loot {slot:"contents",nbt:"Item.count",table:"overlimit:recall_watch"}
execute if items entity @s contents *[custom_data~{overlimit:{phoenix_amulet:true}}] run return run function overlimit:item/i18n_convert/from_loot {slot:"contents",nbt:"Item.count",table:"overlimit:phoenix_amulet"}
execute if items entity @s contents *[custom_data~{overlimit:{bm_totem:true}}] run return run function overlimit:item/i18n_convert/from_loot {slot:"contents",nbt:"Item.count",table:"overlimit:bm_totem"}
execute if items entity @s contents *[custom_data~{overlimit:{quiet_totem:true}}] run return run function overlimit:item/i18n_convert/from_loot {slot:"contents",nbt:"Item.count",table:"overlimit:quiet_totem"}
execute if items entity @s contents *[custom_data~{overlimit:{holy_totem:true}}] run return run function overlimit:item/i18n_convert/from_loot {slot:"contents",nbt:"Item.count",table:"overlimit:holy_totem"}
execute if items entity @s contents *[custom_data~{overlimit:{mini_golem:true}}] run return run function overlimit:item/i18n_convert/from_loot {slot:"contents",nbt:"Item.count",table:"overlimit:mini_golem"}
execute if items entity @s contents *[custom_data~{overlimit:{golden_bow:true}}] run return run item modify entity @s contents overlimit:i18n_names
execute if items entity @s contents *[custom_data~{overlimit:{bm_totem_spent:true}}] run return run item modify entity @s contents overlimit:i18n_names
execute if items entity @s contents *[custom_data~{overlimit:{quiet_totem_spent:true}}] run return run item modify entity @s contents overlimit:i18n_names
execute if items entity @s contents *[custom_data~{overlimit:{holy_totem_spent:true}}] run return run item modify entity @s contents overlimit:i18n_names
