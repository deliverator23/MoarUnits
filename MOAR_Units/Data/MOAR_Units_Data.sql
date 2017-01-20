UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_RIFLEMAN' WHERE Unit = 'UNIT_MUSKETMAN';

UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_RIFLEMAN' WHERE Unit = 'UNIT_SPANISH_CONQUISTADOR';

UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CUIRASSIER' WHERE Unit = 'UNIT_KNIGHT';

UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CUIRASSIER' WHERE Unit = 'UNIT_INDIAN_VARU';

UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_MACEMAN' WHERE Unit = 'UNIT_SWORDSMAN';

UPDATE ModifierArguments SET Value = 9 WHERE ModifierId = 'CONQUISTADOR_SPECIFIC_UNIT_COMBAT' AND Name = 'Amount';

/* Expanded Recon Class */
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_EXPLORER' WHERE Unit = 'UNIT_SCOUT';

UPDATE Units SET InitialLevel = 2 WHERE UnitType = 'UNIT_SCOUT' OR UnitType = 'UNIT_EXPLORER' OR UnitType = 'UNIT_RANGER' OR UnitType = 'UNIT_SNIPER';

UPDATE Units SET MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS' WHERE UnitType = 'UNIT_RANGER';

UPDATE Units SET Range = 2 WHERE UnitType = 'UNIT_MACHINE_GUN';

UPDATE Units SET BaseSightRange = 2 WHERE UnitType='UNIT_NATURALIST';

/* Expanded Recon Promotions Rework */
UPDATE UnitPromotions SET Level = 2, Column = 3 WHERE UnitPromotionType='PROMOTION_GUERRILLA';
UPDATE UnitPromotions SET Level = 3, Column = 1 WHERE UnitPromotionType='PROMOTION_SPYGLASS';

DELETE FROM UnitPromotionPrereqs WHERE UnitPromotion = 'PROMOTION_GUERRILLA';
DELETE FROM UnitPromotionPrereqs WHERE UnitPromotion = 'PROMOTION_SPYGLASS';
DELETE FROM UnitPromotionPrereqs WHERE UnitPromotion = 'PROMOTION_AMBUSH';
DELETE FROM UnitPromotionPrereqs WHERE UnitPromotion = 'PROMOTION_CAMOUFLAGE';

INSERT INTO UnitPromotionPrereqs (UnitPromotion, PrereqUnitPromotion) VALUES ('PROMOTION_SPYGLASS','PROMOTION_RANGER');
INSERT INTO UnitPromotionPrereqs (UnitPromotion, PrereqUnitPromotion) VALUES ('PROMOTION_SPYGLASS','PROMOTION_ALPINE');
INSERT INTO UnitPromotionPrereqs (UnitPromotion, PrereqUnitPromotion) VALUES ('PROMOTION_GUERRILLA','PROMOTION_SENTRY');
INSERT INTO UnitPromotionPrereqs (UnitPromotion, PrereqUnitPromotion) VALUES ('PROMOTION_AMBUSH','PROMOTION_SPYGLASS');
INSERT INTO UnitPromotionPrereqs (UnitPromotion, PrereqUnitPromotion) VALUES ('PROMOTION_CAMOUFLAGE','PROMOTION_GUERRILLA');
INSERT INTO UnitPromotionPrereqs (UnitPromotion, PrereqUnitPromotion) VALUES ('PROMOTION_CAMOUFLAGE','PROMOTION_AMBUSH');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('AMBUSH_REQUIREMENTS','REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('AMBUSH_REQUIREMENTS','PLAYER_IS_DEFENDER_REQUIREMENTS');
UPDATE Modifier SET SubjectRequirementSetId = 'AMBUSH_REQUIREMENTS' WHERE ModifierId = 'AMBUSH_INCREASED_COMBAT_STRENGTH';

/*
UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100', MustPurchase=0
WHERE  UnitType = 'UNIT_LANDSKNECHT';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_GENDARME';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, TraitType=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_CUIRASSIER';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, TraitType=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_DRUZHINA';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_RIFLEMAN';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_FRENCH_MARINE';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_GHAZI';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_ARMATOLOS';

UPDATE Units
SET    PrereqCivic=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_SHIGONG';

UPDATE Units
SET    PrereqCivic=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_MEDICINE_MAN';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_JINETE';


UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_SEPOY';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_T34';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_PANZER';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_ONAGER';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_YAMATO';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_WAR_GALLEY';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_AMAZON_SCOUT';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_VULTURE';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_SOHEI';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_AMAZON';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_FATHERLAND_VOLUNTEER';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_BANDEIRANTE';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_HYKSOS_BOWMAN';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_GARDE_REPUBLICAINE';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, TraitType=NULL,  Cost='1'
WHERE  UnitType = 'UNIT_CHOKONU';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, TraitType=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_HIRDMAN';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_ENGLISH_REDCOAT';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, TraitType=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_MINUTEMAN';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, TraitType=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_CROSSBOWMAN';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, TraitType=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_ARCHER';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, TraitType=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_BUILDER';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, TraitType=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_WARRIOR';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, TraitType=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_COMPANION_CAVALRY';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, TraitType=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_JINETE';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, TraitType=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_EQUITE';

UPDATE Units
SET    PrereqTech=NULL, StrategicResource=NULL, TraitType=NULL,  Cost='1', BaseMoves='100'
WHERE  UnitType = 'UNIT_LONGBOWMAN';
 */
