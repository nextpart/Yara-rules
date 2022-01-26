rule Andromeda
{
meta:
	description = "Identifies Andromeda aka Gamarue botnet."
	author = "@bartblaze"
	date = "2021-03"
	tlp = "White"

strings:
	//IndexerVolumeGuid
	$ = { 8d ?? dc fd ff ff 50 8d ?? d8 fd ff ff 50 e8 ?? ?? ?? ?? 8a 00 53 68 ?? ?? ?? ?? 56 
	ff b? ?? ?? ?? ?? a2 ?? ?? ?? ?? e8 ?? ?? ?? ?? 83 c4 18 53 ff 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? 53 
	53 ff 15 ?? ?? ?? ?? ff b? ?? ?? ?? ?? ff 15 ?? ?? ?? ?? ff 15 ?? ?? ?? ?? a3 ?? ?? ?? ?? 83 f8 
	ff 74 ?? 6a 01 50 ff 15 ?? ?? ?? ?? }
	$ = { 83 c4 10 ff b? ?? ?? ?? ?? ff 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? ff b? ?? ?? ?? ?? ff b? 
	?? ?? ?? ?? ff 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? }
	
	/*
	MOV        DL ,byte ptr SS :[EAX  + EBP *0x1  + 0xffffff00 ]
	MOV        DH ,byte ptr SS :[EBX  + EBP *0x1  + 0xffffff00 ]
	MOV        byte ptr SS :[EAX  + EBP *0x1  + 0xffffff00 ],DH
	MOV        byte ptr SS :[EBX  + EBP *0x1  + 0xffffff00 ],DL
	*/
	$ =  { 36 8a 94 28 00 ff ff ff 02 da 36 8a b4 2b 00 ff ff ff 36 88 b4 28 00 ff ff ff 36 88 94 2b 00 ff ff ff }
	
condition:
	any of them
}
