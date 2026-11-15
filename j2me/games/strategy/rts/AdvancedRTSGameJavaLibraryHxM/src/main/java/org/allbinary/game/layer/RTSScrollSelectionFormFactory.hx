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
package org.allbinary.game.layer;

import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.form.FormTypeFactory;
import org.allbinary.graphics.form.MultipleScrollSelectionHorizontalForm;
import org.allbinary.graphics.form.ScrollSelectionForm;
import org.allbinary.input.motion.button.CommonButtons;
import org.allbinary.input.motion.button.TouchButtonLocationHelper;

class RTSScrollSelectionFormFactory {
    // throws Exception
    public static function getInstance(formLabel : String, items : haxe.ds.Vector<ABCustomItem>) : ScrollSelectionForm {
        final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
        final touchButtonLocationHelper : TouchButtonLocationHelper = new TouchButtonLocationHelper();
        final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        final menuX : Int = CommonButtons.getInstance().STANDARD_BUTTON_SIZE + touchButtonLocationHelper.getColumnsRemainderHalf();
        final width : Int = displayInfo.getLastWidth() - (menuX * 2);
        final menuRectangle : Rectangle = new Rectangle(PointFactory.getInstance().createXY(menuX, 16), width, CommonButtons.getInstance().STANDARD_BUTTON_SIZE);
        return MultipleScrollSelectionHorizontalForm.createForm(formLabel, items, menuRectangle, FormTypeFactory.getInstance().HORIZONTAL_FORM, 0, basicColorFactory.BLACK, basicColorFactory.WHITE);
    }

    public function new() {
    }
}

