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

import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class AdvancedPlayerOwnedRTSLayers extends PlayerOwnedRTSLayers {
    private final unitsList : BasicArrayList = new BasicArrayListD();
    private final waypointsList : BasicArrayList = new BasicArrayListD();
    private final buildingList : BasicArrayList = new BasicArrayListD();
    private final baseList : BasicArrayList = new BasicArrayListD();
    private final garrisonList : BasicArrayList = new BasicArrayListD();
    private final houseList : BasicArrayList = new BasicArrayListD();
    private final labList : BasicArrayList = new BasicArrayListD();
    private final factoryList : BasicArrayList = new BasicArrayListD();
    public function addUnit(rtsLayer : RTSLayer) : Void {
        this.unitsList.add(rtsLayer);
        this.rtsLayerList.add(rtsLayer);
    }

    public function addWaypoint(rtsLayer : RTSLayer) : Void {
        this.waypointsList.add(rtsLayer);
        this.rtsLayerList.add(rtsLayer);
    }

    public function addBase(rtsLayer : RTSLayer) : Void {
        this.baseList.add(rtsLayer);
        this.buildingList.add(rtsLayer);
        this.rtsLayerList.add(rtsLayer);
    }

    public function addGarrison(rtsLayer : RTSLayer) : Void {
        this.garrisonList.add(rtsLayer);
        this.buildingList.add(rtsLayer);
        this.rtsLayerList.add(rtsLayer);
    }

    public function addHouse(rtsLayer : RTSLayer) : Void {
        this.houseList.add(rtsLayer);
        this.buildingList.add(rtsLayer);
        this.rtsLayerList.add(rtsLayer);
    }

    public function addLab(rtsLayer : RTSLayer) : Void {
        this.labList.add(rtsLayer);
        this.buildingList.add(rtsLayer);
        this.rtsLayerList.add(rtsLayer);
    }

    public function addFactory(rtsLayer : RTSLayer) : Void {
        this.factoryList.add(rtsLayer);
        this.buildingList.add(rtsLayer);
        this.rtsLayerList.add(rtsLayer);
    }

    public function removeUnit(gameLayer : AllBinaryGameLayer) : Void {
        this.unitsList.remove(gameLayer);
        this.rtsLayerList.remove(gameLayer);
    }

    public function removeWaypoint(gameLayer : AllBinaryGameLayer) : Void {
        this.waypointsList.remove(gameLayer);
        this.rtsLayerList.remove(gameLayer);
    }

    public function getUnitsList() : BasicArrayList {
        return this.unitsList;
    }

    public function getWaypointsList() : BasicArrayList {
        return this.waypointsList;
    }

    public function getBaseList() : BasicArrayList {
        return this.baseList;
    }

    public function getGarrisonList() : BasicArrayList {
        return this.garrisonList;
    }

    public function getHouseList() : BasicArrayList {
        return this.houseList;
    }

    public function getLabList() : BasicArrayList {
        return this.labList;
    }

    public function getFactoryList() : BasicArrayList {
        return this.factoryList;
    }

    public function getTotalBuildings() : Int {
        return this.baseList.size() + this.garrisonList.size() + this.houseList.size() + this.labList.size() + this.factoryList.size();
    }

    public function removeBuilding(layerInterface : AllBinaryGameLayer) : Void {
        this.buildingList.add(layerInterface);
        if (this.getBaseList().remove(layerInterface)) {
            this.rtsLayerList.remove(layerInterface);
        } else if (this.getFactoryList().remove(layerInterface)) {
            this.rtsLayerList.remove(layerInterface);
        } else if (this.getGarrisonList().remove(layerInterface)) {
            this.rtsLayerList.remove(layerInterface);
        } else if (this.getLabList().remove(layerInterface)) {
            this.rtsLayerList.remove(layerInterface);
        } else if (this.getHouseList().remove(layerInterface)) {
            this.rtsLayerList.remove(layerInterface);
        }
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(super.toString());
        stringBuffer.append(" Bases: ");
        stringBuffer.appendint(this.getBaseList().size());
        stringBuffer.append(" Factory: ");
        stringBuffer.appendint(this.getFactoryList().size());
        stringBuffer.append(" Garrison: ");
        stringBuffer.appendint(this.getGarrisonList().size());
        stringBuffer.append(" Labs: ");
        stringBuffer.appendint(this.getLabList().size());
        stringBuffer.append(" Houses: ");
        stringBuffer.appendint(this.getHouseList().size());
        stringBuffer.append(" Waypoints: ");
        stringBuffer.appendint(this.getWaypointsList().size());
        stringBuffer.append(" Units: ");
        stringBuffer.appendint(this.getUnitsList().size());
        return stringBuffer.toString();
    }

    public function getBuildingList() : BasicArrayList {
        return this.buildingList;
    }

    public function new() {
        super();
    }
}

