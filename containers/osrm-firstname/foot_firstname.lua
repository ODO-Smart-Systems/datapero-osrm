-- Foot profile

api_version = 2

Set = require('lib/set')
Sequence = require('lib/sequence')
Handlers = require("lib/way_handlers")
find_access_tag = require("lib/access").find_access_tag

function setup()
  local walking_speed = 5
  return {
    properties = {
      weight_name                   = 'routability',
      max_speed_for_map_matching    = 40/3.6, -- kmph -> m/s
      call_tagless_node_function    = false,
      traffic_light_penalty         = 2,
      u_turn_penalty                = 2,
      continue_straight_at_waypoint = false,
      use_turn_restrictions         = false,
    },

    default_mode            = mode.walking,
    default_speed           = walking_speed,
    oneway_handling         = 'specific',     -- respect 'oneway:foot' but not 'oneway'

    barrier_blacklist = Set {
      'yes',
      'wall',
      'fence'
    },

    access_tag_whitelist = Set {
      'yes',
      'foot',
      'permissive',
      'designated'
    },

    access_tag_blacklist = Set {
      'no',
      'agricultural',
      'forestry',
      'private',
      'delivery',
    },

    restricted_access_tag_list = Set { },

    restricted_highway_whitelist = Set { },

    construction_whitelist = Set {},

    access_tags_hierarchy = Sequence {
      'foot',
      'access'
    },

    -- tags disallow access to in combination with highway=service
    service_access_tag_blacklist = Set { },

    restrictions = Sequence {
      'foot'
    },

    -- list of suffixes to suppress in name change instructions
    suffix_list = Set {
      'N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW', 'North', 'South', 'West', 'East'
    },

    avoid = Set {
      'impassable'
    },

    speeds = Sequence {
      highway = {
        primary         = walking_speed,
        primary_link    = walking_speed,
        secondary       = walking_speed,
        secondary_link  = walking_speed,
        tertiary        = walking_speed,
        tertiary_link   = walking_speed,
        unclassified    = walking_speed,
        residential     = walking_speed,
        road            = walking_speed,
        living_street   = walking_speed,
        service         = walking_speed,
        track           = walking_speed,
        path            = walking_speed,
        steps           = walking_speed,
        pedestrian      = walking_speed,
        footway         = walking_speed,
        pier            = walking_speed,
      },

      railway = {
        platform        = walking_speed
      },

      amenity = {
        parking         = walking_speed,
        parking_entrance= walking_speed
      },

      man_made = {
        pier            = walking_speed
      },

      leisure = {
        track           = walking_speed
      }
    },

    route_speeds = {
      ferry = 5
    },

    bridge_speeds = {
    },

    surface_speeds = {
      fine_gravel =   walking_speed*0.75,
      gravel =        walking_speed*0.75,
      pebblestone =   walking_speed*0.75,
      mud =           walking_speed*0.5,
      sand =          walking_speed*0.5
    },

    tracktype_speeds = {
    },

    smoothness_speeds = {
    },

    angers_name_occurences = {
      ['Adèle'] = 38,
      ['Juliette'] = 36,
      ['Charlotte'] = 20,
      ['Zoé'] = 20,
      ['Clémence'] = 19,
      ['Eva'] = 18,
      ['Manon'] = 17,
      ['Mia'] = 14,
      ['Olivia'] = 14,
      ['Gabrielle'] = 13,
      ['Iris'] = 13,
      ['Faustine'] = 11,
      ['Eléna'] = 10,
      ['Léana'] = 10,
      ['Sofia'] = 9,
      ['Anouk'] = 8,
      ['Apolline'] = 8,
      ['Lisa'] = 8,
      ['Roxane'] = 8,
      ['Sarah'] = 8,
      ['Victoire'] = 8,
      ['Alix'] = 7,
      ['Clémentine'] = 7,
      ['Emmy'] = 7,
      ['Justine'] = 7,
      ['Anaé'] = 6,
      ['Coline'] = 6,
      ['Méline'] = 6,
      ['Anaëlle'] = 5,
      ['Asma'] = 5,
      ['Célia'] = 5,
      ['Emilie'] = 5,
      ['Hortense'] = 5,
      ['Maëlys'] = 5,
      ['Aminata'] = 4,
      ['Aya'] = 4,
      ['Ayana'] = 4,
      ['Daphné'] = 4,
      ['Elyna'] = 4,
      ['Léonore'] = 4,
      ['Lucile'] = 4,
      ['Sara'] = 4,
      ['Emma'] = 38,
      ['Jeanne'] = 34,
      ['Margaux'] = 21,
      ['Lina'] = 18,
      ['Lou'] = 18,
      ['Albane'] = 13,
      ['Mya'] = 11,
      ['Constance'] = 10,
      ['Charlie'] = 9,
      ['Garance'] = 9,
      ['Héloïse'] = 7,
      ['Thaïs'] = 7,
      ['Maria'] = 6,
      ['Maya'] = 6,
      ['Cléo'] = 4,
      ['Elyana'] = 4,
      ['Evie'] = 4,
      ['Giulia'] = 4,
      ['Izia'] = 4,
      ['Lilia'] = 4,
      ['Lily'] = 4,
      ['Maddy'] = 4,
      ['Safiya'] = 4,
      ['Yuna'] = 4,
      ['Gabriel'] = 41,
      ['Raphaël'] = 37,
      ['Léo'] = 36,
      ['Lucas'] = 23,
      ['Marius'] = 22,
      ['Timéo'] = 19,
      ['Aaron'] = 17,
      ['Baptiste'] = 14,
      ['Malone'] = 13,
      ['Maxence'] = 12,
      ['Nathan'] = 12,
      ['Alexandre'] = 11,
      ['Antonin'] = 11,
      ['Soan'] = 10,
      ['Eden'] = 9,
      ['Yanis'] = 9,
      ['Bastien'] = 8,
      ['Charles'] = 7,
      ['Côme'] = 7,
      ['Arsène'] = 6,
      ['Eloi'] = 6,
      ['Erwan'] = 6,
      ['Gaston'] = 6,
      ['Mahé'] = 6,
      ['Mathys'] = 6,
      ['Noa'] = 6,
      ['Rayan'] = 6,
      ['Alix'] = 5,
      ['Camille'] = 5,
      ['Naël'] = 5,
      ['Quentin'] = 5,
      ['Alan'] = 4,
      ['Ayoub'] = 4,
      ['Dorian'] = 4,
      ['Gauthier'] = 4,
      ['Yassine'] = 4,
      ['Youssef'] = 4,
      ['Zack'] = 4,
      ['Louis'] = 31,
      ['Jules'] = 30,
      ['Sacha'] = 30,
      ['Malo'] = 27,
      ['Oscar'] = 15,
      ['Marin'] = 13,
      ['Léon'] = 12,
      ['Tiago'] = 12,
      ['Antoine'] = 11,
      ['Valentin'] = 11,
      ['Amir'] = 9,
      ['Lucien'] = 9,
      ['Lyam'] = 9,
      ['Alexis'] = 8,
      ['Ewen'] = 8,
      ['Lino'] = 8,
      ['Kaïs'] = 7,
      ['Louison'] = 7,
      ['Emilien'] = 6,
      ['Jean'] = 6,
      ['Marcus'] = 6,
      ['Mathias'] = 6,
      ['Naïm'] = 6,
      ['Ruben'] = 6,
      ['Swann'] = 6,
      ['Timothé'] = 6,
      ['Gustave'] = 5,
      ['Ilyes'] = 5,
      ['Lenny'] = 5,
      ['Lubin'] = 5,
      ['Marwan'] = 5,
      ['Alex'] = 4,
      ['Diego'] = 4,
      ['Max'] = 4,
      ['Paulin'] = 4,
      ['Jade'] = 42,
      ['Alice'] = 26,
      ['Camille'] = 26,
      ['Rose'] = 23,
      ['Ambre'] = 22,
      ['Mila'] = 19,
      ['Romy'] = 19,
      ['Romane'] = 17,
      ['Capucine'] = 14,
      ['Candice'] = 12,
      ['Clara'] = 10,
      ['Luna'] = 10,
      ['Eloïse'] = 9,
      ['Nina'] = 9,
      ['Augustine'] = 8,
      ['Eléonore'] = 8,
      ['Lyna'] = 8,
      ['Suzanne'] = 8,
      ['Elena'] = 7,
      ['Elsa'] = 6,
      ['Lise'] = 6,
      ['Norah'] = 6,
      ['Anaïs'] = 5,
      ['Manel'] = 5,
      ['Ninon'] = 5,
      ['Syana'] = 5,
      ['Céleste'] = 4,
      ['Eline'] = 4,
      ['Elyne'] = 4,
      ['Nora'] = 4,
      ['Tina'] = 4,
      ['Yassin'] = 4,
      ['Paul'] = 42,
      ['Maël'] = 27,
      ['Axel'] = 20,
      ['Eliott'] = 20,
      ['Marceau'] = 20,
      ['Victor'] = 17,
      ['Maxime'] = 12,
      ['Nino'] = 12,
      ['Basile'] = 10,
      ['Noam'] = 10,
      ['Ayden'] = 9,
      ['Thomas'] = 9,
      ['Elio'] = 8,
      ['Aubin'] = 7,
      ['Eliot'] = 7,
      ['Léonard'] = 7,
      ['Kylian'] = 6,
      ['Milan'] = 6,
      ['Achille'] = 5,
      ['Wassim'] = 5,
      ['William'] = 5,
      ['Armand'] = 4,
      ['Ayman'] = 4,
      ['Célian'] = 4,
      ['Karl'] = 4,
      ['Matéo'] = 4,
      ['Timothée'] = 4,
      ['Martin'] = 29,
      ['Ethan'] = 21,
      ['Mathis'] = 20,
      ['Théo'] = 20,
      ['Noé'] = 18,
      ['Simon'] = 17,
      ['Liam'] = 16,
      ['Léandre'] = 13,
      ['Mathéo'] = 11,
      ['Milo'] = 10,
      ['Isaac'] = 9,
      ['Kenzo'] = 9,
      ['Marcel'] = 9,
      ['Tylio'] = 8,
      ['Charlie'] = 7,
      ['Mohamed'] = 7,
      ['Abel'] = 6,
      ['Idriss'] = 6,
      ['Mayron'] = 6,
      ['Swan'] = 6,
      ['Andrea'] = 5,
      ['Charly'] = 5,
      ['Elie'] = 5,
      ['Lenzo'] = 5,
      ['Corentin'] = 4,
      ['Elyo'] = 4,
      ['Ezio'] = 4,
      ['Louise'] = 38,
      ['Agathe'] = 34,
      ['Anna'] = 24,
      ['Margot'] = 23,
      ['Julia'] = 22,
      ['Inès'] = 17,
      ['Léa'] = 17,
      ['Inaya'] = 14,
      ['Louna'] = 14,
      ['Soline'] = 14,
      ['Théa'] = 13,
      ['Noémie'] = 12,
      ['Lana'] = 10,
      ['Salomé'] = 9,
      ['Lya'] = 8,
      ['Valentine'] = 8,
      ['Calie'] = 7,
      ['Assia'] = 6,
      ['Alicia'] = 5,
      ['Bertille'] = 5,
      ['Elina'] = 5,
      ['Miya'] = 5,
      ['Nour'] = 5,
      ['Aliénor'] = 4,
      ['Cassandre'] = 4,
      ['Célestine'] = 4,
      ['Mathilde'] = 4,
      ['Victoria'] = 4,
      ['Chloé'] = 26,
      ['Lola'] = 26,
      ['Léna'] = 23,
      ['Léonie'] = 16,
      ['Zélie'] = 13,
      ['Lilou'] = 11,
      ['Lucie'] = 10,
      ['Lison'] = 9,
      ['Aria'] = 8,
      ['Elise'] = 8,
      ['Madeleine'] = 8,
      ['Maëlle'] = 7,
      ['Joséphine'] = 6,
      ['Kenza'] = 6,
      ['Alya'] = 5,
      ['Marion'] = 5,
      ['Mélina'] = 5,
      ['Aliyah'] = 4,
      ['Alma'] = 4,
      ['Bérénice'] = 4,
      ['Elisa'] = 4,
      ['Emy'] = 4,
      ['Joyce'] = 4,
      ['Rosalie'] = 4,
      ['Arthur'] = 41,
      ['Hugo'] = 32,
      ['Augustin'] = 25,
      ['Gabin'] = 25,
      ['Gaspard'] = 23,
      ['Clément'] = 21,
      ['Adam'] = 20,
      ['Noah'] = 20,
      ['Tom'] = 19,
      ['Robin'] = 17,
      ['Evan'] = 12,
      ['Nolan'] = 12,
      ['Joseph'] = 11,
      ['Samuel'] = 11,
      ['Ulysse'] = 11,
      ['Esteban'] = 10,
      ['Enzo'] = 9,
      ['Adem'] = 8,
      ['Owen'] = 8,
      ['Elias'] = 7,
      ['Elliot'] = 7,
      ['Issa'] = 7,
      ['Louka'] = 7,
      ['Ali'] = 6,
      ['Khalil'] = 6,
      ['Edouard'] = 5,
      ['Lorenzo'] = 5,
      ['Luka'] = 5,
      ['Mattéo'] = 5,
      ['Nathanaël'] = 5,
      ['Amaury'] = 4,
      ['Aurèle'] = 4,
      ['Bilal'] = 4,
      ['David'] = 4,
      ['Félix'] = 4,
      ['Ismaël'] = 4,
      ['Joshua'] = 4,
      ['Léopold'] = 4,
      ['Nils'] = 4,
      ['Ryan'] = 4,
      ['Tyméo'] = 4
    },

  }
end

function process_node(profile, node, result)
  -- parse access and barrier tags
  local access = find_access_tag(node, profile.access_tags_hierarchy)
  if access then
    if profile.access_tag_blacklist[access] then
      result.barrier = true
    end
  else
    local barrier = node:get_value_by_key("barrier")
    if barrier then
      --  make an exception for rising bollard barriers
      local bollard = node:get_value_by_key("bollard")
      local rising_bollard = bollard and "rising" == bollard

      if profile.barrier_blacklist[barrier] and not rising_bollard then
        result.barrier = true
      end
    end
  end

  -- check if node is a traffic light
  local tag = node:get_value_by_key("highway")
  if "traffic_signals" == tag then
    result.traffic_lights = true
  end
end

-- main entry point for processsing a way
function process_way(profile, way, result)
  -- the intial filtering of ways based on presence of tags
  -- affects processing times significantly, because all ways
  -- have to be checked.
  -- to increase performance, prefetching and intial tag check
  -- is done in directly instead of via a handler.

  -- in general we should  try to abort as soon as
  -- possible if the way is not routable, to avoid doing
  -- unnecessary work. this implies we should check things that
  -- commonly forbids access early, and handle edge cases later.

  -- data table for storing intermediate values during processing
  local data = {
    -- prefetch tags
    highway = way:get_value_by_key('highway'),
    bridge = way:get_value_by_key('bridge'),
    route = way:get_value_by_key('route'),
    leisure = way:get_value_by_key('leisure'),
    man_made = way:get_value_by_key('man_made'),
    railway = way:get_value_by_key('railway'),
    platform = way:get_value_by_key('platform'),
    amenity = way:get_value_by_key('amenity'),
    public_transport = way:get_value_by_key('public_transport')
  }

  -- perform an quick initial check and abort if the way is
  -- obviously not routable. here we require at least one
  -- of the prefetched tags to be present, ie. the data table
  -- cannot be empty
  if next(data) == nil then     -- is the data table empty?
    return
  end

  local handlers = Sequence {
    -- set the default mode for this profile. if can be changed later
    -- in case it turns we're e.g. on a ferry
    WayHandlers.default_mode,

    -- check various tags that could indicate that the way is not
    -- routable. this includes things like status=impassable,
    -- toll=yes and oneway=reversible
    WayHandlers.blocked_ways,

    -- determine access status by checking our hierarchy of
    -- access tags, e.g: motorcar, motor_vehicle, vehicle
    WayHandlers.access,

    -- check whether forward/backward directons are routable
    WayHandlers.oneway,

    -- check whether forward/backward directons are routable
    WayHandlers.destinations,

    -- check whether we're using a special transport mode
    WayHandlers.ferries,
    WayHandlers.movables,

    -- compute speed taking into account way type, maxspeed tags, etc.
    WayHandlers.speed,
    WayHandlers.surface,

    -- handle turn lanes and road classification, used for guidance
    WayHandlers.classification,

    -- handle various other flags
    WayHandlers.roundabouts,
    WayHandlers.startpoint,

    -- set name, ref and pronunciation
    WayHandlers.names,

    -- set weight properties of the way
    WayHandlers.weights,

    -- set weight based of bars occurence along the way
    WayHandlers.weighted_name
  }

  WayHandlers.run(profile, way, result, data, handlers)
end

function WayHandlers.weighted_name(profile,way,result,data)
  -- parse the remaining tags
  local name = way:get_value_by_key("name")

  local newRate = 1

  -- Set the name that will be used for instructions
  if name then    
    for firstname,occurence in pairs(profile.angers_name_occurences) do
      if string.find(name, firstname) then
        -- more occurence is high, greater the speed is
        newRate = occurence
        break
      end
    end

    if newRate>1 then 
      print(name .. " => " .. newRate)
      -- Update name to show firstname occurence next to route name
      result.name = name .. " [" .. newRate .. "]"
    end

  end

  result.forward_rate = newRate
  result.backward_rate = newRate

end

function process_turn (profile, turn)
  turn.duration = 0.

  if turn.direction_modifier == direction_modifier.u_turn then
     turn.duration = turn.duration + profile.properties.u_turn_penalty
  end

  if turn.has_traffic_light then
     turn.duration = profile.properties.traffic_light_penalty
  end
  if profile.properties.weight_name == 'routability' then
      -- penalize turns from non-local access only segments onto local access only tags
      if not turn.source_restricted and turn.target_restricted then
          turn.weight = turn.weight + 3000
      end
  end
end

return {
  setup = setup,
  process_way =  process_way,
  process_node = process_node,
  process_turn = process_turn
}