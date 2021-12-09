import crafttweaker.world.IFacing;
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.IBlockMatcher;
import mods.gregtech.multiblock.MultiblockAbility;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.FactoryMultiblockShapeInfo;
import mods.gregtech.multiblock.IBlockInfo;
import mods.gregtech.multiblock.IBlockWorldState;
import mods.gregtech.multiblock.Multiblock;

import mods.gregtech.MetaTileEntities;

import mods.gregtech.recipe.FactoryRecipeMap;

import mods.gregtech.render.ITextureArea;
import mods.gregtech.render.MoveType;
import mods.gregtech.render.ICubeRenderer;
import mods.gregtech.render.Textures;

// Multiblock 


var id = 3000;
var loc = "tier_one_drill_base";

val tier_one_drill_base = Builder.start(loc, id)
    .withPattern(
        FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.BACK, RelativeDirection.UP)
            .aisle(
                "F~F",
                "~C~",
                "F~F")
            .aisle(
                "F~F",
                "~C~",
                "F~F")
            .aisle(
                "III",
                "IBI",
                "IEI")
			.aisle(
                "SSS",
                "SSS",
                "SSS")
            .aisle(
                "~~~",
                "~B~",
                "~~~")
            .where("E", IBlockMatcher.controller(loc))
            .where("~", IBlockMatcher.AIR)
			.where("F", <gregtech:frame_wood>)
			.where("C", <minecraft:cobblestone_wall>)
			.where("S", <minecraft:stonebrick>)
			.where("B", <minecraft:stonebrick>)  
            .whereOr("I", <metastate:stonebrick> as IBlockMatcher,
                            IBlockMatcher.abilityPartPredicate(MultiblockAbility.IMPORT_ITEMS,
                                                                MultiblockAbility.IMPORT_FLUIDS,
                                                                MultiblockAbility.EXPORT_ITEMS))

            .build())
    .addDesign(
        FactoryMultiblockShapeInfo.start()
            .aisle(
                "F F",
                "F F",
				"IEO",
				"BBB",
				"   ",
				"   ")
            .aisle(
                " C ",
                " C ",
				"BBX",
				"BBB",
				" B ",
				" B ")
            .aisle(
                "F F",
                "F F",
				"BBB",
				"BBB",
				"   ",
				"   ")
            .where("I", MetaTileEntities.ITEM_IMPORT_BUS[0], IFacing.north())
            .where("O", MetaTileEntities.ITEM_EXPORT_BUS[0], IFacing.north())
            .where("X", MetaTileEntities.FLUID_IMPORT_HATCH[0], IFacing.west())
            .where("E", IBlockInfo.controller(loc))
			.where(" ", IBlockInfo.EMPTY)
			.where("F", <gregtech:frame_wood>)
			.where("C", <metastate:cobblestone_wall>)
			.where("S", <metastate:stonebrick>)
			.where("B", <metastate:stonebrick>)
            .build())
    .withRecipeMap(
        FactoryRecipeMap.start(loc)
                        .minFluidInputs(1)
                        .maxFluidInputs(1)
                        .minInputs(1)
						.maxInputs(1)
						.minOutputs(1)
                        .maxOutputs(4)
                        .build())
    .buildAndRegister() as Multiblock;
	
tier_one_drill_base.noEnergy = true;

// Lang	
game.setLocalization(
    "multiblocktweaker.machine.tier_one_drill_base.name",
    "Tier one drill base controller"
);
game.setLocalization(
    "multiblocktweaker.multiblock.tier_one_drill_base.description",
    "i forgor"
);	

game.setLocalization(
    "recipemap.tier_one_drill_base.name",
    "Tier one drill base"
);

// Controller Recipe
recipes.addShaped(
    <gregtech:machine:3000>,
    [
        [<gregtech:cable:71>,         <gregtech:meta_item_2:32487>,         <gregtech:cable:71>],
        [<gregtech:meta_item_2:32487>, <gregtech:metal_casing:2>,  <gregtech:meta_item_2:32487>],
        [<gregtech:cable:71>,         <gregtech:meta_item_2:32487>,         <gregtech:cable:71>]
    ]
);

// Recipes	
	
tier_one_drill_base.recipeMap
    .recipeBuilder()
    .duration(500)
    .inputs(<contenttweaker:tieronedrill>)
	.fluidInputs(<liquid:steam> * 8000)
    .outputs(<minecraft:dirt> * 32,
			 <gregtech:ore_iron_0:4> * 16,
	         <gregtech:ore_copper_0:4> * 16,
	         <gregtech:ore_redstone_0:4> * 8)
    .buildAndRegister();
	
tier_one_drill_base.recipeMap
    .recipeBuilder()
    .duration(500)
    .inputs(<contenttweaker:tiertwodrill>)
	.fluidInputs(<liquid:steam> * 8000)
    .outputs(<gregtech:ore_tin_0> * 16,
	         <minecraft:obsidian> * 32,
	         <gregtech:ore_gold_0> * 10)
    .buildAndRegister();