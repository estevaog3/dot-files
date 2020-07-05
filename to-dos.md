# Problem 1: 
dconf dump file has entries that uses paths looking for "estevao" direcoty in "/home"
## Posible solutions:
	1. Replace current dump file with another dump that only contains entries have been edited by me (entries that differ from default values) and that don't contains paths with my name.
	2. Save in the repo only the most important dconf settings (e.g.: font-sizes, dashtodock configurations...). Parse theses settings and apply it with the command `dconf write KEY VALUE`
