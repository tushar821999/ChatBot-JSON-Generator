$all_intents = Get-Content all_intents.txt
$all_topics = Get-Content all_topics.txt
$count = Get-Content count-file.txt 

# count_of_count = all_topic
# count = all_intent

$all_intents_count = $all_intents.Length+1
$all_topics_count = $all_topics.Length+1
$count_count = $count.Length+1

echo $all_intents_count
echo $all_topics_count
echo $count_count

$sum = 0

#$all_topics_count
$count_temp = 0
for($i=0;$i -lt $all_topics_count;$i++){
    $topic = $all_topics | Select-Object -Index $i
    $topic_count = $count | Select-Object -Index $i
    echo $topic_count
    $count++
    for($j=0;$j -lt $topic_count;$j++){
        $temp_intent = $all_intents | Select-Object -Index $count_temp
        $count_temp = $count_temp+1
        #echo $temp_intent
        $intent_file_name = ".\brain\"+$temp_intent+".md"
        $json_record = ''
        if(Test-Path $intent_file_name){
            $data = Get-Content $intent_file_name
            foreach($line in $data){
                if($line.startswith("- ")){
                    $temp_line = $line.Substring(2,$line.Length-2)
                    #echo $temp_line
                    $json_record = $json_record + '{"que":"'+$temp_line+'","intent":"'+$temp_intent+'"},'
                }
            }
            $final_json_response = "["+$json_record.Substring(0,$json_record.Length-1)+"]" | ConvertFrom-Json | ConvertTo-Json
            write $final_json_response | Out-File .\output_json\$topic`_$temp_intent.json -Append
        }
    }
}
