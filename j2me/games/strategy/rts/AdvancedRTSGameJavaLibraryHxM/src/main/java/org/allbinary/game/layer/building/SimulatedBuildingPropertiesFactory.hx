/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.game.layer.building;

import org.allbinary.game.combat.damage.DamageFloaters;
import org.allbinary.game.tracking.TrackingEvent;
import org.allbinary.game.tracking.TrackingEventHandler;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;

class SimulatedBuildingPropertiesFactory extends BuildingPropertiesFactory {
    private static final instanceC : SimulatedBuildingPropertiesFactory = new SimulatedBuildingPropertiesFactory();
    public static function getInstance() : SimulatedBuildingPropertiesFactory {
        return SimulatedBuildingPropertiesFactory.instanceC;
    }

    public override function getEfficiencyPerLevel(buildingLayer : BuildingLayer) : Int {
        return 0;
    }

    public override function getDamageFloaters(buildingLayer : BuildingLayer) : DamageFloaters {
        final damageFloaters : DamageFloaters = DamageFloaters.getInstance();
        this.damageFloatersPaintableInterface = damageFloaters;
        return damageFloaters;
    }

    // throws Exception
    public override function getHealthBar(buildingLayer : BuildingLayer) : Paintable {
        return NullPaintable.getInstance();
    }

    public override function getHashtable() : ABHashtable<Any, Any> {
        return StdUtil.getInstance().NULL_TABLE;
    }

    public override function getTrackingEvent(buildingLayer : BuildingLayer) : TrackingEvent {
        return new TrackingEvent(TrackingEventHandler.getInstance());
    }

    public function new() {
        super();
    }
}

