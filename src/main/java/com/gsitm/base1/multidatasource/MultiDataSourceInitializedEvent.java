package com.gsitm.base1.multidatasource;

import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.context.ApplicationEvent;

/**
 * @author
 */
@SuppressWarnings("serial")
public class MultiDataSourceInitializedEvent extends ApplicationEvent {
    private String dataSourceName;
    private DataSourceProperties dataSourceProperties;
    /**
     * Create a new {@link MultiDataSourceInitializedEvent}.
     * @param source the source {@link javax.sql.DataSource}.
     */
    public MultiDataSourceInitializedEvent(javax.sql.DataSource source, String dataSourceName, DataSourceProperties dataSourceProperties) {
        super(source);
        this.dataSourceName = dataSourceName;
        this.dataSourceProperties = dataSourceProperties;
    }

    public DataSourceProperties getDataSourceProperties() {
        return dataSourceProperties;
    }

    public String getDataSourceName() {
        return dataSourceName;
    }
}