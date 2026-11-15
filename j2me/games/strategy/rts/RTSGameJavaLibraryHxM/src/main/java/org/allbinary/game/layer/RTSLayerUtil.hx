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
package org.allbinary.game.layer;

import org.allbinary.game.identification.GroupCommonFactory;
import org.allbinary.util.BasicArrayList;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.direction.DirectionFactory;
import org.allbinary.game.GameInfo;
import org.allbinary.game.combat.weapon.WeaponProperties;
import org.allbinary.game.identification.BasicGroupFactory;
import org.allbinary.game.part.PartInterface;
import org.allbinary.game.part.weapon.BasicWeaponPart;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.racetrack.BaseRaceTrackGeographicMap;
import org.allbinary.util.ABHashtable;

class RTSLayerUtil {
    private static final instance : RTSLayerUtil = new RTSLayerUtil();
    public static function getInstance() : RTSLayerUtil {
        return RTSLayerUtil.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final groupCommonFactory : GroupCommonFactory = GroupCommonFactory.getInstance();
    private function createWeaponProperties(weaponProperties : WeaponProperties, currentLevel : Int, lastLevel : Int) : WeaponProperties {
        var reloadTime : haxe.Int64 = weaponProperties.getReloadTime();
        if (lastLevel > currentLevel) {
            reloadTime = reloadTime + 50;
        } else if (lastLevel < currentLevel) {
            reloadTime = reloadTime - 50;
        }
        final newWeaponProperties : WeaponProperties = new WeaponProperties(reloadTime, weaponProperties.getTargetingTime(), weaponProperties.getSpeed().getUnscaled(), weaponProperties.getDamage() / lastLevel * currentLevel, weaponProperties.getDissipation());
        return newWeaponProperties;
    }

    public function downgrade(rtsLayer : RTSLayer) : Void {
        rtsLayer.setLevel(rtsLayer.getLevel() - 1);
        final partInterfaceArray : haxe.ds.Vector<PartInterface> = rtsLayer.getPartInterfaceArray();
        final size : Int = partInterfaceArray.length;
        var partInterface : BasicWeaponPart = null;
        {
            var index : Int = size;
            while (--index >= 0) {
            partInterface = (cast partInterfaceArray[index] : BasicWeaponPart);
            partInterface.setWeaponProperties(this.createWeaponProperties(partInterface.getWeaponProperties(), rtsLayer.getLevel(), rtsLayer.getLevel() + 1));
            }
        }
        rtsLayer.select();
    }

    public function upgrade(rtsLayer : RTSLayer) : Void {
        rtsLayer.setLevel(rtsLayer.getLevel() + 1);
        final partInterfaceArray : haxe.ds.Vector<PartInterface> = rtsLayer.getPartInterfaceArray();
        final size : Int = partInterfaceArray.length;
        var partInterface : BasicWeaponPart = null;
        {
            var index : Int = size;
            while (--index >= 0) {
            partInterface = (cast partInterfaceArray[index] : BasicWeaponPart);
            partInterface.setWeaponProperties(this.createWeaponProperties(partInterface.getWeaponProperties(), rtsLayer.getLevel(), rtsLayer.getLevel() - 1));
            }
        }
        rtsLayer.select();
    }

    private final MAX_RELOAD_TIME : haxe.Int64 = haxe.Int64.ofInt(Integer.MAX_VALUE) / 100000;
    public function getCostExponential(cost : haxe.Int64) : haxe.Int64 {
        return ((cost * cost * cost) / (cost * 1000));
    }

    private function getWeaponPropertiesCost(weaponProperties : WeaponProperties) : Int {
        var cost : haxe.Int64 = (weaponProperties.getDamage() + weaponProperties.getRange() + ((this.MAX_RELOAD_TIME / weaponProperties.getReloadTime()) >> 1));
        cost = this.getCostExponential(cost);
        return haxe.Int64.toInt(cost);
    }

    public function getCost(rtsLayer : RTSLayer) : Int {
        var total : Int = 0;
        final partInterfaceArray : haxe.ds.Vector<PartInterface> = rtsLayer.getPartInterfaceArray();
        final size : Int = partInterfaceArray.length;
        var partInterface : BasicWeaponPart = null;
        var weaponProperties : WeaponProperties = null;
        {
            var index : Int = size - 1;
            while (index >= 0) {
            partInterface = (cast partInterfaceArray[index] : BasicWeaponPart);
            weaponProperties = partInterface.getWeaponProperties();
            total += this.getWeaponPropertiesCost(weaponProperties);
                index--;
            }
        }
        return total;
    }

    public function getDowngradeCost(rtsLayer : RTSLayer) : Int {
        final partInterfaceArray : haxe.ds.Vector<PartInterface> = rtsLayer.getPartInterfaceArray();
        final size : Int = partInterfaceArray.length;
        var downgradeCost : Int = 0;
        var partInterface : BasicWeaponPart = null;
        var weaponProperties : WeaponProperties = null;
        var downgradeWeaponCost : Int = 0;
        var currentWeaponCost : Int = 0;
        {
            var index : Int = size - 1;
            while (index >= 0) {
            partInterface = (cast partInterfaceArray[index] : BasicWeaponPart);
            weaponProperties = partInterface.getWeaponProperties();
            downgradeWeaponCost = this.getWeaponPropertiesCost(this.createWeaponProperties(weaponProperties, rtsLayer.getLevel() - 1, rtsLayer.getLevel()));
            currentWeaponCost = this.getWeaponPropertiesCost(weaponProperties);
            downgradeCost += (currentWeaponCost - downgradeWeaponCost);
                index--;
            }
        }
        downgradeCost = Std.int(downgradeCost * 9 / 10);
        this.logUtil.putF(new StringMaker().append("Total Cost: ").appendint(downgradeCost).toString(), this, "getDowngradeCost");
        return downgradeCost;
    }

    public function getUpgradeCost(rtsLayer : RTSLayer) : Int {
        var upgradeCost : Int = 0;
        final partInterfaceArray : haxe.ds.Vector<PartInterface> = rtsLayer.getPartInterfaceArray();
        final size : Int = partInterfaceArray.length;
        var partInterface : BasicWeaponPart = null;
        var weaponProperties : WeaponProperties = null;
        var upgradedWeaponCost : Int = 0;
        var currentWeaponCost : Int = 0;
        {
            var index : Int = size - 1;
            while (index >= 0) {
            partInterface = (cast partInterfaceArray[index] : BasicWeaponPart);
            weaponProperties = partInterface.getWeaponProperties();
            upgradedWeaponCost = this.getWeaponPropertiesCost(this.createWeaponProperties(weaponProperties, rtsLayer.getLevel() + 1, rtsLayer.getLevel()));
            currentWeaponCost = this.getWeaponPropertiesCost(weaponProperties);
            upgradeCost += (upgradedWeaponCost - currentWeaponCost);
                index--;
            }
        }
        this.logUtil.putF(new StringMaker().append("Total Cost: ").appendint(upgradeCost).toString(), this, "getUpgradeCost");
        return upgradeCost;
    }

    // throws Exception
    public function destroyAndClear(list : BasicArrayList) : Void {
        var rtsLayer : RTSLayer = null;
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            rtsLayer = (cast list.get(index) : RTSLayer);
            rtsLayer.setDestroyed(true);
                index--;
            }
        }
        list.clear();
    }

    public function createFakeRTSLayerHashtable(baseRaceTrackGeographicMap : BaseRaceTrackGeographicMap) : ABHashtable<Any, Any> {
        final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
        final layerManager : FakeLayerManager = new FakeLayerManager(GameInfo.NONE);
        layerManager.setGeographicMapInterface(haxe.ds.Vector.fromArrayCopy([baseRaceTrackGeographicMap]));
        hashtable.put(AllBinaryGameLayerManager.ID, layerManager);
        hashtable.put(DirectionFactory.getInstance().NAME, DirectionFactory.getInstance().LEFT);
        hashtable.put(this.groupCommonFactory.ID, BasicGroupFactory.getInstance().NONE_ARRAY);
        return hashtable;
    }

    public function new() {
    }
}

