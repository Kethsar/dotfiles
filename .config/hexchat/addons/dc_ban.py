import hexchat

__module_name__ = "DC Ban"
__module_version__ = "0.1"
__module_description__ = "Ban a user and send them a message telling them to PM you to get unbanned when their network is not shit"


zncModule = "*dcban"
modCtx = None

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

def dcban(word, word_eol, userdata):
	if len(word) < 2:
		print('Provide a nick to ban')
	else:
		nick = word[1]
		ctx = getModuleCtx()
		if ctx:
			ctx.command("say ban " + nick)

hexchat.hook_command('dcban', dcban)
