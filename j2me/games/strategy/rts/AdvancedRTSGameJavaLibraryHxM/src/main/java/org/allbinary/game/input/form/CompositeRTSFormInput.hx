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
package org.allbinary.game.input.form;

import org.allbinary.game.layer.RTSPlayerLayerInterface;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.string.CommonStrings;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.form.ScrollSelectionForm;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.string.CommonLabels;

class CompositeRTSFormInput extends RTSFormInput {
    private final rtsFormInputArray : haxe.ds.Vector<RTSFormInput>;
    private final itemIndex : haxe.ds.Vector<Int>;
    private final isPrimaryWaypointCreator : Bool;
    public function new(groupInterface : haxe.ds.Vector<Group>, isPrimaryWaypointCreator : Bool, itemIndex : haxe.ds.Vector<Int>) {
        super(groupInterface);
        this.itemIndex = itemIndex;
        this.isPrimaryWaypointCreator = isPrimaryWaypointCreator;
        this.rtsFormInputArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
        this.rtsFormInputArray[0] = new WaypointRTSFormInput(this.groupInterfaceArray, isPrimaryWaypointCreator);
        this.rtsFormInputArray[1] = new UnitRTSFormInput(this.groupInterfaceArray);
    }

    // throws Exception
    public override function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        super.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
        final geographicMapCompositeInterface : GeographicMapCompositeInterface = (cast allBinaryGameLayerManager : GeographicMapCompositeInterface);
        final geographicMapInterface : BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        final size : Int = this.rtsFormInputArray.length;
        for (index in 0...size) {
            this.rtsFormInputArray[index].setAllBinaryGameLayerManager(allBinaryGameLayerManager);
        }
    }

    // throws Exception
    public override function processAtPoint(associatedRtsLayer : CollidableDestroyableDamageableLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, point : GPoint) : Void {
        var scrollSelectionForm : ScrollSelectionForm = rtsPlayerLayerInterface.getCurrentScrollSelectionForm();
        var index : Int = scrollSelectionForm.getSelectedIndexForPoint(point);
        if (this.isStickyItemSelected() && associatedRtsLayer == CollidableDestroyableDamageableLayer.getNullInstance()) {
            if (this.getSelectedStickyItemIndex() <= this.itemIndex[0]) {
                this.rtsFormInputArray[0].processAtPoint(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point);
            }
        } else if (index > this.itemIndex[0]) {
            this.rtsFormInputArray[1].processAtPoint(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point);
        }
    }

    // throws Exception
    public override function processGameSpecific(associatedRtsLayer : CollidableDestroyableDamageableLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, item : ABCustomItem, index : Int) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF(CommonLabels.getInstance().INDEX_LABEL + index + " > " + this.itemIndex[0], this, commonStrings.PROCESS);
        if (this.isStickyItemSelected() && associatedRtsLayer == CollidableDestroyableDamageableLayer.getNullInstance()) {
            if (this.getSelectedStickyItemIndex() <= this.itemIndex[0]) {
                this.rtsFormInputArray[0].processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index);
            }
        } else if (index > this.itemIndex[0]) {
            this.rtsFormInputArray[1].processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index);
        }
    }

    // throws Exception
    public override function processSticky(associatedRtsLayer : CollidableDestroyableDamageableLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, point : GPoint) : Bool {
        return this.rtsFormInputArray[0].processSticky(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, point);
    }

    // throws Exception
    public override function processStickyGameSpecific(associatedRtsLayer : CollidableDestroyableDamageableLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, item : ABCustomItem, index : Int) : Void {
        this.rtsFormInputArray[0].processStickyGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index);
    }

    public override function getSelectedStickyItemIndex() : Int {
        return this.rtsFormInputArray[0].getSelectedStickyItemIndex();
    }

    public override function isStickyItemSelected() : Bool {
        return this.rtsFormInputArray[0].isStickyItemSelected();
    }

    public override function setStickyItemSelected(stickyItemSelected : Bool) : Void {
        this.rtsFormInputArray[0].setStickyItemSelected(stickyItemSelected);
    }

    public override function getSelectedStickyItem() : ABCustomItem {
        return this.rtsFormInputArray[0].getSelectedStickyItem();
    }

    public override function setSelectedStickyItem(selectedStickyItem : ABCustomItem) : Void {
        this.rtsFormInputArray[0].setSelectedStickyItem(selectedStickyItem);
    }

}

