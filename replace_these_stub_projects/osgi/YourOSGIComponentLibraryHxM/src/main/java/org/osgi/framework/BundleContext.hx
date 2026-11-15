// Generated Code Do Not Modify
package org.osgi.framework;

//import java.util.Dictionary;

interface BundleContext {
    function getBundles() : haxe.ds.Vector<Bundle>;

    // throws BundleException
    function installBundle(location : String) : Bundle;

    function registerService(clazz : String, service : Any, properties : Dictionary) : ServiceRegistration;

    function getService(reference : ServiceReference) : Any;

    // throws InvalidSyntaxException
    function getServiceReferences(clazz : String, filter : String) : haxe.ds.Vector<ServiceReference>;

    function getServiceReference(clazz : String) : ServiceReference;

}

