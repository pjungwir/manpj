Count the items in an array:

    jq '.|length' foo.json

Get an attribute (e.g. `name`) for each object in an array:

    jq -r .[].name foo.json

(The -r is to get the strings without quotes.)

For each object in an array, print two attributes:

    jq -r '.[] | [.itemid, .warehouse] | @tsv' < items.json 

