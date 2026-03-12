# moonshine4homeassistant
An unofficial attempt at making a drop in add-on for Home Assistant Nabu to replace Whisper with [Moonshine](https://github.com/moonshine-ai/moonshine)

This is a (rough) fork of https://github.com/home-assistant/addons/blob/master/whisper

And depends on (another fork) of https://github.com/rhasspy/wyoming-faster-whisper at https://github.com/holdenk/wyoming-moonshine-ext/

Both from https://github.com/OHF-Voice/wyoming


## Why?

Whisper is slow, lots of people use RPIs for HA, and moonshine is better speech to text for RPIs (among other places).

## Who?

Right now Holden.

## Does it work?

Sort of!

### Installation

You can install this into your HA by adding https://github.com/PigsCanFlyLabs/moonshine4homeassistant as a repo in your HA app installation. Then install the Moonshine App.

Once installed you will need to go to Settings ->  Devices and Services -> Wyoming Protocol and then you should see "Moonshine" with an "add" button.

If you don't see moonshine as an option to add under the wyoming protocl you can manually add it by giving it the hostname and port of the moonshine container (see the running app page).

Once added to the Wyoming Protocol "friends list" you can configure it to be used with your voice assistant under settings, Voice Assistants, (your voice assistant here), Speech-to-text.

## License

This code is ASFv2 licensed, there are seperate Moonshine licenses (most users can probably depend on the automatic non-commercial, but I am not a lawyer nor do I play one on TV so please talk to a license expert before you distribute this plugin).
