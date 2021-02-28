# CYBER-DEVELOPER.COM - cyber-inventory-pro

## Introduction
> This inventory is fully created and edited to work in all versions of ESX, in version 1final, you should apply some changes.
Create this inventory because there are many inventories of this nature but in js. Here it is in lua.
All rights reserved to CYBER-DEVELOPER.COM, its sale or distribution without Cyber's consent, could be reportable as an international scam.

## Support
> Support is not provided other than that of this tutorial, since the script is simple.


## Installation

> First replace your es_extended or extendedmode with the one that comes in this folder.
I also include a modified extendedmode for greater compatibility.

> Install all SQL correctly. Make sure you have correctly installed the object 'cash' with weight 0.00.

> You can modify stores, durability and more within Config.lua in the inventory folder.

> You can edit the descriptions from the sqb cyber_itemdata.

> To place a stash use this TriggerEvent where you want to install it

TriggerEvent("cyber-inventory:openInventory", {
	["type"] = "stash",
	["owner"] = CurrentApartment
	})


> *** ATTENTION for it to work if or if you must have the extendedmode or the es_extended that is included in this package.***


## Recommendations
> Inventory system based on QBus, with system of weight, durability, descriptions and more, I recommend not touching the weapons folder.




## Credits
> Thanks to ESX and Qbus for lending me the resources to schedule this inventory.
