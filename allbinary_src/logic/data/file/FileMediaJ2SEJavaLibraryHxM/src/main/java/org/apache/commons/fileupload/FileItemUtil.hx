// Generated Code Do Not Modify
package org.apache.commons.fileupload;

//import java.io.ByteArrayOutputStream;
//import java.io.InputStream;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.AbFileNativeUtil;
import org.allbinary.logic.string.StringMaker;

class FileItemUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : FileItemUtil = new FileItemUtil();
    public static function getInstance() : FileItemUtil {
        return FileItemUtil.instance;
    }

    public final DEFAULT_CHARSET : String = "ISO-8859-1";
    // throws Exception
    public function getString(byteArray : haxe.ds.Vector<Int>) : String {
        return haxe.io.Bytes.ofData(byteArray, this.DEFAULT_CHARSET).toString();
    }

    // throws Exception
    public function getString(fileItem : FileItemStream) : String {
        return new String(this.getBytes(fileItem), DEFAULT_CHARSET);
    }

    // throws Exception
    public function getBytes(fileItem : FileItemStream) : haxe.ds.Vector<Int> {
        final streamUtil : StreamUtil = StreamUtil.getInstance();
        var inputStream : InputStream = null;
        var outputStream : ByteArrayOutputStream = null;
        try {
            inputStream = fileItem.openStream();
            outputStream = new ByteArrayOutputStream();
            if (fileItem.isFormField()) {
                this.logUtil.putF("FileItemStream FieldName: " + fileItem.getFieldName(), this, "write()");
            } else {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Uploaded File FieldName: ");
                stringBuffer.append(fileItem.getFieldName());
                stringBuffer.append(" name = ");
                stringBuffer.append(fileItem.getName());
                this.logUtil.putF(stringBuffer.toString(), this, "write()");
            }
            outputStream = (cast streamUtil.get(inputStream, outputStream, haxe.ds.Vector.fromArrayCopy([for (index in 0...16384) 0])) : ByteArrayOutputStream);
            return outputStream.toByteArray();
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            streamUtil.close(outputStream);
            streamUtil.close(inputStream);
        }
    }

    // throws Exception
    public function write(fileItem : FileItem, file : AbFile) : Void {
        fileItem.write(AbFileNativeUtil.get(file));
    }

    public function new() {
    }
}

