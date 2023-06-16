# quasar inventory items to ox
 
- For this you will need Lua installed on your PC. 

- If you do not have it installed, one way you can install it is by running the following commands as administrator in powershell:

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object   System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install lua

- first one will install chocolatey and the second will install lua for windows. You can install it other ways i just find this way easy for others to follow

- Once you have set up your file with the correct directories, example below
dofile("C:\\Users\\User\\Downloads\\convert\\old\\old_file.lua")

local file = io.open("C:\\Users\\User\\Downloads\\convert\\new\\new_file.lua", "w")

- now assuming your old_file.lua is correct as shown in the example and you have set up convert_items.lua, run the following commands in cmd

cd [directory the scripts are located in]

lua convert_items.lua

- It should now automatically populate new_file.lua with the correct format. If you had items with ' <--- that fucker in their description, you will need to either remove it or add \ before it.


If you need support or encounter issues use githubs issues tab, or if you are better at this than me feel free to make a pull request or fork a better version.
