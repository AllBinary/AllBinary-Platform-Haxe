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
package org.allbinary.game.init;

import javax.microedition.lcdui.CommandListener;
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.game.configuration.event.ChangedGameFeatureListener;
import org.allbinary.game.configuration.feature.InputFeatureFactory;
import org.allbinary.game.configuration.feature.MainFeatureFactory;
import org.allbinary.game.input.PlatformInputMappingFactory;
import org.allbinary.game.input.event.GameKeyEventFactory;
import org.allbinary.game.resource.FeaturedResourceRelativeRelationshipFactory;
import org.allbinary.game.resource.ResourceInitialization;
import org.allbinary.game.resource.ResourceLoadingLevelFactory;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.image.GameFeatureImageCacheFactory;
import org.allbinary.input.motion.CompleteMotionGestureInputToGameMotionGestureInput;
import org.allbinary.input.motion.button.BasicTouchInputFactory;
import org.allbinary.input.motion.button.CancelTouchButtonInputFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;

class BaseGameInitialization implements GameInitializationInterface {
    public static final NULL_BASE_GAME_INITIALIZATION : BaseGameInitialization = new BaseGameInitialization(haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]), 0);
    public final resourceInitializationArray : haxe.ds.Vector<ResourceInitialization>;
    private final portion : Int;
    private var initialized : Bool = false;
    public final EARLY_RESOURCES : Int = 0;
    public final GAME_RESOURCES : Int = 1;
    public final EARLY_CHANGABLE_RESOURCES : Int = 2;
    public final GAME_CHANGABLE_RESOURCES : Int = 3;
    public function new(resourceInitializationArray : haxe.ds.Vector<ResourceInitialization>, portion : Int) {
        this.resourceInitializationArray = resourceInitializationArray;
        this.portion = portion;
    }

    // throws Exception
    public function initKey(portion : Int) : Void {
    }

    // throws Exception
    public function initKeyMapping(abeClientInformation : AbeClientInformationInterface, portion : Int) : Void {
        if (ChangedGameFeatureListener.getInstance().isChangedFeature(InputFeatureFactory.getInstance().INPUT_MAPPING)) {
            PlatformInputMappingFactory.getInstance().getPersistentInputMappingInstance().init(abeClientInformation);
            ProgressCanvasFactory.getInstance().addNormalPortion(50, "Game Keys");
            ChangedGameFeatureListener.getInstance().remove(InputFeatureFactory.getInstance().INPUT_MAPPING);
        }
    }

    // throws Exception
    public function init(abeClientInformation : AbeClientInformationInterface, commandListener : CommandListener, level : Int) : Void {
        final resourceLoadingLevelFactory : ResourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance();
        if (!this.isInitialized() && (level == resourceLoadingLevelFactory.LOAD_ALL.getLevel() || level == resourceLoadingLevelFactory.LOAD_EARLY.getLevel())) {
            var localPortion : Int = 40;
            if (level == resourceLoadingLevelFactory.LOAD_EARLY.getLevel()) {
                localPortion = 8;
            }
            this.setInitialized(true);
            this.initKey(this.getPortion());
            this.initKeyMapping(abeClientInformation, this.getPortion());
            GameKeyEventFactory.getInstance().init();
            final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
            progressCanvas.addNormalPortion(localPortion, "Game Key Events");
            BasicTouchInputFactory.getInstance().init(PlatformInputMappingFactory.getInstance().getPersistentInputMappingInstance().getInputMapping());
            CancelTouchButtonInputFactory.getInstance();
            progressCanvas.addNormalPortion(localPortion, "Touch Input");
            CompleteMotionGestureInputToGameMotionGestureInput.getInstance().init();
            progressCanvas.addNormalPortion(localPortion, "Motion Input");
            GameFeatureImageCacheFactory.init();
            progressCanvas.addNormalPortion(localPortion, "Image Cache");
            this.resourceInitializationArray[this.EARLY_RESOURCES].init();
        }
    }

    private var gameInitialized : Bool = false;
    private var allLoaded : Bool = false;
    // throws Exception
    public function resourceInitialization(level : Int) : Void {
        var resourceLoadingLevelFactory : ResourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance();
        if (this.resourceAnimationChange() && level == resourceLoadingLevelFactory.LOAD_EARLY.getLevel()) {
            this.clearResources();
            this.resourceInitializationArray[this.EARLY_CHANGABLE_RESOURCES].init();
        }
        if (this.resourceAnimationChange() && level == resourceLoadingLevelFactory.LOAD_ALL.getLevel()) {
            if (this.allLoaded) {
                this.clearResources();
            }
            if (FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().getList().size() == 0) {
                this.resourceInitializationArray[this.EARLY_CHANGABLE_RESOURCES].init();
            }
            this.resourceInitializationArray[this.GAME_CHANGABLE_RESOURCES].init();
            this.allLoaded = true;
        }
    }

    public function resourceAnimationChange() : Bool {
        var changedGameFeatureListener : ChangedGameFeatureListener = ChangedGameFeatureListener.getInstance();
        var gameConfigurationCentral : GameConfigurationCentral = GameConfigurationCentral.getInstance();
        if (changedGameFeatureListener.isChangedGameConfiguration(gameConfigurationCentral.SCALE)) {
            return true;
        }
        if (ChangedGameFeatureListener.getInstance().isChangedFeature(MainFeatureFactory.getInstance().STATIC)) {
            return true;
        }
        return false;
    }

    private function clearResources() : Void {
        this.allLoaded = false;
        GameFeatureImageCacheFactory.releaseAll();
        var featuredAnimationInterfaceFactoryInterfaceFactory : FeaturedAnimationInterfaceFactoryInterfaceFactory = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance();
        featuredAnimationInterfaceFactoryInterfaceFactory.clear();
        FeaturedResourceRelativeRelationshipFactory.getInstance().clear();
    }

    public function setGameInitialized(gameInitialized : Bool) : Void {
        this.gameInitialized = gameInitialized;
    }

    public function isGameInitialized() : Bool {
        return this.gameInitialized;
    }

    public function getPortion() : Int {
        return this.portion;
    }

    public function setInitialized(initialized : Bool) : Void {
        this.initialized = initialized;
    }

    public function isInitialized() : Bool {
        return this.initialized;
    }

}

