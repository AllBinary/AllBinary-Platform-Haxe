/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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


class CustomMapGeneratorBaseFactory {
    private static final instance : CustomMapGeneratorBaseFactory = new CustomMapGeneratorBaseFactory();
    public static function getInstance() : CustomMapGeneratorBaseFactory {
        return CustomMapGeneratorBaseFactory.instance;
    }

    public function new() {
    }

    // throws Exception
    public function create(raceTrackGeographicMap : RaceTrackGeographicMap) : CustomMapGeneratorBase {
        return new CustomMapGeneratorBase();
    }

}

