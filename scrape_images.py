import requests
from bs4 import BeautifulSoup
import os
import urllib.request

def download_image(image_url, pokemon_name):
    response = requests.get(image_url)
    with open(f"{pokemon_name}.png", 'wb') as file:
        file.write(response.content)

def get_pokemon_sprites(pokemon_name):
    url = f"https://pokemondb.net/sprites/{pokemon_name}"
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    
    # This will find the first image in the sprite overview section, which is the Gen 1 sprite
    img_tag = soup.find('div', class_='grid-col span-md-6 span-lg-4').find('img')
    image_url = img_tag['src']
    download_image(image_url, pokemon_name)

# List of Gen 1 Pokémon names
pokemon_names = ['bulbasaur', 'ivysaur', 'venusaur', 'charmander', 'charmeleon', 'charizard', 
                 'squirtle', 'wartortle', 'blastoise', 'caterpie', 'metapod', 'butterfree', 
                 'weedle', 'kakuna', 'beedrill', 'pidgey', 'pidgeotto', 'pidgeot', 'rattata', 
                 'raticate', 'spearow', 'fearow', 'ekans', 'arbok', 'pikachu', 'raichu', 
                 'sandshrew', 'sandslash', 'nidoran-f', 'nidorina', 'nidoqueen', 'nidoran-m', 
                 'nidorino', 'nidoking', 'clefairy', 'clefable', 'vulpix', 'ninetales', 'jigglypuff', 
                 'wigglytuff', 'zubat', 'golbat', 'oddish', 'gloom', 'vileplume', 'paras', 'parasect', 
                 'venonat', 'venomoth', 'diglett', 'dugtrio', 'meowth', 'persian', 'psyduck', 'golduck', 
                 'mankey', 'primeape', 'growlithe', 'arcanine', 'poliwag', 'poliwhirl', 'poliwrath', 
                 'abra', 'kadabra', 'alakazam', 'machop', 'machoke', 'machamp', 'bellsprout', 
                 'weepinbell', 'victreebel', 'tentacool', 'tentacruel', 'geodude', 'graveler', 
                 'golem', 'ponyta', 'rapidash', 'slowpoke', 'slowbro', 'magnemite', 'magneton', 
                 'farfetchd', 'doduo', 'dodrio', 'seel', 'dewgong', 'grimer', 'muk', 'shellder', 
                 'cloyster', 'gastly', 'haunter', 'gengar', 'onix', 'drowzee', 'hypno', 'krabby', 
                 'kingler', 'voltorb', 'electrode', 'exeggcute', 'exeggutor', 'cubone', 'marowak', 
                 'hitmonlee', 'hitmonchan', 'lickitung', 'koffing', 'weezing', 'rhyhorn', 'rhydon', 
                 'chansey', 'tangela', 'kangaskhan', 'horsea', 'seadra', 'goldeen', 'seaking', 
                 'staryu', 'starmie', 'mr-mime', 'scyther', 'jynx', 'electabuzz', 'magmar', 'pinsir', 
                 'tauros', 'magikarp', 'gyarados', 'lapras', 'ditto', 'eevee', 'vaporeon', 'jolteon', 
                 'flareon', 'porygon', 'omanyte', 'omastar', 'kabuto', 'kabutops', 'aerodactyl', 
                 'snorlax', 'articuno', 'zapdos', 'moltres', 'dratini', 'dragonair', 'dragonite', 'mewtwo', 'mew']


for pokemon_name in pokemon_names:
    get_pokemon_sprites(pokemon_name)
