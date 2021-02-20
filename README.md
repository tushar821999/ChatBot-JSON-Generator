# ChatBot-JSON-Generator :rocket:
:speech_balloon: PowerShell script to separate topics and intent from a file and fetch questions for each intent from md file and merge them into JSON file.

# File Structure :bookmark:
- <b>Required_File_Creation.ps1 (powershell script)</b> <br>
:dash: <i>This scripts generates three files</i>  <br>
:point_right: all_intents.txt (contains all the intents) <br>
:point_right: all_topics.txt (contains all the topics) <br>
:point_right: count-file.txt (contains intents count for each topic) <br><br>
- <b>Json_Generation_Script.ps1 (powershell script)</b> <br>
:dash: <i>This scripts generates output json files</i>  <br>
:point_right: Example : ./output_json/topicName_Intent.json <br><br>
- <b>Brain : Question .MD Files</b><br>
:dash: <i>This folder contains .md file for all intents

# Flow of Script :rocket:

<img src="https://github.com/tushar821999/ChatBot-JSON-Generator/blob/main/what_scripts_does.PNG?raw=true">
