local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_salar")

salarii = {
  {"salariopmesp.recruta", 1500},
  {"salariopmesp.soldado", 1900},
  {"salariopmesp.cabo", 2100},
  {"salariopmesp.sargento", 2300},
  {"salariopmesp.subtenente", 2400},
  {"salariopmesp.tenente", 2600},
  {"salariopmesp.capitao", 3800},
  {"salariopmesp.major", 4000},
  {"salariopmesp.coronel", 5500},

  {"salariorocam.cabo", 2100},
  {"salariorocam.sargento", 2300},
  {"salariorocam.subtenente", 2400},
  {"salariorocam.tenente", 2600},
  {"salariorocam.capitao", 3800},
  {"salariorocam.major", 4000},
  {"salariorocam.coronel", 5500},

  {"salariogrpae.1classe", 4000},
  {"salariogrpae.2classe", 4500},
  {"salariogrpae.3classe", 5000},

  {"salarioft.soldado", 4800},
  {"salarioft.cabo", 5000},
  {"salarioft.sargento", 5500},
  {"salarioft.subtenente", 6000},
  {"salarioft.tenente", 6500},
  {"salarioft.capitao", 7000},
  {"salarioft.major", 7500},
  {"salarioft.tencoronel", 7700},
  {"salarioft.coronel", 8000},


  {"salariobaep.soldado", 5800},
  {"salariobaep.cabo", 6000},
  {"salariobaep.sargento", 6500},
  {"salariobaep.subtenente", 7000},
  {"salariobaep.tenente", 7500},
  {"salariobaep.capitao", 8000},
  {"salariobaep.major", 8500},
  {"salariobaep.tencoronel", 8700},
  {"salariobaep.coronel", 9000},

  {"salariorota.soldado", 5800},
  {"salariorota.cabo", 6000},
  {"salariorota.sargento", 6500},
  {"salariorota.subtenente", 7000},
  {"salariorota.tenente", 7500},
  {"salariorota.capitao", 8000},
  {"salariorota.major", 8500},
  {"salariorota.tencoronel", 8700},
  {"salariorota.coronel", 9000},

  {"salarioeb.soldado", 4500},
  {"salarioeb.cabo", 4800},
  {"salarioeb.sargento", 5000},
  {"salarioeb.subtenente", 5200},
  {"salarioeb.tenente", 5500},
  {"salarioeb.capitao", 6000},
  {"salarioeb.major", 6200},
  {"salarioeb.tencoronel", 6500},
  {"salarioeb.coronel", 7000},
  

  {"salariopcivil.investigador", 5000},
  {"salariopcivil.perito", 6000},
  {"salariopcivil.escrivao", 7000},
  {"salariopcivil.delegado", 8200},

  {"salarioprf.primeira", 5500},
  {"salarioprf.segunda", 6500},
  {"salarioprf.terceira", 7500},

  {"salariocmd.permissao", 10000}, 
  {"salariosubcmd.permissao", 9000}, 


  {"juiz.permissao", 3000},
  {"advogado.permissao", 2500}, 

  {"salariomecanico.permissao", 2500},
  {"gerentemecanico.permissao", 2750},
  {"lidermecanico.permissao", 3000},
  
  {"estagiario.permissao", 1800},
  {"enfermeiro.permissao", 3000},
  {"paramedicosamu.permissao", 3500},  
  {"clinicogeral.permissao", 4000}, 
  {"vicediretor.permissao", 5800}, 
  {"diretorgeral.permissao", 6000}, 

  {"weazel.permissao", 2000}, 

  {"salarioconce.permissao", 2700}, 
  {"salarioconcedono.permissao", 3700}, 
  
  {"bronze.permissao", 1000},
  {"prata.permissao", 1500},
  {"ouro.permissao", 2000},
  {"platina.permissao", 3000},
  {"diamante.permissao", 5000},
}

RegisterServerEvent('offred:salar')
AddEventHandler('offred:salar', function(salar)
	local user_id = vRP.getUserId(source)
	for i,v in pairs(salarii) do
		permisiune = v[1]
		if vRP.hasPermission(user_id, permisiune)then
			salar = v[2]
			vRP.giveBankMoney(user_id,salar)
      TriggerClientEvent("Notify",source,"importante","Você recebeu seu salário, obrigado pelo seu trabalho!")
      TriggerClientEvent("Notify",source,"financeiro","<b>R$"..salar.."</b> foram depositado em sua conta bancária!")
		end
	end
end)
