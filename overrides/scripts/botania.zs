import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

// GT recipes for manasteel and manasap related recipes
chemical_bath.recipeBuilder().inputs(<minecraft:stone>).fluidInputs(<liquid:aluminium> * 72).outputs([<contenttweaker:dmanastone>]).duration(50).EUt(100).buildAndRegister();
extractor.recipeBuilder().inputs(<botania:manaresource>).fluidOutputs([<liquid:fluidmanasteel> * 144]).duration(40).EUt(30).buildAndRegister();
extractor.recipeBuilder().inputs(<botania:manaresource:23>).fluidOutputs([<liquid:manasap> * 30]).duration(40).EUt(30).buildAndRegister();
extractor.recipeBuilder().inputs(<botania:manaresource:16>).fluidOutputs([<liquid:manasap> * 50]).duration(40).EUt(30).buildAndRegister();

//Steel into manasteel, quartzite into quartz
mods.botania.ManaInfusion.addInfusion(<botania:manaresource>, <gregtech:meta_ingot:324>, 3000);
mods.botania.ManaInfusion.addInfusion(<minecraft:quartz>, <gregtech:meta_gem:340>, 3000);

recipes.addShaped(endoflame, [
	[<minecraft:gold_ingot>, <minecraft:gold_ingot>, <minecraft:gold_ingot>],
	[null ,<gregtech:machine:51>, null],
	[null, <gregtech:meta_item_1:439>, null]]);


recipes.remove(<botania:spark>);
makeShaped("spark", <botania:spark>,
	[" P ",
	 "GMG",
	 " P "],
	{ G	: <minecraft:gold_ingot>,
	  M : <ore:ingotManasteel>,
	  P : <gregtech:meta_item_1:439>
	  });
	  
makeShaped("sparkbetter", <botania:spark> * 2,
	[" P ",
	 "GMG",
	 " P "],
	{ G	: <minecraft:blaze_powder>,
	  M : <ore:ingotManasteel>,
	  P : <gregtech:meta_item_1:439>
	  });
	  
makeShaped("dmanapool", <botania:pool:2>,
	["   ",
	 "D D",
	 "DDD"],
	{ D	: <contenttweaker:dmanastone>
	  });
	  
recipes.remove(<botania:terraplate>);
makeShaped("tap", <botania:terraplate>,
	["BBB",
	 "DCD",
	 "DDD"],
	{ B	: <botania:storage>,
	  D : <contenttweaker:dmanastone>,
	  C : <ore:circuitGood>
	  });
	  

//Removal 
recipes.remove(<botania:pool:2>);
recipes.remove(<botanicadds:mana_tesseract>);
mods.jei.JEI.removeAndHide(<botania:altar>);
mods.botania.ManaInfusion.removeRecipe(<botania:manaresource>);
mods.botania.Apothecary.removeRecipe("endoflame");
mods.botania.Apothecary.removeRecipe("puredaisy");