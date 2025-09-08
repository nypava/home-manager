import os

#config.bind()
from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer

config: ConfigAPI = config
c: ConfigContainer = c 

config.load_autoconfig()

# unbind default keys
config.unbind("d", mode="normal")
config.unbind("u", mode="normal")
config.unbind("J", mode="normal")
config.unbind("K", mode="normal")
config.unbind("<Ctrl-u>", mode="normal")
config.unbind("<Ctrl-d>", mode="normal")

# new binding
config.bind("<Ctrl-d>", 'tab-close')
config.bind("<Ctrl-u>", 'undo')
config.bind("d", "scroll-page 0 0.5")
config.bind("J", "tab-prev")
config.bind("K", "tab-next")
config.bind("u", "scroll-page 0 -0.5")

config.bind(",m", "spawn --detach mpv {url}")

c.editor.command = ["kitty", "-e", "nvim", "{}"]

# adblockers config
c.content.blocking.method = "adblock"
c.content.blocking.adblock.lists = [
    "https://raw.githubusercontent.com/Isaaker/Spotify-AdsList/main/Lists/standard_list.txt",
    "https://raw.githubusercontent.com/Isaaker/Spotify-AdsList/main/Lists/adguard.txt",
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
    "https://secure.fanboy.co.nz/fanboy-social.txt",
    "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt"
]

# dark mode
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.policy.images = "never"

#proxy configuration
ip_address = os.popen("ip route get 1").read().split()[2]
c.content.proxy = f"http://{ip_address}:10809"

websites_list = ["https://monkeytype.com", "https://*.google.com/*", "https://*.youtube.com/*", "https://*.typeracer.com/*"]

#config.set("colors.webpage.darkmode.enabled", False, "file://*")

for website in websites_list:
     config.set("colors.webpage.darkmode.enabled", False, website)

c.url.default_page = "https://google.com/"
c.url.start_pages = [f"{os.path.expanduser("~")}/.config/qutebrowser/start-page/blank.html"] 

c.url.searchengines = {
    "DEFAULT": "https://google.com/search?q={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "ch": "https://chat.openai.com/?q={}"
}


