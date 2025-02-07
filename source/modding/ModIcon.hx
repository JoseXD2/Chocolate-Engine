package modding;

#if MODS_ALLOWED
import sys.io.File;
import sys.FileSystem;
import openfl.display.BitmapData;
import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;
class ModIcon extends FlxSprite
{
	/**
	 * Used for ModMenu! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(modId:String = 'Template Mod')
	{
		super();

		var imageDataRaw = File.getBytes(SUtil.getStorageDirectory() + "mods/" + modId + "/_polymod_icon.png");
		var graphicData = BitmapData.fromBytes(imageDataRaw);

		if (FileSystem.exists(SUtil.getStorageDirectory() + "mods/" + modId + "/_polymod_icon.png"))
		{
			loadGraphic(graphicData, false, 0, 0, false, modId);
		}
		else
		{
			loadGraphic(Paths.image("UI/default/unknownMod"));
		}

		setGraphicSize(150, 150);
		updateHitbox();

		scrollFactor.set();
		antialiasing = true;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
#end
