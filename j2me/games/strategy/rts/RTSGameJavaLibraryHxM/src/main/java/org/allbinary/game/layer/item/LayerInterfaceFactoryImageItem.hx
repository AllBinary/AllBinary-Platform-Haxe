/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2003 AllBinary 
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
package org.allbinary.game.layer.item;

//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.Image;
import org.allbinary.graphics.form.item.ABCustomImageItem;
import org.allbinary.animation.Animation;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.layer.LayerInterfaceFactoryInterface;

class LayerInterfaceFactoryImageItem extends ABCustomImageItem {
    private final animationArray : haxe.ds.Vector<Animation>;
    private final layerInterfaceFactoryInterface : LayerInterfaceFactoryInterface;
    public function new(label : String, img : Image, layout : Int, altText : String, basicColor : BasicColor, animationArray : haxe.ds.Vector<Animation>, layerInterfaceFactoryInterface : LayerInterfaceFactoryInterface) {
        super(label, img, layout, altText, basicColor, 0);
        this.animationArray = animationArray;
        this.layerInterfaceFactoryInterface = layerInterfaceFactoryInterface;
    }

    public function getLayerInterfaceFactoryInterface() : LayerInterfaceFactoryInterface {
        return this.layerInterfaceFactoryInterface;
    }

    public override function paintXY(graphics : Graphics, x : Int, y : Int) : Void {
        super.paintXY(graphics, x, y);
        {
            var index : Int = this.animationArray.length;
            while (--index >= 0) {
            this.animationArray[index].paintXY(graphics, x, y);
            }
        }
    }

}

