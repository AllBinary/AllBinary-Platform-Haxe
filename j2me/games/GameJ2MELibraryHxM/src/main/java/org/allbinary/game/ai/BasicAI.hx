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
package org.allbinary.game.ai;

import org.allbinary.ai.ArtificialIntelligence;
import org.allbinary.game.displayable.canvas.CanvasUtil;
import org.allbinary.game.input.GameInput;
import org.allbinary.game.input.GameKeyEventSourceInterface;
import org.allbinary.game.input.event.GameKeyEventFactory;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class BasicAI extends ArtificialIntelligence implements GameKeyEventSourceInterface {
    public static final AI_VISITOR : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(2);
    public static final ID : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(1);
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final gameKeyEventFactory : GameKeyEventFactory = GameKeyEventFactory.getInstance();
    private final ownerLayerInterface : AllBinaryLayer;
    private final gameInput : GameInput;
    private var lastKey : Int = -1;
    public function new(ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super();
        this.ownerLayerInterface = ownerLayerInterface;
        this.gameInput = gameInput;
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        throw new jre.lang.JavaException(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function processKeyAI(key : Int) : Void {
        if (key != -1) {
            this.gameInput.add(this.gameKeyEventFactory.getInstanceForKey(this, key));
        }
    }

    public function setLastKey(lastKey : Int) : Void {
        this.lastKey = lastKey;
    }

    public function getLastKey() : Int {
        return this.lastKey;
    }

    public function getOwnerLayerInterface() : AllBinaryLayer {
        return this.ownerLayerInterface;
    }

    public function getGameInput() : GameInput {
        return this.gameInput;
    }

    public function getName() : String {
        return Type.getClassName(Type.getClass(this));
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
        stringBuffer.append(this.getName());
        stringBuffer.append(" LastKey: ");
        stringBuffer.append(CanvasUtil.getKeyName(this.getLastKey()));
        return Std.string(stringBuffer);
    }

    public override function getSourceId() : Int {
        return 1;
    }

}

