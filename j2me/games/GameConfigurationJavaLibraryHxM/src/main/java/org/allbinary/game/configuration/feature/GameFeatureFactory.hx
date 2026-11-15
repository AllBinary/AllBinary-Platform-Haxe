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


class GameFeatureFactory {
    private static final instance : GameFeatureFactory = new GameFeatureFactory();
    public static function getInstance() : GameFeatureFactory {
        return GameFeatureFactory.instance;
    }

    public function new() {
    }

    public final SOUND : GameFeature = new GameFeature("Sound");
    public final MUSIC : GameFeature = new GameFeature("Music");
    public final SCREEN_SHAKE : Feature = new Feature("Screen Shake");
    public final POST_IMAGE_LOADING_MODIFICATION : Feature = new Feature("Post Image Loading Modification (Scaling, Rotation, or Other)");
    public final HEALTH_BARS : GameFeature = new GameFeature("Health Bars");
    public final DAMAGE_FLOATERS : GameFeature = new GameFeature("Damage Floaters");
    public final GAME_INPUT_LAYER_PROCESSOR : GameFeature = new GameFeature("Game Input Layer Processor");
    public final ARTIFICIAL_INTELLEGENCE_PROCESSOR : GameFeature = new GameFeature("Artificial Intelligence Layer Processor");
    public final COLLIDABLE_INTERFACE_LAYER_PROCESSOR : GameFeature = new GameFeature("Collidable Interface Layer Processor");
    public final TICKABLE_LAYER_PROCESSOR : GameFeature = new GameFeature("Tickable Layer Processor");
    public final CHEATING : GameFeature = new GameFeature("Cheating");
    public final DROPPED_ITEMS : GameFeature = new GameFeature("Drops");
    public final DROPPED_ITEMS_FROM_DEATH : GameFeature = new GameFeature("Drops from Dead");
    public final TEST_DESTROYED_LAYER_PROCESSOR : GameFeature = new GameFeature("Destroyed Layer Processor");
    public final COLLISIONS_WITH_SOURCE : GameFeature = new GameFeature("Allow Collisions With Source");
    public final COLLISIONS_FORCED_TWO_DIMENSIONAL : GameFeature = new GameFeature("Collisions Forced Two Dimensional");
}

