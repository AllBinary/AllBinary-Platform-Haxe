/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.logic.io.file;

import jre.io.ByteArrayOutputStream;
import jre.io.InputStream;
import jre.io.OutputStream;
import jre.io.Reader;
import jre.io.Writer;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.NullOutputStream;
import org.allbinary.logic.io.NullReader;
import org.allbinary.logic.io.NullWriter;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class SimpleFileUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : SimpleFileUtil = new SimpleFileUtil();
    public static function getInstance() : SimpleFileUtil {
        return SimpleFileUtil.instance;
    }

    public static function nullOutputStream() : OutputStream {
        return NullOutputStream.NULL_OUTPUT_STREAM;
    }

    public static function nullWriter() : Writer {
        return NullWriter.NULL_WRITER;
    }

    public static function nullReader() : Reader {
        return NullReader.NULL_READER;
    }

    public final NULL_WRITER : Writer = SimpleFileUtil.nullWriter();
    public final NULL_READER : Reader = SimpleFileUtil.nullReader();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final nullUtil : NullUtil = NullUtil.getInstance();
    private final streamUtil : StreamUtil = StreamUtil.getInstance();
    public function loadFileAsList(inputStream : InputStream, max : Int, byteArray1 : haxe.ds.Vector<Int>) : BasicArrayList {
        return this.loadFileAsListReturnLine(inputStream, max, byteArray1, 0);
    }

    public function loadFileAsListReturnLine(inputStream : InputStream, max : Int, byteArray1 : haxe.ds.Vector<Int>, includeReturnLine : Int) : BasicArrayList {
        final stringList : BasicArrayList = new BasicArrayListD();
        if (inputStream == null) {
            return stringList;
        }
        var byteArray : haxe.ds.Vector<Int> = this.nullUtil.NULL_BYTE_ARRAY;
        try {
            final outputStream2 : ByteArrayOutputStream = new ByteArrayOutputStream(max);
            byteArray = this.streamUtil.getByteArray(inputStream, outputStream2, byteArray1);
            this.streamUtil.close(inputStream);
        } catch (e : haxe.Exception) {
            this.streamUtil.close(inputStream);
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.ADD, e);
        }
        if (byteArray == null) {
            return stringList;
        }
        final size : Int = byteArray.length;
        var index : Int = 0;
        var startIndex : Int = 0;
        var returnLine : Int = 0;
        while (index < size) {
            startIndex = index;
            while (index < size - 1 && byteArray[index] != "\n".code) {
                index++;
            }
            if (includeReturnLine == 0) {
                if (index > 0 && byteArray[index - 1] == "\r".code) {
                    returnLine = 1;
                } else {
                    returnLine = 0;
                }
            }
            final s : String = jre.lang.JavaString.fromBytes(byteArray, startIndex, (index + includeReturnLine - returnLine - startIndex));
            stringList.add(s);
            index++;
        }
        return stringList;
    }

    public function createStringFromArrayOfStrings(stringArray : haxe.ds.Vector<String>) : String {
        final stringMaker : StringMaker = new StringMaker();
        final size : Int = stringArray.length;
        for (index in 0...size) {
            stringMaker.append(stringArray[index]);
        }
        return Std.string(stringMaker);
    }

    public function new() {
    }
}

