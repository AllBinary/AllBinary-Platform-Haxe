/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
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
package org.allbinary.media.graphics.geography.map.racetrack;

import org.allbinary.graphics.color.BasicColor;

class RaceTrackInfo {
    private var id : Null<Int>;
    private var name : String;
    private var raceTrackFrictionProperties : RaceTrackFrictionProperties;
    private var foregroundBasicColor : BasicColor;
    private var backgroundBasicColor : BasicColor;
    private var qualifyTime : Int;
    private var worstContinuePosition : Int;
    private var totalLaps : Int;
    public function new(id : Null<Int>, name : String, raceTrackFrictionProperties : RaceTrackFrictionProperties, foregroundBasicColor : BasicColor, backgroundBasicColor : BasicColor, qualifyTime : Int, worstContinuePosition : Int, totalLaps : Int) {
        this.id = id;
        this.name = name;
        this.raceTrackFrictionProperties = raceTrackFrictionProperties;
        this.backgroundBasicColor = backgroundBasicColor;
        this.foregroundBasicColor = foregroundBasicColor;
        this.qualifyTime = qualifyTime;
        this.worstContinuePosition = worstContinuePosition;
        this.totalLaps = totalLaps;
    }

    public function getId() : Null<Int> {
        return this.id;
    }

    private function setId(id : Null<Int>) : Void {
        this.id = id;
    }

    public function getName() : String {
        return this.name;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    public function getQualifyTime() : Int {
        return this.qualifyTime;
    }

    public function setQualifyTime(qualifyTime : Int) : Void {
        this.qualifyTime = qualifyTime;
    }

    public function getWorstContinuePosition() : Int {
        return this.worstContinuePosition;
    }

    public function setWorstContinuePosition(worstContinuePosition : Int) : Void {
        this.worstContinuePosition = worstContinuePosition;
    }

    public function getTotalLaps() : Int {
        return this.totalLaps;
    }

    public function setTotalLaps(totalLaps : Int) : Void {
        this.totalLaps = totalLaps;
    }

    public function getForegroundBasicColor() : BasicColor {
        return this.foregroundBasicColor;
    }

    public function setForegroundBasicColor(foregroundBasicColor : BasicColor) : Void {
        this.foregroundBasicColor = foregroundBasicColor;
    }

    public function getBackgroundBasicColor() : BasicColor {
        return this.backgroundBasicColor;
    }

    public function setBackgroundBasicColor(backgroundBasicColor : BasicColor) : Void {
        this.backgroundBasicColor = backgroundBasicColor;
    }

    public function getRaceTrackFrictionProperties() : RaceTrackFrictionProperties {
        return this.raceTrackFrictionProperties;
    }

    public function setRaceTrackFrictionProperties(raceTrackFrictionProperties : RaceTrackFrictionProperties) : Void {
        this.raceTrackFrictionProperties = raceTrackFrictionProperties;
    }

}

