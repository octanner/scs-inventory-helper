# inventory-helper
---
## A Module to___.

*How to Install this module*

From a terminal or CML interface
```
    box install inventory-helper --save
```


*How to Configure your module*

Your ModuleConfig.cfc. will have by default these initial fake settings.
settings = {   
        'apiUrl' = "http:fakesite.com"   
    };   

**Step 1: Override default apiUrl to send jobs to your own URL (one time change)**

Override default ModuleConfig.cfc with your own settings for where the scs-inventory-api??? lives. You can do this by Making sure you add 'inventory-helper' node to the *moduleSettings* object in the Coldbox.cfc  (if not present add it inside of the configure() function )
```
   		moduleSettings = {
            'inventory-helper' = { 'apiUrl' : '[your inventory API URL]' }
        };  
```
FYI only, behind the scenes Coldbox will interpret the new settings correctly  in this manner (no need to insert this code)
    property name="inventory-helper-URL"    inject="coldbox:modulesettings:inventory-helper"; 



**Step 2: Instanciate your Model from your newly installed Module**

When you declare a module and define a model's folder the framework automatically registers all models in that folder for you using a namespace of @moduleName in this case @inventory-helper .
In other words you will have to create a new property and inject the model of your choice. The pattern to inject its value is [Model]@[Module]
```
	property name='inventoryHelper' inject='inventoryRequestHelper@inventory-helper';
```

**Step 3: call the inventory() method and pass your data.**

Once your property has been declared and injected with the model, you are ready to use it, here is an example of the minimum required parameters you need to pass:
```
    inventoryHelper.inventory(inventory = [inventory], fullPath = [fullPathToFIle]);
```
Here are additional parameters with their default values (but are not required.)  
required string printer,  
required string fullPath,  
numeric copies = 1,  (Default is 1)
string layout = "portrait", () ["landscape","portrait"] default is portrait)
numeric scale = 100  (Default is 100)
