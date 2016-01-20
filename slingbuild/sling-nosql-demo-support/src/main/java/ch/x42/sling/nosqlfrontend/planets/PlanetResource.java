package ch.x42.sling.nosqlfrontend.planets;

import java.util.HashMap;

import org.apache.sling.api.resource.AbstractResource;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceMetadata;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.resource.ValueMap;
import org.apache.sling.api.wrappers.ValueMapDecorator;
import org.apache.sling.adapter.annotations.Adaptable;
import org.apache.sling.adapter.annotations.Adapter;

/** A Sling Resource that represents a planet
*  Adapted from the Sling launchpad/test-services module.
*/   
@Adaptable(
        adaptableClass=Resource.class, 
        adapters={ @Adapter({ValueMap.class}) }
)
public class PlanetResource extends AbstractResource implements Resource {

    private final String path;
    private final ResourceMetadata metadata;
    private final ValueMap valueMap;
    private final ResourceResolver resolver;
    
    public static final String RESOURCE_TYPE = "sling/nosqldemo/planet";
    
    static class PlanetValueMap extends ValueMapDecorator {
        PlanetValueMap(String name, int distance) {
            super(new HashMap<String, Object>());
            put("name", name);
            put("distance", distance);
        }
    }
    
    PlanetResource(ResourceResolver resolver, String path, ValueMap valueMap) {
        this.path = path;
                
        this.valueMap = valueMap;
        this.resolver = resolver;
        
        metadata = new ResourceMetadata();
        metadata.setResolutionPath(path);
    }
    
    @Override
    public String toString() {
        return getClass().getSimpleName() + " " + path;
    }
    
    public String getPath() {
        return path;
    }

    public ResourceMetadata getResourceMetadata() {
        return metadata;
    }

    public ResourceResolver getResourceResolver() {
        return resolver;
    }

    public String getResourceSuperType() {
        return null;
    }

    public String getResourceType() {
        return RESOURCE_TYPE;
    }
    
    @Override
    @SuppressWarnings("unchecked")
    public <AdapterType> AdapterType adaptTo(Class<AdapterType> type) {
        if(type == ValueMap.class) {
            return (AdapterType)valueMap;
        }
        return super.adaptTo(type);
    }
}