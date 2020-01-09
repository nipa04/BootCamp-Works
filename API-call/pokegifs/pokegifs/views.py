import requests
import json
import os
from django.http import JsonResponse

key = os.environ.get("GIPHY_KEY")


def pokemon_view(request, id):
    api_url = "http://pokeapi.co/api/v2/pokemon/{}/".format(id)
    res = requests.get(api_url)
    body = json.loads(res.content)
    name = body["name"]
    types = []
    for type in body['types']:
        types.append(type["type"]["name"])

    gif_url = "http://api.giphy.com/v1/gifs/search?api_key={}&q={}".format(key, name)
    print(gif_url)
    gif_res = requests.get(gif_url)
    gif_body = json.loads(gif_res.content)
    gif = gif_body['data'][0]['url']


    return JsonResponse({
        "name": name,
        "id": id,
        "types": types,
        "gif": gif,
    })
