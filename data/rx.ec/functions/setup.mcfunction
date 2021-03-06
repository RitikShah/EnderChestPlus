# By: rx97

# 4 Oct 2020

# 

#> Setup player



scoreboard players set @s rx.ec.currPage 0

scoreboard players set @s rx.ec.maxPage 0



function rx.playerdb:api/get_self



# setup data

data modify storage rx:temp ec.player set from entity @s

data modify storage rx:io playerdb.player.data.rx.ec.current_page set value []

data modify storage rx:io playerdb.player.data.rx.ec.up_pages set value []

data modify storage rx:io playerdb.player.data.rx.ec.down_pages set value []

data modify storage rx:io playerdb.player.data.rx.ec.scores.maxPage set value 0

data modify storage rx:io playerdb.player.data.rx.ec.scores.openChest set value 2



scoreboard players set $loop rx.temp 0



# generate upgrade

function rx.ec:upgrade/gen



# give enderchest items back, if exist

execute if data storage rx:temp ec.player.EnderItems[] run data remove block -30000000 0 1602 Items

execute if data storage rx:temp ec.player.EnderItems[] run loot replace entity @s enderchest.0 mine -30000000 0 1602 air{drop_contents:1b}

execute if data storage rx:temp ec.player.EnderItems[] run data modify block -30000000 0 1602 Items set from storage rx:temp ec.player.EnderItems

execute if data storage rx:temp ec.player.EnderItems[] run loot give @s mine -30000000 0 1602 air{drop_contents:1b}



# set manual in enderchest

item replace entity @s enderchest.13 with written_book{pages:['["",{"text":"E","color":"#661192"},{"text":"n","color":"#841aa7"},{"text":"d","color":"#a223bd"},{"text":"e","color":"#c12cd2"},{"text":"r","color":"#df35e8"},{"text":"C","color":"light_purple"},{"text":"h","color":"#e037ef"},{"text":"e","color":"#c32fe1"},{"text":"s","color":"#a627d2"},{"text":"t","color":"#891fc4"},{"text":"+","color":"#6c17b6"},{"text":" (tm)","color":"dark_gray","italic":true},{"text":"\\n","color":"reset"},{"text":"The storage solution for the modern age.","italic":true,"color":"#845f86"},{"text":"\\n\\n","color":"reset"},{"text":"-------------------","color":"dark_gray"},{"text":"\\n\\n","color":"reset"},{"text":"> Intro","color":"#845f86","clickEvent":{"action":"change_page","value":2},"hoverEvent":{"action":"show_text","contents":"Intro"}},{"text":"\\n","color":"reset"},{"text":"> Navigation","color":"dark_gray","clickEvent":{"action":"change_page","value":3},"hoverEvent":{"action":"show_text","contents":"Navigation"}},{"text":"\\n","color":"reset"},{"text":"> Upgrading","color":"#845f86","clickEvent":{"action":"change_page","value":4},"hoverEvent":{"action":"show_text","contents":"Upgrading"}},{"text":"\\n","color":"reset"},{"text":"> Shulker Loading","color":"dark_gray","clickEvent":{"action":"change_page","value":5},"hoverEvent":{"action":"show_text","contents":"Shulker Loading"}},{"text":"\\n","color":"reset"},{"text":">","color":"#845f86","clickEvent":{"action":"change_page","value":6},"hoverEvent":{"action":"show_text","contents":"Credits"}},{"text":" Credits","color":"#845f86","clickEvent":{"action":"change_page","value":6},"hoverEvent":{"action":"show_text","contents":"Credits"}},{"text":"\\n","color":"reset"},{"text":">","color":"dark_gray","clickEvent":{"action":"change_page","value":7},"hoverEvent":{"action":"show_text","contents":"Legal"}},{"text":" Legal","italic":true,"color":"dark_gray","clickEvent":{"action":"change_page","value":7},"hoverEvent":{"action":"show_text","contents":"Legal"}},{"text":"\\n\\n","color":"reset"},{"text":"-------------------","color":"dark_gray"}]','["",{"text":"< ","bold":true,"color":"#845f86","clickEvent":{"action":"change_page","value":1},"hoverEvent":{"action":"show_text","contents":"Table of Contents"}},{"text":"I","color":"#661192"},{"text":"n","color":"#b228c8"},{"text":"t","color":"light_purple"},{"text":"r","color":"#b52bda"},{"text":"o","color":"#6c17b6"},{"text":"\\n\\nWelcome to your new EnderChest+ Storage Solution.\\n\\nThis system augments your EnderChest to be infinitely expandable through the bleeding edge research from EnderChest+ Corp.","color":"reset"}]','["",{"text":"< ","bold":true,"color":"#845f86","clickEvent":{"action":"change_page","value":1},"hoverEvent":{"action":"show_text","contents":"Table of Contents"}},{"text":"N","color":"#661192"},{"text":"a","color":"#871baa"},{"text":"v","color":"#a925c2"},{"text":"i","color":"#cb2fda"},{"text":"g","color":"#ed39f2"},{"text":"a","color":"#ed3af6"},{"text":"t","color":"#cd31e6"},{"text":"i","color":"#ac28d6"},{"text":"o","color":"#8c1fc6"},{"text":"n","color":"#6c17b6"},{"text":"\\n\\nTo navigate, click on the items on the right side items in your enderchest. Click these items will navigate upwards or downwards.\\n\\nShift-clicking these items will skip to the first or last page.","color":"reset"}]','["",{"text":"< ","bold":true,"color":"#845f86","clickEvent":{"action":"change_page","value":1},"hoverEvent":{"action":"show_text","contents":"Table of Contents"}},{"text":"U","color":"#661192"},{"text":"p","color":"#8c1cad"},{"text":"g","color":"#b228c8"},{"text":"r","color":"#d833e3"},{"text":"a","color":"light_purple"},{"text":"d","color":"#d935ec"},{"text":"i","color":"#b52bda"},{"text":"n","color":"#9021c8"},{"text":"g","color":"#6c17b6"},{"text":"\\n\\nTo upgrade your system, just place the required materials upon the mini-enderchest item on the right-hand side.\\n\\nEach upgrade will progressively become more expensive!\\n\\nElder Essence can be obtained by slaying an Elder Guardian and Dragons Soul can be obtained by slaying the EnderDragon.","color":"reset"}]','["",{"text":"< ","bold":true,"color":"#845f86","clickEvent":{"action":"change_page","value":1},"hoverEvent":{"action":"show_text","contents":"Table of Contents"}},{"text":"S","color":"#661192"},{"text":"h","color":"#7d18a2"},{"text":"u","color":"#941fb3"},{"text":"l","color":"#ac26c3"},{"text":"k","color":"#c32dd4"},{"text":"e","color":"#da34e5"},{"text":"r ","color":"#f23bf5"},{"text":"L","color":"#f23bf8"},{"text":"o","color":"#dc35ed"},{"text":"a","color":"#c52fe2"},{"text":"d","color":"#af29d7"},{"text":"i","color":"#9823cc"},{"text":"n","color":"#821dc1"},{"text":"g","color":"#6c17b6"},{"text":"\\n\\nIf you own a Shulker Box, you can load/unload the materials of the box by clicking the box upon the mini-enderchest.\\n\\nThis will also swap the items from the enderchest page to the shulker box!","color":"reset"}]','["",{"text":"< ","bold":true,"color":"#845f86","clickEvent":{"action":"change_page","value":1},"hoverEvent":{"action":"show_text","contents":"Table of Contents"}},{"text":"C","color":"#661192"},{"text":"r","color":"#9820b6"},{"text":"e","color":"#cb2fda"},{"text":"d","color":"light_purple"},{"text":"i","color":"#cd31e6"},{"text":"t","color":"#9c24ce"},{"text":"s","color":"#6c17b6"},{"text":"\\n\\nThis datapack was created by rx97. \\n\\nIt uses a system called ","color":"reset"},{"text":"PlayerDB","clickEvent":{"action":"open_url","value":"https://github.com/rx-modules/MC-PlayerDB/"},"hoverEvent":{"action":"show_text","contents":"Takes you to PlayerDB Github"}},{"text":".\\n\\nYou can check for updates by looking for the latest release on my Github "},{"text":"here","clickEvent":{"action":"open_url","value":"https://github.com/rx-modules/EnderChestPlus/releases"},"hoverEvent":{"action":"show_text","contents":"Click to head to the Github releases page!"}},{"text":"."}]','["",{"text":"< ","bold":true,"color":"#845f86","clickEvent":{"action":"change_page","value":1},"hoverEvent":{"action":"show_text","contents":"Table of Contents"}},{"text":"L","color":"#661192"},{"text":"e","color":"#b228c8"},{"text":"g","color":"light_purple"},{"text":"a","color":"#b52bda"},{"text":"l","color":"#6c17b6"},{"text":"\\n\\n","color":"reset"},{"text":"There are no returns or refunds once you submit your materials for an upgrade. Complaints are sent to the bin. Side effects may include dysphoria, an addiction to upgrading, and a large deficit of netherite disappearing.","italic":true,"color":"dark_gray"}]'],title:"EnderChest+ Manual",author:rx97,display:{Name:'[{"text":"E","color":"#661192"},{"text":"n","color":"#79169f"},{"text":"d","color":"#8c1cad"},{"text":"e","color":"#9f22ba"},{"text":"r","color":"#b228c8"},{"text":"C","color":"#c52dd5"},{"text":"h","color":"#d833e3"},{"text":"e","color":"#eb39f0"},{"text":"s","color":"light_purple"},{"text":"t","color":"#eb3af5"},{"text":"+ ","color":"#d935ec"},{"text":"M","color":"#c730e3"},{"text":"a","color":"#b52bda"},{"text":"n","color":"#a226d1"},{"text":"u","color":"#9021c8"},{"text":"a","color":"#7e1cbf"},{"text":"l","color":"#6c17b6"}]',Lore:['{"text":"A guide on how to","color":"dark_gray","italic":false}','{"text":"use your brand new","color":"dark_gray","italic":false}','{"text":"EnderChest+(tm) System","color":"dark_gray","italic":false}']}} 1



# set gui icons

function rx.ec:gui/fix



# audiovisual

execute at @s run playsound minecraft:entity.firework_rocket.launch voice @s ~ ~ ~ 1 2



function rx.playerdb:api/save_self

scoreboard players add @s rx.ec.openChest 1
