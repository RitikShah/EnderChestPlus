# By: rx97

# 5 Oct 2020

# 

#> @s: item from rx.ec:upgrade loot table

#> add item (called rx.ec:upgrade/gen)



tag @s add rx.ec.spawned



# store and strip

data modify storage rx:io playerdb.player.data.rx.ec.upgrade.items append value {item: {}, completed:0b}

data modify storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item set from entity @s Item

data remove storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.Slot



# count item stack count

execute store result score $count rx.temp run data get storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.Count



# construct lore + save

execute unless data storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.display run data modify block -30000000 0 1603 Text1 set value '[{"score":{"name":"$count","objective":"rx.temp"},"color":"#cd31e6"}, " ", {"selector": "@e[type=item,tag=rx.ec.spawned,limit=1]", "italic": true}]'

execute if data storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.display run data modify block -30000000 0 1603 Text1 set value '[{"score":{"name":"$count","objective":"rx.temp"},"color":"#cd31e6"}, " ", {"nbt": "playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.display.Name", "storage": "rx:io", "interpret": true, "italic": true}]'

data modify storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].lore set from block -30000000 0 1603 Text1



# remove display/skullowner

data remove storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.display

data remove storage rx:io playerdb.player.data.rx.ec.upgrade.items[-1].item.tag.SkullOwner



# delete item

kill @s
