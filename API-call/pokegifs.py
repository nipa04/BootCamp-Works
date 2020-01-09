import json
import requests
import os

giphy_key = os.environ.get("GIPHY_KEY")
pokemon_name = 'pikachu'

# res = requests.get("http://pokeapi.co/api/v2/pokemon/pikachu/")
# body = json.loads(res.content)
# print(body["name"]) # should be "pikachu"

poke_response = requests.get(f"https://pokeapi.co/api/v2/pokemon/{pokemon_name}")
poke_body = json.loads(poke_response.content)
print(f"The pokemon name is {poke_body['name']}")
for type in poke_body['types']:
    print(f"The type of the pokemon is {type['type']['name']}")


# import os
# key = os.environ.get("GIPHY_KEY")
# res = requests.get("https://api.giphy.com/v1/gifs/search?api_key={}&q=pikachu&rating=g".format(key))
# body = json.loads(res.content)
# url = "https://api.giphy.com/v1/gifs/search?api_key={}&q=pikachu&rating=g".format(key)
# print(body["url"])

giphy_response = requests.get(f"https://api.giphy.com/v1/gifs/search?api_key={giphy_key}&q={pokemon_name}&rating=g")
giphy_body = json.loads(giphy_response.content)
gif_url = giphy_body['data'][0]['url']
print(f"The location of the gif is: {gif_url}")

# url = "https://api.giphy.com/v1/gifs/search?api_key={}&q=pikachu&rating=g".format(giphy_key)
# res2 = requests.get(url)
# body2 = json.loads(res2.content)
# print(body2['data'][0]['url'])


# key = os.environ.get("GIPHY_KEY")
# url = "https://api.giphy.com/v1/gifs/search?api_key={}&q=pikachu&rating=g".format(key)
# response = requests.get(url)
# print(url)
# print(response.content.keys())
