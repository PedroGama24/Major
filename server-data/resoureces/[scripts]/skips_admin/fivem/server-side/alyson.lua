vRP = module("vrp", "lib/Proxy").getInterface("vRP")
vRPclient = module("vrp", "lib/Tunnel").getInterface("vRP")
src = {}
module("vrp", "lib/Tunnel").bindInterface("skips_admin", src)
vTYLER = module("vrp", "lib/Tunnel").getInterface("skips_admin")
vRP._prepare("aurora/admin_log", [[
  CREATE TABLE IF NOT EXISTS au_admin_log(
    id INTEGER AUTO_INCREMENT,
    user_id INTEGER,
    user_name VARCHAR(255),
    action VARCHAR(70),
    hour VARCHAR(255),
    data VARCHAR(255),
    CONSTRAINT pk_banco PRIMARY KEY(id)
  )
]])
async(function()
  vRP.execute("aurora/admin_log")
end)
vRP._prepare("aurora/insert_log", "INSERT INTO au_admin_log(user_id, user_name, action, hour, data) VALUES(@user_id, @user_name, @action, @hour, DATE_FORMAT(CURDATE(), '%d/%m/%Y'))")
vRP._prepare("aurora/rem_log", "DELETE FROM au_admin_log WHERE id = @id")
vRP._prepare("aurora/rem_all_logs", "DELETE FROM au_admin_log")
vRP._prepare("aurora/get_logs", "SELECT * FROM au_admin_log ORDER BY id DESC")
vRP._prepare("aurora/get_user_money", "SELECT * FROM vrp_user_moneys")
vRP._prepare("aurora/get_users", "SELECT * FROM vrp_users")
vRP._prepare("aurora/get_user_identity", "SELECT * FROM vrp_user_identities WHERE user_id = @user_id")
function src.GetUserMoney()
  va = {}
  for fe = 1, #vRP.query("aurora/get_user_money") do
    table.insert(va, {
      u_id = vRP.query("aurora/get_user_money")[fe].user_id,
      wallet = vRP.query("aurora/get_user_money")[fe].wallet,
      bank = vRP.query("aurora/get_user_money")[fe].bank,
      total = vRP.query("aurora/get_user_money")[fe].wallet + vRP.query("aurora/get_user_money")[fe].bank
    })
  end
  return va
end
function src.GetPanelLogs()
  va = {}
  for fe = 1, #vRP.query("aurora/get_logs") do
    table.insert(va, {
      log_id = vRP.query("aurora/get_logs")[fe].id,
      u_id = vRP.query("aurora/get_logs")[fe].user_id,
      u_name = vRP.query("aurora/get_logs")[fe].user_name,
      log = vRP.query("aurora/get_logs")[fe].action,
      data = vRP.query("aurora/get_logs")[fe].data,
      hour = vRP.query("aurora/get_logs")[fe].hour
    })
  end
  return va
end
function src.GetWhitelisted()
  va = {}
  for fe = 1, #vRP.query("aurora/get_users") do
    if vRP.query("aurora/get_users")[fe].whitelisted == true then
      if vRP.query("aurora/get_users")[fe].whitelisted == true then
        vRP.query("aurora/get_users")[fe].whitelisted = "Sim"
      end
      table.insert(va, {
        u_id = vRP.query("aurora/get_users")[fe].id,
        wlstate = vRP.query("aurora/get_users")[fe].whitelisted
      })
    end
  end
  return va
end
function src.GetNonWhitelisted()
  va = {}
  for fe = 1, #vRP.query("aurora/get_users") do
    if vRP.query("aurora/get_users")[fe].whitelisted == false then
      if vRP.query("aurora/get_users")[fe].whitelisted == false then
        vRP.query("aurora/get_users")[fe].whitelisted = "N\195\163o"
      end
      table.insert(va, {
        u_id = vRP.query("aurora/get_users")[fe].id,
        wlstate = vRP.query("aurora/get_users")[fe].whitelisted
      })
    end
  end
  return va
end
function src.GetItemList()
  va = {}
  for fe, fg in pairs(config.itens) do
    table.insert(va, {
      k = fe,
      name = fg.name,
      item_directory = config.ItemDirectory
    })
  end
  return va
end
function src.GetVehiclesList()
  va = {}
  for fg, fh in pairs((vRP.vehicleGlobal())) do
    table.insert(va, {
      k = fg,
      name = fh.name,
      tipo = fh.tipo,
      vehicle_directory = config.VehicleDirectory
    })
  end
  return va
end
function src.getWeapons(a)
  va = {}
  for fh, fj in pairs(config.allowedWeapons) do
    if a == "all" then
      table.insert(va, {
        weapon_id = fj.id,
        weapon_name = fj.index,
        weapon_type = fj.type,
        weapon_directory = config.WeaponDirectory
      })
    elseif a == "melee" then
      if fj.type == "melee" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "handgun" then
      if fj.type == "handgun" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "submachine" then
      if fj.type == "submachine" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "assault" then
      if fj.type == "assault" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "shotgun" then
      if fj.type == "shotgun" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "throwable" then
      if fj.type == "throwable" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "rifle" then
      if fj.type == "rifle" then
        table.insert(va, {
          weapon_id = fj.id,
          weapon_name = fj.index,
          weapon_type = fj.type,
          weapon_directory = config.WeaponDirectory
        })
      end
    elseif a == "special" and fj.type == "special" then
      table.insert(va, {
        weapon_id = fj.id,
        weapon_name = fj.index,
        weapon_type = fj.type,
        weapon_directory = config.WeaponDirectory
      })
    end
  end
  return va
end
function src.GetOnlinePlayers()
  va = {}
  for fe, fg in pairs((vRP.getUsers())) do
    table.insert(va, {
      k = fe,
      uname = vRP.getUserIdentity(fe).name,
      ulname = vRP.getUserIdentity(fe).firstname
    })
  end
  return va
end
function src.EraseLog(a)
  for fg, fh in pairs(config.perm_EditLogs) do
    if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
      vRP.execute("aurora/rem_log", {
        id = tonumber(parseInt(a))
      })
    end
  end
end
function src.WipeLogs()
  for fe, fg in pairs(config.perm_EditLogs) do
    if vRP.hasPermission(vRP.getUserId(source), fg[1]) then
      vRP.execute("aurora/rem_all_logs")
    end
  end
end
function src.addToGarage(a, b)
  for fk, fl in pairs(config.perm_VehicleManagement) do
    if vRP.hasPermission(vRP.getUserId(source), fl[1]) then
      vRP.execute("creative/add_vehicle", {
        user_id = a,
        vehicle = b,
        ipva = parseInt(os.time())
      })
      vRP.execute("aurora/insert_log", {
        user_id = vRP.getUserId(source),
        user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
        action = "Adicionou \195\160 garagem do ID " .. a .. " o ve\195\173culo " .. b,
        hour = os.date("%H:%M:%S")
      })
    end
  end
end
function src.remFromGarage(a, b)
  for fk, fl in pairs(config.perm_VehicleManagement) do
    if vRP.hasPermission(vRP.getUserId(source), fl[1]) then
      vRP.execute("creative/rem_vehicle", {
        user_id = a,
        vehicle = b,
        ipva = parseInt(os.time())
      })
      vRP.execute("aurora/insert_log", {
        user_id = vRP.getUserId(source),
        user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
        action = "Removeu da garagem do ID " .. a .. " o ve\195\173culo " .. b,
        hour = os.date("%H:%M:%S")
      })
    end
  end
end
function src.adminSpawnVeh(a)
  if vRP.getUserId(source) then
    for fk, fl in pairs(config.perm_QuickActions_SpawnVeh) do
      if vRP.hasPermission(vRP.getUserId(source), fl[1]) then
        TriggerClientEvent("spawnarveiculo", source, a)
        TriggerEvent("setPlateEveryone", vRP.getUserIdentity((vRP.getUserId(source))).registration)
        vRP.execute("aurora/insert_log", {
          user_id = vRP.getUserId(source),
          user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
          action = "Criou o ve\195\173culo " .. a,
          hour = os.date("%H:%M:%S")
        })
      end
    end
  end
end
function src.Kill(a)
  for fl, fm in pairs(config.perm_QuickActions_Kill) do
    if vRP.hasPermission(vRP.getUserId(source), fm[1]) then
      if a then
        if vRP.getUserSource(parseInt(a)) then
          vRPclient.setHealth(vRP.getUserSource(parseInt(a)), 0)
          vRP.execute("aurora/insert_log", {
            user_id = vRP.getUserId(source),
            user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
            action = "Matou " .. (vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).firstname) .. " ID - " .. vRP.getUserId((vRP.getUserSource(parseInt(a)))),
            hour = os.date("%H:%M:%S")
          })
        end
      else
        vRP.execute("aurora/insert_log", {
          user_id = vRP.getUserId(source),
          user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
          action = "Matou a si mesmo",
          hour = os.date("%H:%M:%S")
        })
        vRPclient.setHealth(source, 0)
      end
    end
  end
end
function src.Revive(a)
  for fk, fl in pairs(config.perm_QuickActions_Revive) do
    if vRP.hasPermission(vRP.getUserId(source), fl[1]) then
      if a then
        if vRP.getUserSource(parseInt(a)) then
          vRPclient.killGod((vRP.getUserSource(parseInt(a))))
          vRPclient.setHealth(vRP.getUserSource(parseInt(a)), 400)
          TriggerClientEvent("resetBleeding", (vRP.getUserSource(parseInt(a))))
          TriggerClientEvent("resetDiagnostic", (vRP.getUserSource(parseInt(a))))
          vRP.varyThirst(vRP.getUserId((vRP.getUserSource(parseInt(a)))), -15)
          vRP.varyHunger(vRP.getUserId((vRP.getUserSource(parseInt(a)))), -15)
          vRP.execute("aurora/insert_log", {
            user_id = vRP.getUserId(source),
            user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
            action = "Reviveu " .. (vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).firstname) .. " ID - " .. vRP.getUserId((vRP.getUserSource(parseInt(a)))),
            hour = os.date("%H:%M:%S")
          })
        end
      else
        vRPclient.killGod(source)
        vRPclient.setHealth(source, 400)
        TriggerClientEvent("resetBleeding", source)
        TriggerClientEvent("resetDiagnostic", source)
        vRP.varyThirst(vRP.getUserId(source), -100)
        vRP.varyHunger(vRP.getUserId(source), -100)
        vRP.execute("aurora/insert_log", {
          user_id = vRP.getUserId(source),
          user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
          action = "Reviveu a si mesmo",
          hour = os.date("%H:%M:%S")
        })
      end
    end
  end
end
function src.upgradeVeh()
  for fj, fk in pairs(config.perm_QuickActions_UpgradeVeh) do
    if vRP.hasPermission(vRP.getUserId(source), fk[1]) then
      TriggerClientEvent("vehtuning", source)
      vRP.execute("aurora/insert_log", {
        user_id = vRP.getUserId(source),
        user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
        action = "Melhorou o pr\195\179prio ve\195\173culo",
        hour = os.date("%H:%M:%S")
      })
    end
  end
end
function src.addWl(a)
  for fj, fk in pairs(config.perm_QuickActions_WLManage) do
    if vRP.hasPermission(vRP.getUserId(source), fk[1]) then
      vRP.setWhitelisted(parseInt(a), true)
      vRP.execute("aurora/insert_log", {
        user_id = vRP.getUserId(source),
        user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
        action = "Adicionou o ID " .. a .. " a whitelist",
        hour = os.date("%H:%M:%S")
      })
    end
  end
end
function src.removeWl(a)
  for fj, fk in pairs(config.perm_QuickActions_WLManage) do
    if vRP.hasPermission(vRP.getUserId(source), fk[1]) then
      vRP.setWhitelisted(parseInt(a), false)
      vRP.execute("aurora/insert_log", {
        user_id = vRP.getUserId(source),
        user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
        action = "Removeu o ID " .. a .. " da whitelist",
        hour = os.date("%H:%M:%S")
      })
    end
  end
end
function src.kickSpecified(a)
  for fj, fk in pairs(config.perm_QuickActions_KickID) do
    if vRP.hasPermission(vRP.getUserId(source), fk[1]) and vRP.getUserSource(parseInt(a)) then
      vRP.kick(vRP.getUserSource(parseInt(a)), "Voc\195\170 foi expulso da cidade.")
      vRP.execute("aurora/insert_log", {
        user_id = vRP.getUserId(source),
        user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
        action = "Expulsou  " .. (vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).firstname) .. " ID - " .. a .. " da cidade",
        hour = os.date("%H:%M:%S")
      })
    end
  end
end
function src.banSpecified(a)
  for fk, fl in pairs(config.perm_QuickActions_BanManage) do
    if vRP.hasPermission(vRP.getUserId(source), fl[1]) then
      if vRP.getUserSource(parseInt(a)) then
        vRP.setBanned(vRP.getUserId((vRP.getUserSource(parseInt(a)))), true)
        vRP.kick(vRP.getUserSource(parseInt(a)), "Voc\195\170 foi expulso da cidade.")
        vRP.execute("aurora/insert_log", {
          user_id = vRP.getUserId(source),
          user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
          action = "Baniu " .. (vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).firstname) .. " ID - " .. vRP.getUserId((vRP.getUserSource(parseInt(a)))),
          hour = os.date("%H:%M:%S")
        })
      else
        vRP.setBanned(a, true)
        vRP.execute("aurora/insert_log", {
          user_id = vRP.getUserId(source),
          user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
          action = "Baniu o ID " .. a,
          hour = os.date("%H:%M:%S")
        })
      end
    end
  end
end
function src.unbanSpecified(a)
  for fk, fl in pairs(config.perm_QuickActions_BanManage) do
    if vRP.hasPermission(vRP.getUserId(source), fl[1]) then
      vRP.setBanned(a, false)
      vRP.execute("aurora/insert_log", {
        user_id = vRP.getUserId(source),
        user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
        action = "Desbaniu o ID - " .. a,
        hour = os.date("%H:%M:%S")
      })
    end
  end
end
function src.setUserGroup(a, b)
  for fl, fm in pairs(config.perm_GroupManagement) do
    if vRP.hasPermission(vRP.getUserId(source), fm[1]) and vRP.getUserSource(tonumber(b)) then
      vRP.addUserGroup(vRP.getUserId((vRP.getUserSource(tonumber(b)))), tostring(a))
      vRP.execute("aurora/insert_log", {
        user_id = vRP.getUserId(source),
        user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
        action = "Adicionou o grupo " .. a .. " em " .. (vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(tonumber(b)))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(tonumber(b)))))).firstname) .. " ID - " .. vRP.getUserId((vRP.getUserSource(tonumber(b)))),
        hour = os.date("%H:%M:%S")
      })
    end
  end
end
function src.removeUserGroup(a, b)
  for fl, fm in pairs(config.perm_GroupManagement) do
    if vRP.hasPermission(vRP.getUserId(source), fm[1]) and vRP.getUserSource(tonumber(parseInt(b))) then
      vRP.removeUserGroup(vRP.getUserId((vRP.getUserSource(tonumber(parseInt(b))))), tostring(a))
      vRP.execute("aurora/insert_log", {
        user_id = vRP.getUserId(source),
        user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
        action = "Removeu o grupo " .. a .. " de " .. (vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(tonumber(parseInt(b))))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(tonumber(parseInt(b))))))).firstname) .. " ID - " .. vRP.getUserId((vRP.getUserSource(tonumber(parseInt(b))))),
        hour = os.date("%H:%M:%S")
      })
    end
  end
end
function src.takeItem(a, b)
  for fl, fm in pairs(config.perm_ItemManagement) do
    if vRP.hasPermission(vRP.getUserId(source), fm[1]) then
      vRP.giveInventoryItem(vRP.getUserId(source), tostring(a), b)
      vRP.execute("aurora/insert_log", {
        user_id = vRP.getUserId(source),
        user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
        action = "Pegou o item " .. a .. " - x" .. b,
        hour = os.date("%H:%M:%S")
      })
    end
  end
end
function src.giveItem(a, b, c)
  for fm, fo in pairs(config.perm_ItemManagement) do
    if vRP.hasPermission(vRP.getUserId(source), fo[1]) and vRP.getUserSource(parseInt(a)) then
      vRP.giveInventoryItem(tonumber((vRP.getUserId((vRP.getUserSource(parseInt(a)))))), tostring(c), tonumber(parseInt(b)))
      vRP.execute("aurora/insert_log", {
        user_id = vRP.getUserId(source),
        user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
        action = "Deu o item " .. c .. " - x" .. b .. " para " .. (vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).firstname) .. " ID - " .. vRP.getUserId((vRP.getUserSource(parseInt(a)))),
        hour = os.date("%H:%M:%S")
      })
    end
  end
end
function src.clearUserInv(a)
  for fo, fp in pairs(config.perm_ItemManagement) do
    if vRP.hasPermission(vRP.getUserId(source), fp[1]) then
      if vRP.getUserId(tonumber((vRP.getUserSource(tonumber((tonumber(a))))))) ~= nil then
        if vRP.getUserDataTable((vRP.getUserId(tonumber((vRP.getUserSource(tonumber((tonumber(a))))))))) ~= nil and vRP.getUserDataTable((vRP.getUserId(tonumber((vRP.getUserSource(tonumber((tonumber(a))))))))).inventory ~= nil then
          for fz, fq in pairs(vRP.getUserDataTable((vRP.getUserId(tonumber((vRP.getUserSource(tonumber((tonumber(a))))))))).inventory) do
            vRP.tryGetInventoryItem(vRP.getUserId(tonumber((vRP.getUserSource(tonumber((tonumber(a))))))), fz, fq.amount)
          end
        end
        vRP.execute("aurora/insert_log", {
          user_id = vRP.getUserId(source),
          user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
          action = "Limpou o invent\195\161rio de " .. (vRP.getUserIdentity((vRP.getUserId(tonumber((vRP.getUserSource(tonumber((tonumber(a))))))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(tonumber((vRP.getUserSource(tonumber((tonumber(a))))))))).firstname) .. " ID - " .. vRP.getUserId(tonumber((vRP.getUserSource(tonumber((tonumber(a))))))),
          hour = os.date("%H:%M:%S")
        })
        TriggerClientEvent("Notify", source, "sucesso", "Limpou inventario do <b>" .. vRP.getUserIdentity((vRP.getUserId(tonumber((vRP.getUserSource(tonumber((tonumber(a))))))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(tonumber((vRP.getUserSource(tonumber((tonumber(a))))))))).firstname .. "</b>.")
      else
        TriggerClientEvent("Notify", source, "negado", "O usu\195\161rio n\195\163o foi encontrado ou est\195\161 offline.")
      end
    end
  end
end
function src.teleportToMe(a)
  for fk, fl in pairs(config.perm_TeleportPlayer) do
    if vRP.hasPermission(vRP.getUserId(source), fl[1]) and a then
      if vRP.getUserSource(parseInt(a)) then
        vRPclient.teleport(vRP.getUserSource(parseInt(a)), vRPclient.getPosition(source))
        TriggerClientEvent("Notify", source, "sucesso", "Teleportado.")
        vRP.execute("aurora/insert_log", {
          user_id = vRP.getUserId(source),
          user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
          action = "Puxou " .. (vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).firstname) .. " ID - " .. vRP.getUserId((vRP.getUserSource(parseInt(a)))),
          hour = os.date("%H:%M:%S")
        })
      else
        TriggerClientEvent("Notify", source, "negado", "ID indispon\195\173vel.", 6000)
      end
    end
  end
end
function src.TeleportToPlayer(a)
  for fk, fl in pairs(config.perm_TeleportPlayer) do
    if vRP.hasPermission(vRP.getUserId(source), fl[1]) then
      if vRP.getUserSource(parseInt(a)) then
        vRPclient.teleport(source, vRPclient.getPosition((vRP.getUserSource(parseInt(a)))))
        TriggerClientEvent("Notify", source, "sucesso", "Teleportado.")
        vRP.execute("aurora/insert_log", {
          user_id = vRP.getUserId(source),
          user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
          action = "Teletransportou-se para " .. (vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).firstname) .. " ID - " .. vRP.getUserId((vRP.getUserSource(parseInt(a)))),
          hour = os.date("%H:%M:%S")
        })
      else
        TriggerClientEvent("Notify", source, "negado", "ID indispon\195\173vel.", 6000)
      end
    end
  end
end
function src.TeleportWaypoint()
  for fj, fk in pairs(config.perm_TeleportPlayer) do
    if vRP.hasPermission(vRP.getUserId(source), fk[1]) then
      TriggerClientEvent("tptoway", source)
      TriggerClientEvent("Notify", source, "sucesso", "Teleportado.")
      vRP.execute("aurora/insert_log", {
        user_id = vRP.getUserId(source),
        user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
        action = "Teletransportou-se para waypoint",
        hour = os.date("%H:%M:%S")
      })
    end
  end
end
function src.giveWeapon(a, b, c)
  for fm, fo in pairs(config.perm_WeaponManagement) do
    if vRP.hasPermission(vRP.getUserId(source), fo[1]) then
      if b then
        vRPclient.giveWeapons(vRP.getUserSource(parseInt(b)), {
          [a] = {
            ammo = tonumber(c)
          }
        })
        vRP.execute("aurora/insert_log", {
          user_id = vRP.getUserId(source),
          user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
          action = "Deu um(a) " .. a .. " x" .. c .. " para " .. (vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(b)))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(b)))))).firstname) .. " ID - " .. vRP.getUserId((vRP.getUserSource(parseInt(b)))),
          hour = os.date("%H:%M:%S")
        })
      else
        vRPclient.giveWeapons(source, {
          [a] = {
            ammo = tonumber(c)
          }
        })
        vRP.execute("aurora/insert_log", {
          user_id = vRP.getUserId(source),
          user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
          action = "Deu um(a) " .. a .. " x" .. c .. " para si mesmo",
          hour = os.date("%H:%M:%S")
        })
      end
    end
  end
end
function src.clearWeapons(a)
  for fk, fl in pairs(config.perm_WeaponManagement) do
    if vRP.hasPermission(vRP.getUserId(source), fl[1]) then
      if a then
        vRPclient.replaceWeapons(vRP.getUserSource(parseInt(a)), {})
        vRP.execute("aurora/insert_log", {
          user_id = vRP.getUserId(source),
          user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
          action = "Limpou as armas de " .. (vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(a)))))).firstname) .. " ID - " .. vRP.getUserId((vRP.getUserSource(parseInt(a)))),
          hour = os.date("%H:%M:%S")
        })
      else
        vRPclient.replaceWeapons(source, {})
        vRP.execute("aurora/insert_log", {
          user_id = vRP.getUserId(source),
          user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
          action = "Limpou as pr\195\179prias armas",
          hour = os.date("%H:%M:%S")
        })
      end
    end
  end
end
function src.checkGlobalPermission()
  if vRP.hasPermission(vRP.getUserId(source), config.globalPerm) then
    return true
  end
end
function src.getSpecifiedPlayer(a)
  if vRP.getUserId(a) then
    return vRP.getUserIdentity(parseInt((vRP.getUserId(a)))).name
  else
  end
end
function src.AdminNotify(a, b, c, d)
  if vRP.getUserId(source) then
    for fm, fo in pairs(config.perm_NotifyPlayers) do
      if vRP.hasPermission(vRP.getUserId(source), fo[1]) then
        if c ~= "" and d ~= "" and c ~= nil then
        end
        if d == nil then
          return
        end
        if not a then
          TriggerClientEvent("Notify", -1, "aviso", c .. "<br> <b>- " .. d .. "</b>", 60000)
          vRP.execute("aurora/insert_log", {
            user_id = vRP.getUserId(source),
            user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
            action = "Notificou todos os jogadores",
            hour = os.date("%H:%M:%S")
          })
        elseif vRP.getUserId((vRP.getUserSource(parseInt(tonumber(b))))) then
          TriggerClientEvent("Notify", vRP.getUserSource(parseInt(tonumber(b))), "aviso", c .. "<br> <b>- " .. d .. "</b>", 60000)
          vRP.execute("aurora/insert_log", {
            user_id = vRP.getUserId(source),
            user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
            action = "Notificou " .. (vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(tonumber(b))))))).name .. " " .. vRP.getUserIdentity((vRP.getUserId((vRP.getUserSource(parseInt(tonumber(b))))))).firstname) .. " ID - " .. vRP.getUserId((vRP.getUserSource(parseInt(tonumber(b))))),
            hour = os.date("%H:%M:%S")
          })
        end
      end
    end
  end
end
function src.VerifyPerm(a)
  if a == "spawn_veh" then
    for fg, fh in pairs(config.perm_QuickActions_SpawnVeh) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "kill" then
    for fg, fh in pairs(config.perm_QuickActions_Kill) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "kill_all" then
    for fg, fh in pairs(config.perm_QuickActions_KillAll) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "revive" then
    for fg, fh in pairs(config.perm_QuickActions_Revive) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "revive_all" then
    for fg, fh in pairs(config.perm_QuickActions_ReviveAll) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "upgrade_veh" then
    for fg, fh in pairs(config.perm_QuickActions_UpgradeVeh) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "wl_manage" then
    for fg, fh in pairs(config.perm_QuickActions_WLManage) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "ban_manage" then
    for fg, fh in pairs(config.perm_QuickActions_BanManage) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "kick_id" then
    for fg, fh in pairs(config.perm_QuickActions_KickID) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "kick_all" then
    for fg, fh in pairs(config.perm_QuickActions_KickAll) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "manage_groups" then
    for fg, fh in pairs(config.perm_GroupManagement) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "manage_items" then
    for fg, fh in pairs(config.perm_ItemManagement) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "manage_vehicles" then
    for fg, fh in pairs(config.perm_VehicleManagement) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "manage_players" then
    for fg, fh in pairs(config.perm_PlayerManagement) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "manage_notify" then
    for fg, fh in pairs(config.perm_NotifyPlayers) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "get_coordinates" then
    for fg, fh in pairs(config.perm_GetCoordinates) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "teleport" then
    for fg, fh in pairs(config.perm_TeleportPlayer) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "weapons" then
    for fg, fh in pairs(config.perm_WeaponManagement) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "money" then
    for fg, fh in pairs(config.perm_MoneyManagement) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "see_logs" then
    for fg, fh in pairs(config.perm_SeeLogs) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  elseif a == "edit_logs" then
    for fg, fh in pairs(config.perm_EditLogs) do
      if vRP.hasPermission(vRP.getUserId(source), fh[1]) then
        return true
      end
    end
  end
end
function tD(a)
  a = math.ceil(a * 100) / 100
  return a
end
function src.GetEntityCoords()
  return "['x'] = " .. tD(vRPclient.getPosition(source)) .. ", ['y'] = " .. tD(vRPclient.getPosition(source)) .. ", ['z'] = " .. tD(vRPclient.getPosition(source))
end
function src.GiveMoney(a, b, c)
  for fo, fp in pairs(config.perm_MoneyManagement) do
    if vRP.hasPermission(vRP.getUserId(source), fp[1]) then
      if vRP.getUserId(source) then
        if a == "bank" then
          vRP.giveBankMoney(vRP.getUserId(source), parseInt(c))
          vRP.execute("aurora/insert_log", {
            user_id = vRP.getUserId(source),
            user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
            action = "Deu $" .. c .. " para " .. (vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname) .. " ID - " .. vRP.getUserId(source) .. " - Banco",
            hour = os.date("%H:%M:%S")
          })
        else
          vRP.giveMoney(vRP.getUserId(source), parseInt(c))
          vRP.execute("aurora/insert_log", {
            user_id = vRP.getUserId(source),
            user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
            action = "Deu $" .. c .. " para " .. (vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname) .. " ID - " .. vRP.getUserId(source) .. " - Carteira",
            hour = os.date("%H:%M:%S")
          })
        end
      end
    end
  end
end
function src.SetMoney(a, b, c)
  for fo, fp in pairs(config.perm_MoneyManagement) do
    if vRP.hasPermission(vRP.getUserId(source), fp[1]) then
      if vRP.getUserId(source) then
        if a == "bank" then
          vRP.setBankMoney(vRP.getUserId(source), parseInt(c))
          vRP.execute("aurora/insert_log", {
            user_id = vRP.getUserId(source),
            user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
            action = "Definiu $" .. c .. " para " .. (vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname) .. " ID - " .. vRP.getUserId(source) .. " - Banco",
            hour = os.date("%H:%M:%S")
          })
        else
          vRP.setMoney(vRP.getUserId(source), parseInt(c))
          vRP.execute("aurora/insert_log", {
            user_id = vRP.getUserId(source),
            user_name = vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname,
            action = "Definiu $" .. c .. " para " .. (vRP.getUserIdentity((vRP.getUserId(source))).name .. " " .. vRP.getUserIdentity((vRP.getUserId(source))).firstname) .. " ID - " .. vRP.getUserId(source) .. " - Carteira",
            hour = os.date("%H:%M:%S")
          })
        end
      end
    end
  end
end
function src.CheckPlayer(a)
  if vRP.getUserId((vRP.getUserSource(parseInt(a)))) then
    return true
  end
end
function src.GetPlayerInfos(a)
  for fg = 1, #vRP.query("aurora/get_user_identity", {user_id = a}) do
    return vRP.query("aurora/get_user_identity", {user_id = a})[fg].name, vRP.query("aurora/get_user_identity", {user_id = a})[fg].firstname
  end
end
AddEventHandler("onResourceStart", function(a)
  if GetCurrentResourceName() == a then
  end
end)
function src.checkAuth()
  return auth
end
