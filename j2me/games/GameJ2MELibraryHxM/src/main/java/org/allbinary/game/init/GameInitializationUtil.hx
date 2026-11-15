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

import org.allbinary.game.configuration.event.ChangedGameFeatureListener;
import org.allbinary.game.configuration.event.GameInitializedEvent;
import org.allbinary.game.configuration.event.GameInitializedEventHandler;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.MainFeatureFactory;
import org.allbinary.game.resource.ResourceLoadingLevelFactory;
import org.allbinary.graphics.displayable.MyCanvas;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;

class GameInitializationUtil {
    private static final instance : GameInitializationUtil = new GameInitializationUtil();
    public final EVENT : GameInitializedEvent;
    // throws Exception
    public function initDemo(abeClientInformation : AbeClientInformationInterface, canvas : MyCanvas, gameInitializationInterfaceFactoryInterface : BasicBuildGameInitializerFactory) : Void {
        final mainFeatureFactory : MainFeatureFactory = MainFeatureFactory.getInstance();
        if (ChangedGameFeatureListener.getInstance().isChangedFeature(mainFeatureFactory.STATIC)) {
            var gameInitializationInterface : GameInitializationInterface = gameInitializationInterfaceFactoryInterface.getInstance();
            var features : Features = Features.getInstance();
            if (features.isFeature(mainFeatureFactory.LOAD_ALL)) {
                this.initGame(abeClientInformation, canvas, gameInitializationInterfaceFactoryInterface);
            } else if (features.isFeature(mainFeatureFactory.LOAD_ONDEMAND)) {
                var resourceLoadingLevelFactory : ResourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance();
                gameInitializationInterface.init(abeClientInformation, canvas.getCustomCommandListener(), resourceLoadingLevelFactory.LOAD_EARLY.getLevel());
                this.EVENT.setResourceLoadingLevel(resourceLoadingLevelFactory.LOAD_EARLY);
            } else {
                throw new jre.lang.JavaException("No Loading Feature Available");
            }
            GameInitializedEventHandler.getInstance().fireEvent(this.EVENT);
        }
    }

    // throws Exception
    public function initGame(abeClientInformation : AbeClientInformationInterface, canvas : MyCanvas, gameInitializationInterfaceFactoryInterface : BasicBuildGameInitializerFactory) : Void {
        if (ChangedGameFeatureListener.getInstance().isChangedFeature(MainFeatureFactory.getInstance().STATIC)) {
            var gameInitializationInterface : GameInitializationInterface = gameInitializationInterfaceFactoryInterface.getInstance();
            var resourceLoadingLevelFactory : ResourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance();
            gameInitializationInterface.init(abeClientInformation, canvas.getCustomCommandListener(), resourceLoadingLevelFactory.LOAD_ALL.getLevel());
            this.EVENT.setResourceLoadingLevel(resourceLoadingLevelFactory.LOAD_ALL);
            GameInitializedEventHandler.getInstance().fireEvent(this.EVENT);
            ChangedGameFeatureListener.getInstance().remove(MainFeatureFactory.getInstance().STATIC);
        }
    }

    public static function getInstance() : GameInitializationUtil {
        return GameInitializationUtil.instance;
    }

    public function new() {
        this.EVENT = new GameInitializedEvent(this);
    }
}

