@echo off


echo		[------------- Produto adquirido em / PROIBIDO a revenda -----------------]
echo		[---         ##   FiveM Brasil:  discord.gg/ZzjSfmdaVG   ##            ---]
echo		[-------------------------------------------------------------------------] 
echo.
echo         [-------------------------  Creditos de Dev  -----------------------------]
echo         [---                    Base: vRPEx São Paulo v6.3                   ---]
echo    	[---                    Developed by: SkipS#1234                       ---]
echo		[-------------------------------------------------------------------------] 
echo.
echo         [--------------------------  Redes Sociais  ------------------------------]
echo    	[---             Discord: discord.gg/ZzjSfmdaVG / SkipS#1234           ---]
echo    	[---                    Site: www.fivembrasil.com                      ---]
echo    	[---                   Instagram: @fivembrasill                        ---]
echo		[-------------------------------------------------------------------------] 
echo.
echo    	[---       Para suporte gratuito, consultar discord de clientes!       ---]
echo.
echo.

pause
start ..\build\FXServer.exe +exec config/config.cfg +set onesync on +set onesync_population false +set sv_enforceGameBuild 2372
exit