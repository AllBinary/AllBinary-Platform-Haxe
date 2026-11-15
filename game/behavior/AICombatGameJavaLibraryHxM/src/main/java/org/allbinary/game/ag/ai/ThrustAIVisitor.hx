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
package org.allbinary.game.ag.ai;

//import javax.microedition.lcdui.Canvas;
import org.allbinary.game.ai.BasicAI;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.util.visitor.Visitor;
import org.allbinary.string.CommonStrings;

class ThrustAIVisitor extends Visitor {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final TRUE : Null<Bool> = BooleanFactory.getInstance().TRUE;
    public function new() {
        super();
    }

    public override function visit(anyType : Any) : Any {
        try {
            var basicAI : BasicAI = (cast anyType : BasicAI);
            basicAI.processKeyAI(Canvas.UP);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.VISIT, e);
        }
        return this.TRUE;
    }

}

