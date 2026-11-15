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
package org.allbinary.game.input.form;

import org.allbinary.game.identification.GroupCommonFactory;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.RTSPlayerLayerInterface;
import org.allbinary.game.layer.item.LayerInterfaceFactoryImageItem;
import org.allbinary.graphics.form.item.ABCustomItem;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.direction.DirectionFactory;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.form.ScrollSelectionForm;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.layer.LayerInterfaceFactoryInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory;
import org.allbinary.util.ABHashtable;

class RTSFormInput {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final groupCommonFactory : GroupCommonFactory = GroupCommonFactory.getInstance();
    private final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    public final newUnconstructedRTSLayerInterfaceArray : haxe.ds.Vector<CollidableDestroyableDamageableLayer> = haxe.ds.Vector.fromArrayCopy([for (index in 0...7) null]);
    public final groupInterfaceArray : haxe.ds.Vector<Group>;
    private var selectedGeographicCellPosition : GeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    private var stickyItemSelected : Bool = false;
    private var selectedStickyItemIndex : Int = 0;
    private var selectedStickyItem : ABCustomItem = ABCustomItem.getNullInstance();
    public function new(groupInterfaceArray : haxe.ds.Vector<Group>) {
        final size : Int = this.newUnconstructedRTSLayerInterfaceArray.length;
        for (index in 0...size) {
            this.newUnconstructedRTSLayerInterfaceArray[index] = CollidableDestroyableDamageableLayer.getNullInstance();
        }
        this.groupInterfaceArray = groupInterfaceArray;
        this.hashtable.put(DirectionFactory.getInstance().NAME, DirectionFactory.getInstance().DOWN);
        if (groupInterfaceArray != null) {
            this.hashtable.put(this.groupCommonFactory.ID, groupInterfaceArray);
        }
    }

    // throws Exception
    public function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
    }

    // throws Exception
    public function processAtPoint(associatedRtsLayer : CollidableDestroyableDamageableLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, point : GPoint) : Void {
        final index : Int = this.getIndexAt(rtsPlayerLayerInterface, point);
        if (index < 0) {
            return;
        }
        final scrollSelectionForm : ScrollSelectionForm = rtsPlayerLayerInterface.getCurrentScrollSelectionForm();
        final item : ABCustomItem = scrollSelectionForm.get(index);
        if (item == null) {
            return;
        }
        this.processGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index);
    }

    // throws Exception
    public function process(layerManager : AllBinaryLayerManager) : Void {
        this.setAllBinaryGameLayerManager((cast layerManager : AllBinaryGameLayerManager));
    }

    // throws Exception
    public function processGameSpecific(associatedRtsLayer : CollidableDestroyableDamageableLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, item : ABCustomItem, index : Int) : Void {
    }

    // throws Exception
    public function processSticky(associatedRtsLayer : CollidableDestroyableDamageableLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, point : GPoint) : Bool {
        var index : Int = this.getIndexAt(rtsPlayerLayerInterface, point);
        if (index < 0) {
            return false;
        }
        final scrollSelectionForm : ScrollSelectionForm = rtsPlayerLayerInterface.getCurrentScrollSelectionForm();
        final item : ABCustomItem = scrollSelectionForm.get(index);
        if (item == null) {
            return false;
        }
        this.processStickyGameSpecific(associatedRtsLayer, rtsPlayerLayerInterface, layerManager, item, index);
        return true;
    }

    // throws Exception
    public function processStickyGameSpecific(associatedRtsLayer : CollidableDestroyableDamageableLayer, rtsPlayerLayerInterface : RTSPlayerLayerInterface, layerManager : AllBinaryLayerManager, item : ABCustomItem, index : Int) : Void {
    }

    // throws Exception
    public function getItemAt(rtsPlayerLayerInterface : RTSPlayerLayerInterface, point : GPoint) : ABCustomItem {
        this.logUtil.putF(new StringMaker().append("Point: ").append(StringUtil.getInstance().toString(point)).toString(), this, "getItemAt");
        final scrollSelectionForm : ScrollSelectionForm = rtsPlayerLayerInterface.getCurrentScrollSelectionForm();
        return scrollSelectionForm.getSelectedItem(point);
    }

    // throws Exception
    public function getIndexAt(rtsPlayerLayerInterface : RTSPlayerLayerInterface, point : GPoint) : Int {
        this.logUtil.putF(new StringMaker().append("Point: ").append(StringUtil.getInstance().toString(point)).toString(), this, "getItemAt");
        final scrollSelectionForm : ScrollSelectionForm = rtsPlayerLayerInterface.getCurrentScrollSelectionForm();
        return scrollSelectionForm.getSelectedIndexForPoint(point);
    }

    // throws Exception
    public function getInstance(layerManager : AllBinaryLayerManager, aItem : ABCustomItem, geographicMapCellPosition : GeographicMapCellPosition) : CollidableDestroyableDamageableLayer {
        final item : LayerInterfaceFactoryImageItem = (cast aItem : LayerInterfaceFactoryImageItem);
        final layerInterfaceFactoryInterface : LayerInterfaceFactoryInterface = item.getLayerInterfaceFactoryInterface();
        final cellPoint : GPoint = geographicMapCellPosition.getPoint();
        if (layerInterfaceFactoryInterface != null) {
            this.hashtable.put(AllBinaryGameLayerManager.ID, layerManager);
            return (cast layerInterfaceFactoryInterface.getNextInstance(this.getHashtable(), cellPoint.getX(), cellPoint.getY(), cellPoint.getZ()) : RTSLayer);
        }
        return CollidableDestroyableDamageableLayer.getNullInstance();
    }

    public function getSelectedGeographicCellPosition() : GeographicMapCellPosition {
        return this.selectedGeographicCellPosition;
    }

    public function setSelectedGeographicCellPosition(selectedGeographicCellPosition : GeographicMapCellPosition) : Void {
        this.logUtil.putF(new StringMaker().append("Selected GeographicMapCellPosition: ").append(selectedGeographicCellPosition.toString()).toString(), this, "setSelectedGeographicCellPosition");
        this.selectedGeographicCellPosition = selectedGeographicCellPosition;
    }

    public function isStickyItemSelected() : Bool {
        return this.stickyItemSelected;
    }

    public function setStickyItemSelected(stickyItemSelected : Bool) : Void {
        this.stickyItemSelected = stickyItemSelected;
    }

    public function getSelectedStickyItem() : ABCustomItem {
        return this.selectedStickyItem;
    }

    public function setSelectedStickyItem(selectedStickyItem : ABCustomItem) : Void {
        this.selectedStickyItem = selectedStickyItem;
    }

    public function getSelectedStickyItemIndex() : Int {
        return this.selectedStickyItemIndex;
    }

    public function setSelectedStickyItemIndex(selectedStickyItemIndex : Int) : Void {
        this.selectedStickyItemIndex = selectedStickyItemIndex;
    }

    public function getHashtable() : ABHashtable<Any, Any> {
        return this.hashtable;
    }

}

