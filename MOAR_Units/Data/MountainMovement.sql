--========================================================================================================================================
--========================================================================================================================================
-- IF YOU WANT TO USE THIS
-- =======================
-- Simply include this file and add it to the database.
-- Then if you want to make a unit walk on mountains, give them ABILITY_MOUNTAIN_MOVE_ALLOWED
-- And... that's it :D
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
--========================================================================================================================================
INSERT OR REPLACE INTO Types
		(Type,												Kind)
VALUES	('MODIFIER_ALL_UNITS_NO_MOVE_TERRAIN',			'KIND_MODIFIER'),
		('ABILITY_MOUNTAIN_MOVE_ALLOWED',							'KIND_ABILITY');

UPDATE Terrains
SET Impassable = 0
WHERE TerrainType = 'TERRAIN_GRASS_MOUNTAIN';
UPDATE Terrains
SET Impassable = 0
WHERE TerrainType = 'TERRAIN_PLAINS_MOUNTAIN';
UPDATE Terrains
SET Impassable = 0
WHERE TerrainType = 'TERRAIN_DESERT_MOUNTAIN';
UPDATE Terrains
SET Impassable = 0
WHERE TerrainType = 'TERRAIN_TUNDRA_MOUNTAIN';
UPDATE Terrains
SET Impassable = 0
WHERE TerrainType = 'TERRAIN_SNOW_MOUNTAIN';

INSERT OR REPLACE INTO RequirementSets
		(RequirementSetId,				RequirementSetType)
VALUES	('LEU_NO_MOUNTAIN_MOVE_REQUIREMENT',		'REQUIREMENTSET_TEST_ALL');

INSERT OR REPLACE INTO RequirementSetRequirements
		(RequirementSetId,				RequirementId)
VALUES	('LEU_NO_MOUNTAIN_MOVE_REQUIREMENT',		'LEU_REQUIRES_NO_MOUNTAIN_ABILITY');

INSERT OR REPLACE INTO Requirements
		(RequirementId,						RequirementType,					Inverse)
VALUES	('LEU_REQUIRES_NO_MOUNTAIN_ABILITY',	'REQUIREMENT_UNIT_HAS_ABILITY',		1);

INSERT OR REPLACE INTO RequirementArguments
		(RequirementId,							Name,				Value)
VALUES	('LEU_REQUIRES_NO_MOUNTAIN_ABILITY',	'UnitAbilityType',		'ABILITY_MOUNTAIN_MOVE_ALLOWED');

INSERT OR REPLACE INTO UnitAbilities
		(UnitAbilityType,				Name,									Description,								Inactive)
VALUES	('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'LOC_ABILITY_MOVE_MOUNTAINS_NAME',		'LOC_ABILITY_MOVE_MOUNTAINS_DESCRIPTION',	1);	

INSERT OR REPLACE INTO TypeTags
		(Type,							Tag)
VALUES	('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'CLASS_LANDCIVILIAN'),
		('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'CLASS_LIGHT_CAVALRY'),
		('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'CLASS_RANGED_CAVALRY'),
		('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'CLASS_HEAVY_CAVALRY'),
		('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'CLASS_RANGED'),
		('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'CLASS_RECON'),
		('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'CLASS_MELEE'),
		('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'CLASS_ANTI_CAVALRY'),
		('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'CLASS_SIEGE'),
		('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'CLASS_TRADER'),
		('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'CLASS_MEDIC'),
		('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'CLASS_BATTERING_RAM'),
		('ABILITY_MOUNTAIN_MOVE_ALLOWED',		'CLASS_SIEGE_TOWER');

INSERT OR REPLACE INTO GameModifiers
		(ModifierId)
VALUES	('NO_GRASS_MOUNTAIN_MOVE'),
		('NO_PLAINS_MOUNTAIN_MOVE'),
		('NO_DESERT_MOUNTAIN_MOVE'),
		('NO_TUNDRA_MOUNTAIN_MOVE'),
		('NO_SNOW_MOUNTAIN_MOVE');

INSERT OR REPLACE INTO DynamicModifiers
		(ModifierType,								CollectionType,				EffectType)
VALUES	('MODIFIER_ALL_UNITS_NO_MOVE_TERRAIN',		'COLLECTION_ALL_UNITS',		'EFFECT_ADJUST_UNIT_NO_MOVE_TERRAIN');

INSERT OR REPLACE INTO Modifiers	
		(ModifierId,							ModifierType,							SubjectRequirementSetId)
VALUES	('NO_GRASS_MOUNTAIN_MOVE',				'MODIFIER_ALL_UNITS_NO_MOVE_TERRAIN',	'LEU_NO_MOUNTAIN_MOVE_REQUIREMENT'),
		('NO_PLAINS_MOUNTAIN_MOVE',				'MODIFIER_ALL_UNITS_NO_MOVE_TERRAIN',	'LEU_NO_MOUNTAIN_MOVE_REQUIREMENT'),
		('NO_DESERT_MOUNTAIN_MOVE',				'MODIFIER_ALL_UNITS_NO_MOVE_TERRAIN',	'LEU_NO_MOUNTAIN_MOVE_REQUIREMENT'),
		('NO_TUNDRA_MOUNTAIN_MOVE',				'MODIFIER_ALL_UNITS_NO_MOVE_TERRAIN',	'LEU_NO_MOUNTAIN_MOVE_REQUIREMENT'),
		('NO_SNOW_MOUNTAIN_MOVE',				'MODIFIER_ALL_UNITS_NO_MOVE_TERRAIN',	'LEU_NO_MOUNTAIN_MOVE_REQUIREMENT');

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,							Name,						Value)
VALUES	('NO_GRASS_MOUNTAIN_MOVE',				'TerrainType',				'TERRAIN_GRASS_MOUNTAIN'),
		('NO_PLAINS_MOUNTAIN_MOVE',				'TerrainType',				'TERRAIN_PLAINS_MOUNTAIN'),
		('NO_DESERT_MOUNTAIN_MOVE',				'TerrainType',				'TERRAIN_DESERT_MOUNTAIN'),
		('NO_TUNDRA_MOUNTAIN_MOVE',				'TerrainType',				'TERRAIN_TUNDRA_MOUNTAIN'),
		('NO_SNOW_MOUNTAIN_MOVE',				'TerrainType',				'TERRAIN_SNOW_MOUNTAIN');
		

--==========================================================================================================================
--==========================================================================================================================