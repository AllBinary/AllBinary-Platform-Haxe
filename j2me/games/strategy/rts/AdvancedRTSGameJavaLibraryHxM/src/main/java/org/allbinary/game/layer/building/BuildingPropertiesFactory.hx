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
import org.allbinary.game.combat.damage.PtsDamageFloaters;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.game.graphics.hud.BasicHudFactory;
import org.allbinary.game.health.HealthBar;
import org.allbinary.game.health.HealthBarTwodAnimation;
import org.allbinary.game.tracking.TrackingEvent;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;

class BuildingPropertiesFactory {
    private static final instance : BuildingPropertiesFactory = new BuildingPropertiesFactory();
    public static function getInstance() : BuildingPropertiesFactory {
        return BuildingPropertiesFactory.instance;
    }

    public function getEfficiencyPerLevel(buildingLayer : BuildingLayer) : Int {
        return 10000 / buildingLayer.getMaxLevel() + 10000 % buildingLayer.getMaxLevel();
    }

    public var damageFloatersPaintableInterface : Paintable = NullPaintable.getInstance();
    public function getDamageFloaters(buildingLayer : BuildingLayer) : DamageFloaters {
        var damageFloaters : DamageFloaters = DamageFloaters.getInstance();
        if (Features.getInstance().isFeature(GameFeatureFactory.getInstance().DAMAGE_FLOATERS)) {
            damageFloaters = new PtsDamageFloaters(buildingLayer);
            this.damageFloatersPaintableInterface = damageFloaters;
        } else {
            damageFloaters = new DamageFloaters();
        }
        return damageFloaters;
    }

    // throws Exception
    public function getHealthBar(buildingLayer : BuildingLayer) : Paintable {
        var healthBar : Paintable = NullPaintable.getInstance();
        if (Features.getInstance().isFeature(GameFeatureFactory.getInstance().HEALTH_BARS)) {
            healthBar = new HealthBar(buildingLayer, buildingLayer.getHealthInterface(), new HealthBarTwodAnimation((cast buildingLayer : AllBinaryLayer), BasicHudFactory.getInstance().BOTTOMLEFT), -1);
        }
        return healthBar;
    }

    public function getHashtable() : ABHashtable<Any, Any> {
        return StdUtil.getInstance().createHashtable();
    }

    public function getTrackingEvent(buildingLayer : BuildingLayer) : TrackingEvent {
        return new TrackingEvent(buildingLayer);
    }

    public function new() {
    }
}

