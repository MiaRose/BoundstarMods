function init(args)
  entity.setInteractive(false)
  entity.setAnimationState("switchState", "on")
end

function shallowTabelEquals(tbl1,tbl2)
    for k,v in pairs(tbl1) do
        if (tbl2[k] ~= v) then
            return false
        end
    end
    return true
end

function main()
  if world.isVisibleToPlayer(entity.boundBox()) then
    return nil
  end
  local npcSpecies = entity.randomizeParameter("spawner.npcSpeciesOptions")
  local npcType = entity.randomizeParameter("spawner.npcTypeOptions")
  local npcParameter = entity.randomizeParameter("spawner.npcParameterOptions")
  npcParameter.scriptConfig = { spawnedBy = entity.position() }
  world.spawnNpc(entity.toAbsolutePosition({ 0.0, 2.0 }), npcSpecies, npcType, entity.level(), 0, npcParameter);
  entity.smash()
end
