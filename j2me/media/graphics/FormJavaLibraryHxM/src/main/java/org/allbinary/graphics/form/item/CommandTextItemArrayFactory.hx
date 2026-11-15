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
package org.allbinary.graphics.form.item;

//import javax.microedition.lcdui.Command;
//import javax.microedition.lcdui.ImageItem;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.form.ScreenInfo;
import org.allbinary.logic.VectorUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.visitor.Visitor;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class CommandTextItemArrayFactory {
    private final list : BasicArrayList = new BasicArrayListD();
    private final visitorInterface : Visitor;
    public function new(visitorInterface : Visitor) {
        this.visitorInterface = visitorInterface;
    }

    public function getInstance(vector : Any, backgroundBasicColor : BasicColor, foregroundBasicColor : BasicColor) : haxe.ds.Vector<ABCustomItem> {
        final vectorUtil : VectorUtil = VectorUtil.getInstance();
        final size : Int = vectorUtil.getSize(vector);
        this.list.clear();
        var textItem : CommandTextItem = null;
        var priorityLimit : Int = 7;
        final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        final isLargeEnoughDisplayForBigMenu : Bool = (displayInfo.isPortrait() && displayInfo.getLastHeight() >= ScreenInfo.getInstance().MEDIUM_WIDTH) || (!displayInfo.isPortrait() && displayInfo.getLastWidth() >= ScreenInfo.getInstance().MEDIUM_WIDTH);
        if (!isLargeEnoughDisplayForBigMenu && size > 3) {
            priorityLimit = 3;
        }
        var command : Command = null;
        for (index in 0...size) {
            command = (cast vectorUtil.elementAt(vector, index) : Command);
            if (command.getPriority() < priorityLimit) {
                var aBoolean : Null<Bool> = (cast this.visitorInterface.visit(command) : Null<Bool>);
                if (aBoolean) {
                    textItem = new CommandTextItem(command, ImageItem.LAYOUT_DEFAULT, StringUtil.getInstance().EMPTY_STRING, backgroundBasicColor, foregroundBasicColor);
                    this.list.add(textItem);
                }
            }
        }
        final textItemArray : haxe.ds.Vector<ABCustomItem> = haxe.ds.Vector.fromArrayCopy([for (index in 0...this.list.size()) null]);
        final size2 : Int = textItemArray.length;
        for (index in 0...size2) {
            textItemArray[index] = (cast this.list.objectArray[index] : ABCustomItem);
        }
        return textItemArray;
    }

}

