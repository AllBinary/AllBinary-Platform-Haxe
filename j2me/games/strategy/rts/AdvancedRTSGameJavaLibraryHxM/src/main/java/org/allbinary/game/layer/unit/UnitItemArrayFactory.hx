/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
 *  
 * By agreeing to this license you and any business entity you represent are 
 * legally bound to the AllBinary Open License Version 1 legal agreement. 
 *  
 * You may obtain the AllBinary Open License Version 1 legal agreement from 
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
 *  
 * Created By: Travis Berthelot 
 *   
 */
// Generated Code Do Not Modify
package org.allbinary.game.layer.unit;

//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.ImageItem;
import org.allbinary.game.layer.RTSGameStrings;
import org.allbinary.game.layer.item.LayerInterfaceFactoryImageItem;
import org.allbinary.game.layer.item.RTSLayerTextAnimation;
import org.allbinary.game.layer.resources.BasicGameResources;
import org.allbinary.game.layer.waypoint.FlagGameResources;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.image.GameFeatureImageCacheFactory;
import org.allbinary.string.CommonSeps;
import org.allbinary.animation.Animation;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.form.item.CustomItemUtil;
import org.allbinary.graphics.form.item.ItemArraySingletonFactoryInterface;
import org.allbinary.image.ImageCache;
import org.allbinary.layer.LayerInterfaceFactoryInterface;

class UnitItemArrayFactory implements ItemArraySingletonFactoryInterface {
    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private var basicColor : BasicColor = BasicColorFactory.getInstance().WHITE;
    private static final ITEMS : haxe.ds.Vector<ABCustomItem> = CustomItemUtil.getInstance().CUSTOM_ITEM_ARRAY;
    private final resources : haxe.ds.Vector<BasicGameResources>;
    public function new(resources : haxe.ds.Vector<BasicGameResources>) {
        this.resources = resources;
    }

    // throws Exception
    public function createFlagItem(flagResources : FlagGameResources, layerInterfaceFactoryInterface : LayerInterfaceFactoryInterface) : ABCustomItem {
        var name : String = flagResources.NAME;
        var index : Int = name.indexOf(this.commonSeps.SPACE);
        if (index >= 0) {
            name = name.substring(index);
        }
        return this.createNamedFlagItem(flagResources, name, layerInterfaceFactoryInterface);
    }

    // throws Exception
    public function createNamedFlagItem(flagResources : FlagGameResources, name : String, layerInterfaceFactoryInterface : LayerInterfaceFactoryInterface) : ABCustomItem {
        final IMAGE_CACHE : ImageCache = GameFeatureImageCacheFactory.getInstance();
        final image : Image = IMAGE_CACHE.getWithKey(flagResources.RESOURCE_ICON);
        final item : ABCustomItem = new LayerInterfaceFactoryImageItem(name, image, ImageItem.LAYOUT_DEFAULT, flagResources.NAME, this.basicColor, haxe.ds.Vector.fromArrayCopy([new RTSLayerTextAnimation(RTSGameStrings.getInstance().DRAGGABLE, image)]), layerInterfaceFactoryInterface);
        return item;
    }

    // throws Exception
    public function getItems() : haxe.ds.Vector<ABCustomItem> {
        return UnitItemArrayFactory.ITEMS;
    }

    public function getResources() : haxe.ds.Vector<BasicGameResources> {
        return this.resources;
    }

    public function indexOf(basicGameResources : BasicGameResources) : Int {
        {
            var index : Int = this.resources.length - 1;
            while (index >= 0) {
            if (this.resources[index] == basicGameResources) {
                return index;
            }
                index--;
            }
        }
        return -1;
    }

}

