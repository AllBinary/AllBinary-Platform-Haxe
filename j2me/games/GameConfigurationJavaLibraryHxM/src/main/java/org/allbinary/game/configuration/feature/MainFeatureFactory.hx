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
package org.allbinary.game.configuration.feature;


class MainFeatureFactory {
    private static final instance : MainFeatureFactory = new MainFeatureFactory();
    public static function getInstance() : MainFeatureFactory {
        return MainFeatureFactory.instance;
    }

    public final FULL_SCREEN : Feature = new Feature("Full Screen");
    public final TITLE_BAR : Feature = new Feature("Title Bar");
    public final STATIC : Feature = new Feature("Static Dependent Feature");
    public final LOAD_ONDEMAND : Feature = new Feature("Load OnDemand");
    public final LOAD_ALL : Feature = new Feature("Load All");
    public function new() {
    }
}

