#from .models import RobotsContent
import requests
from datetime import datetime, timedelta
import webbrowser
from .models import RobotsContent
import os
import json

#TODO
#MAKE THIS SCRIPT PARAMETARBLE 
#QUERY SEARCH  LIST KEY WORDS...rai|football|coronavirus min=1,max=10
#MAX NUMBER OF VIDEOS PER DAY between  min=5, max=50
#SORT BY :date – rating – relevance – viewCount 


#config file youtube robot
prop_youtube_file = "robots/prop_youtube.json"


def running ():
    print(datetime.now()," : \n")
    publishedAfter = datetime.now()-timedelta(days=1)
    #Load configuration
    with open(prop_youtube_file) as prop_file:
        prop_dict = json.load(prop_file)
    keyWords = "|".join(map(str,prop_dict["q"]))
    maxResults = prop_dict["maxResults"]
    order = prop_dict["order"]

    payload = {
            "q" : keyWords,
            "part" : "snippet",
            "videoEmbeddable" : "true", 
            "type" : "video",
            "fields" : "items/id/videoId,items/snippet/publishedAt",
            "maxResults" : maxResults,
            "order" : order,
            "publishedAfter" : publishedAfter.isoformat()+'Z',
            "key" : os.environ.get('YOUTUBE_API_KEY'),
            }
    
    try :
        res = requests.get("https://www.googleapis.com/youtube/v3/search",params=payload)
        res.raise_for_status()
        list_res = res.json()["items"].copy()
        print("publishedAt    VideoId\n")
        for e in list_res:
            url = e["id"]["videoId"]
            print(url)
            #webbrowser.open("https://www.youtube.com/watch?v="+str(e["id"]["videoId"]))
            date_iso_format = e["snippet"]["publishedAt"].replace("Z","")
            date = datetime.fromisoformat(date_iso_format).date()
            p = RobotsContent(source_type=1, url=url, date=date, valide=False)
            p.save()
            print(p.date,"  ",p.url)
        print("\nend \n")

    except requests.exceptions.HTTPError as err :
        print("HTTP error",err.response.text)
    
    except requests.exceptions.RequestException as err:
        print(err)

if __name__ == "__main__":
    running()
