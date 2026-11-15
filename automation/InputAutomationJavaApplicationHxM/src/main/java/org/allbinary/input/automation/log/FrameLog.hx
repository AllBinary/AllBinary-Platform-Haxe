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
package org.allbinary.input.automation.log;

//import java.io.File;
//import java.io.FileOutputStream;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.input.automation.ImageOutputData;
import org.allbinary.logic.java.number.LongUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class FrameLog {
    private static var frameBytes : haxe.ds.Vector<Int> = "Frame: ".getBytes();
    private static var info : haxe.ds.Vector<Int> = "Info: \n".getBytes();
    private static var actions : haxe.ds.Vector<Int> = "Actions: \n".getBytes();
    private final frame : Null<haxe.Int64>;
    private var infoStringBuffer : StringMaker = new StringMaker();
    private var actionsStringBuffer : StringMaker = new StringMaker();
    public function new(frame : Null<haxe.Int64>) {
        this.frame = frame;
    }

    public function addInfo(infoString : String) : Void {
        this.infoStringBuffer.append(infoString);
    }

    public function addActions(vectorOfStrings : BasicArrayList) : Void {
        final size : Int = vectorOfStrings.size();
        for (index in 0...size) {
            this.addAction((cast vectorOfStrings.get(index) : String));
        }
    }

    public function addAction(action : String) : Void {
        this.actionsStringBuffer.append(action);
        this.actionsStringBuffer.append(CommonSeps.getInstance().NEW_LINE);
    }

    // throws Exception
    public function write() : Void {
        var filePathStringBuffer : StringMaker = new StringMaker();
        filePathStringBuffer.append(ImageOutputData.SAVE_PATH);
        filePathStringBuffer.append(LongUtil.fillIn(this.frame.toString()));
        filePathStringBuffer.append(".txt");
        var filePath : String = filePathStringBuffer.toString();
        var fileOutputStream : FileOutputStream = new FileOutputStream(new File(filePath));
        fileOutputStream.write(FrameLog.frameBytes);
        fileOutputStream.write(haxe.io.Bytes.ofString(getFrame().toString()));
        fileOutputStream.write("\n".code);
        fileOutputStream.write(FrameLog.info);
        fileOutputStream.write(haxe.io.Bytes.ofString(this.infoStringBuffer.toString()));
        fileOutputStream.write("\n".code);
        fileOutputStream.write(FrameLog.actions);
        fileOutputStream.write(haxe.io.Bytes.ofString(this.actionsStringBuffer.toString()));
        fileOutputStream.close();
    }

    public function getFrame() : Null<haxe.Int64> {
        return this.frame;
    }

}

