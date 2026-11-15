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
package org.allbinary.game.input;

import org.allbinary.game.input.form.AssignWaypointsUtil;
import org.allbinary.game.layer.AdvancedRTSGameLayer;
import org.allbinary.game.layer.RTSLayer;
import org.allbinary.game.layer.building.BuildingLayer;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.game.layer.unit.UnitLayer;
import org.allbinary.logic.NullUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.logic.util.visitor.Visitor;

class SelectAdvancedRTSLayerVisitor extends Visitor {
    private final selectedRTSLayersPlayerGameInput : SelectedRTSLayersPlayerGameInput;
    public function new(selectedRTSLayersPlayerGameInput : SelectedRTSLayersPlayerGameInput) {
        super();
        this.selectedRTSLayersPlayerGameInput = selectedRTSLayersPlayerGameInput;
    }

    public override function visit(anyType : Any) : Any {
        final selectedLayer : CollidableDestroyableDamageableLayer = (cast anyType : CollidableDestroyableDamageableLayer);
        if (selectedLayer != CollidableDestroyableDamageableLayer.getNullInstance() && selectedLayer.getType() == BuildingLayer.getStaticType()) {
            final rtsGameLayer : AdvancedRTSGameLayer = (cast selectedLayer : AdvancedRTSGameLayer);
            final assignWaypointsUtil : AssignWaypointsUtil = AssignWaypointsUtil.getInstance();
            final list : BasicArrayList = this.selectedRTSLayersPlayerGameInput.getSelectedBasicArrayList();
            var currentRTSLayer : RTSLayer = null;
            var unitLayer : UnitLayer = null;
            {
                var index : Int = list.size() - 1;
                while (index >= 0) {
                currentRTSLayer = (cast list.get(index) : RTSLayer);
                if (currentRTSLayer.getType() == UnitLayer.getStaticType()) {
                    unitLayer = (cast currentRTSLayer : UnitLayer);
                    unitLayer.setParentLayer(rtsGameLayer);
                    assignWaypointsUtil.set(unitLayer, rtsGameLayer);
                }
                    index--;
                }
            }
        }
        return NullUtil.getInstance().NULL_OBJECT;
    }

}

