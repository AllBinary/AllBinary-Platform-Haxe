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

//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.OutputStream;
//import java.io.Reader;
//import java.io.Writer;
//import java.nio.CharBuffer;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
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
        return /* anonymous class body:
            // throws IOException
            public function write(b : Int) : Void {
            }

            // throws IOException
            public function write(b : haxe.ds.Vector<Int>, off : Int, len : Int) : Void {
            }

            public function close() : Void {
            }

*/ new OutputStream();
    }

    public static function nullWriter() : Writer {
        return /* anonymous class body:
            private var closed : Bool = false;
            // throws IOException
            public function append(c : Int) : Writer {
                return this;
            }

            // throws IOException
            public function append(csq : CharSequence) : Writer {
                return this;
            }

            // throws IOException
            public function append(csq : CharSequence, start : Int, end : Int) : Writer {
                return this;
            }

            // throws IOException
            public function write(c : Int) : Void {
            }

            // throws IOException
            public function write(cbuf : haxe.ds.Vector<Int>, off : Int, len : Int) : Void {
            }

            // throws IOException
            public function write(str : String) : Void {
            }

            // throws IOException
            public function write(str : String, off : Int, len : Int) : Void {
            }

            // throws IOException
            public function flush() : Void {
            }

            // throws IOException
            public function close() : Void {
            }

*/ new Writer();
    }

    public static function nullReader() : Reader {
        return /* anonymous class body:
            // throws IOException
            public function read() : Int {
                return -1;
            }

            // throws IOException
            public function read(cbuf : haxe.ds.Vector<Int>, off : Int, len : Int) : Int {
                return -1;
            }

            // throws IOException
            public function read(target : CharBuffer) : Int {
                return -1;
            }

            // throws IOException
            public function ready() : Bool {
                return false;
            }

            // throws IOException
            public function skip(n : haxe.Int64) : haxe.Int64 {
                return haxe.Int64.ofInt(0);
            }

            public function close() : Void {
            }

*/ new Reader();
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
            final s : String = haxe.io.Bytes.ofData(byteArray, startIndex, (index + includeReturnLine - returnLine - startIndex)).toString();
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
        return stringMaker.toString();
    }

    public function new() {
    }
}

