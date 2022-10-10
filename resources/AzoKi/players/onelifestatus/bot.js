const { Client } = require('/home/cfx/server/resources/AzoKi/players/onelifestatus/node_modules/discord.js');
const client = new Client;
const {updatePlayerCount} = require("/home/cfx/server/resources/AzoKi/players/onelifestatus/utils/")
global.config = require("/home/cfx/server/resources/AzoKi/players/onelifestatus/config.json")
// invite your bot
// https://discordapp.com/oauth2/authorize?client_id=your_client_id&scope=bot&permissions=8
client.on('ready', () => {
    console.log(`Bot Discord connecté sur : ${client.user.tag}`);
    updatePlayerCount(client, 5)
    //this will update the bot's activity every 5 seconds
});

client.login(config.token);