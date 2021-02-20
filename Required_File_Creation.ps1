# Get Content and Declare file name with extensions
$topic_intent_all_data = Get-Content topicIntents.txt
$file_for_topics = "all_topics.txt"
$file_for_intents = "all_intents.txt"
$file_for_count_intents = "count-file.txt"

# first clear the all_topics.txt file
out-file $file_for_topics

#now filter only ## and write into all topics file
foreach($value in $topic_intent_all_data){
    if($value.StartsWith("## ")){
        $temp_value = $value.Substring(3,$value.Length-3)
        #echo $temp_value
        write $temp_value | Out-File $file_for_topics -Append
    }
}

# clear all count files
out-file $file_for_count_intents

# fetch the count for the intents
$intent_count = 0
foreach($value in $topic_intent_all_data){
    if($value.StartsWith("- ")){
        $intent_count = $intent_count+1
    }
    if($value.StartsWith("## ")){
        write $intent_count | out-file $file_for_count_intents -Append
        $intent_count = 0
    }
}

#clear all intents file
out-file $file_for_intents

# fetch all the intents from file
foreach($value in $topic_intent_all_data){
    if($value.StartsWith("- ")){
        $temp_value = $value.Substring(2,$value.Length-2)
        write $temp_value | out-file $file_for_intents -Append
    }
}
