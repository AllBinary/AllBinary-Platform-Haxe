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

import org.allbinary.game.input.RTSLayerFormFactory;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.graphics.form.ScrollSelectionForm;
import org.allbinary.graphics.form.item.ItemArraySingletonFactoryInterface;

class AdvancedRTSLayerFormFactory extends RTSLayerFormFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final scrollSelectionForm : ScrollSelectionForm;
    public function new(label : String, itemArrayFactoryInterface : ItemArraySingletonFactoryInterface) {
        super();
        var scrollSelectionForm : ScrollSelectionForm = ScrollSelectionForm.getNullScrollSelectionForm();
        try {
            final items : haxe.ds.Vector<ABCustomItem> = itemArrayFactoryInterface.getItems();
            scrollSelectionForm = RTSScrollSelectionFormFactory.getInstance(label, items);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
        }
        this.scrollSelectionForm = scrollSelectionForm;
    }

    public override function getInstance(rtsLayer : RTSLayer) : ScrollSelectionForm {
        return this.scrollSelectionForm;
    }

}

