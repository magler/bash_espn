#!/bin/bash

# would like to change this so you can supply the methods and parameters as options. Will need to use getop to refine the script. 


# Array of available sports. *list is incomplete*
#sports=( golf baseball )


function getAllGolfers()
{   
    #get a list of all the golfers.and store the JSON in a file

    apikey=$1 #first argument to the script
    
    #Breaking the url in to each individual piece.
    #would like to change this to use a case statment to default to golf, but accept other sports as options.
    version="v1"
    method="/sports/golf/athletes"
    properties="?enable=stats,competitors&seasontype=reg&apikey=${apikey}&offset="
    apiurl="http://api.espn.com/"
    
    #combine them back for the final api url.
    api=${apiurl}
    
    #we know there are a total of 899 records
    # we will call the first 50 and then move on to the next 50 
    totalGolfers=899;
    offset=0;
    
    while [ $offset -lt $totalGolfers ] #lt means less than
    do
        curl "${api}${offset}">>getallgolfers
        ((offset += 50)); #bash was not liking the normal assignment so i had to use c style.
    done
}

### # # #
#  
### # # #
function getAthleteByName()
{
    #input the name of the golfer and return the athleatID.
    # WIP
    return 1;
}