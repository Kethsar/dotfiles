from __future__ import print_function
import hexchat
import re

__module_name__ = "Hanyuu Guest Proxy"
__module_version__ = "0.4"
__module_description__ = "Authorize someone to use Hanyuu in #r/a/dio"

zncModule = "*hanyuu_guestauth_znc"
modCtx = None
blacklist = [
	'mikospark',
	'kyubae'
]

def getModuleCtx():
	global modCtx

	if modCtx:
		return modCtx

	rizonCtx = hexchat.find_context('rizonznc') or hexchat.find_context('rizon')

	if not rizonCtx:
		return None

	rizonName = rizonCtx.get_info('network')
	modCtx = hexchat.find_context(rizonName, zncModule)

	if not modCtx:
		rizonCtx.command("query " + zncModule)
	
	modCtx = hexchat.find_context(rizonName, zncModule)

	return modCtx

def setAuth(word, word_eol, userdata):
	if len(word) < 2:
		print('Provide a nick that will be allowed to set Hanyuu as DJ')
	else:
		global modCtx
		getModuleCtx()

		authnicks = ""
		for i in range(1, len(word)):
			if word[i].lower() in blacklist:
				continue
			
			authnicks += word[i] + " "

		authnicks = authnicks.strip()
		if modCtx:
			modCtx.command("say auth " + authnicks)

def resetAuth(word='', word_eol='', userdata=''):
	global modCtx
	getModuleCtx()

	if modCtx:
		modCtx.command("say resetauth")

def guestHelp(word, word_eol, userdata):
	if len(word) < 2:
		print('Provide a nick that will be allowed to set Hanyuu as DJ')
	else:
		global modCtx
		getModuleCtx()

		authnicks = ""
		for i in range(1, len(word)):
			if word[i].lower() in blacklist:
				continue
			
			authnicks += word[i] + " "

		authnicks = authnicks.strip()
		if modCtx:
			modCtx.command("say guesthelp " + authnicks)

hexchat.hook_command("djauth", setAuth, help="/djauth <nick> Allows <nick> to kill Hanyuu within 24 hours and sets them as DJ")
hexchat.hook_command("guesthelp", guestHelp, help="/guesthelp <nick> Shows <nick> the help messages without authing them")
hexchat.hook_command("guestauth", setAuth, help="/guestauth <nick> Allows <nick> to kill Hanyuu within 24 hours and sets them as DJ")
hexchat.hook_command("resetauth", resetAuth)
hexchat.hook_command("resetguest", resetAuth)
