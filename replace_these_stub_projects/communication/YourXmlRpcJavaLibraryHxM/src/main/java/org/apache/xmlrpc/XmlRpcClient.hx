// Generated Code Do Not Modify
package org.apache.xmlrpc;

//import java.io.IOException;
//import java.net.MalformedURLException;
//import java.net.URL;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.init.crypt.jcehelper.CryptInterface;
import org.allbinary.logic.NullUtil;

class XmlRpcClient implements XmlRpcHandler {
    private final url : URL;
    public function new(url : String) {
        this.url = new URL(url);
    }

    public function getURL() : URL {
        return this.url;
    }

    public function setBasicAuthentication(user : String, password : String) : Void {
    }

    // throws XmlRpcException, IOException
    public function execute(method : String, params : BasicArrayList) : Any {
        return NullUtil.getInstance().NULL_OBJECT;
    }

    // throws XmlRpcException, IOException
    public function execute(method : String, params : BasicArrayList, cryptInterface : CryptInterface) : Any {
        return NullUtil.getInstance().NULL_OBJECT;
    }

}

